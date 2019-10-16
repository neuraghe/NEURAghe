import gv
import collections
import configparser
import cgra.Tile
import cgra.globalControl
import combinational.Network
import combinational.network
import mem.memory
import ico.gv_router

class Cgra(combinational.Network.Network):

    confFile = None
    nbTiles = 1
    programMemSize = 16*1024
    regFileSize = 8
    nbRows = 1

    def build(self):

        self.newPort('in')

        maxNbTiles = 32
        lsuTiles = []

        if self.confFile:
            config = configparser.SafeConfigParser(dict_type=collections.OrderedDict)
            config.optionxform = str
            openedPaths = config.read(self.confFile)
            if len(openedPaths) == 0:
                print(("Didn't manage to open config file: %s" % (cgraFile)))
                raise BaseException

            for section in config.sections():
                if section == 'global':
                    for (key, value) in config.items(section):
                        if key == 'nbTiles':
                            self.nbTiles = eval(value)
                        elif key == 'programMemSize':
                            self.programMemSize = eval(value)
                        elif key == 'nbRows':
                            self.nbRows = eval(value)
                        elif key == 'regFileSize':
                            self.regFileSize = eval(value)
                        else:
                            raise BaseException('Unknown item %s in section %s' % (key, section))
                elif section.find('tile') == 0:
                    tileNb = int(section.replace('tile', ''))
                    for (key, value) in config.items(section):
                        if key == 'hasLsu':
                            lsuTiles.append(tileNb)
                        else:
                            raise BaseException('Unknown item %s in section %s' % (key, section))
                    
                else:
                    raise BaseException('Unknown section %s' % (section))

        if self.nbTiles > maxNbTiles:
            raise BaseException('Non supportted number of tiles (must be <= 32): %d' % (maxNbTiles))

        network = self.newComp(className=combinational.network.Network, compName="network")

        # Crossbar for routing to per-tile config area
        # or global config area
        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico')

        # Instruction memory
        pmem = self.newComp(className=mem.memory.Memory, compName="pmem", size=self.programMemSize)
        xbar.getPort('out').mapTo(base=0x00100000, size=self.programMemSize, removeOffset=0x00100000, port=pmem.getPort('in'))

        # Global config
        conf = self.newComp(className=cgra.globalControl.GlobalControl, compName="conf", nbTiles=self.nbTiles)
        xbar.getPort('out').mapTo(base=maxNbTiles*0x100, size=0x100, removeOffset=maxNbTiles*0x100, port=conf.getPort('in'))

        # Instantiate all tiles
        row = 0
        line = 0
        tiles = []
        for tileNb in range(0, self.nbTiles):
            tile = self.newComp(className=cgra.Tile.Tile, network=network, compName='tile_%d' % tileNb, id=tileNb, nbRegs=self.regFileSize)
            tile.getPort('fetch').linkTo(pmem.getPort('in'))
            xbar.getPort('out').mapTo(base=tileNb*0x100, size=0x100, removeOffset=tileNb*0x100, port=tile.getPort('in'))
            conf.getPort('fetchEnable%d' % (tileNb)).linkTo(tile.getPort('fetchEnable'))
            tiles.append(tile)
            
            # Neighbourhood connections
            if row != 0: 
                # Left to right
                tiles[tileNb-1].getPort('out').linkTo(tile.getPort('inLeft'))
                tiles[tileNb-1].getPort('outReq').linkTo(tile.getPort('inReqLeft'))
                tile.getPort('inAck').linkTo(tiles[tileNb-1].getPort('outAckRight'))
                # Right to left
                tile.getPort('out').linkTo(tiles[tileNb-1].getPort('inRight'))
                tile.getPort('outReq').linkTo(tiles[tileNb-1].getPort('inReqRight'))
                tiles[tileNb-1].getPort('inAck').linkTo(tile.getPort('outAckLeft'))

            if line != 0: 
                # Up to down
                tiles[tileNb-self.nbRows].getPort('out').linkTo(tile.getPort('inUp'))
                tiles[tileNb-self.nbRows].getPort('outReq').linkTo(tile.getPort('inReqUp'))
                tile.getPort('inAck').linkTo(tiles[tileNb-self.nbRows].getPort('outAckDown'))
                # Down to up
                tile.getPort('out').linkTo(tiles[tileNb-self.nbRows].getPort('inDown'))
                tile.getPort('outReq').linkTo(tiles[tileNb-self.nbRows].getPort('inReqDown'))
                tiles[tileNb-self.nbRows].getPort('inAck').linkTo(tile.getPort('outAckUp'))

            row += 1
            if row == self.nbRows:
                row = 0
                line += 1

        self.getPort('in').linkTo(xbar.getPort('in'))
        
