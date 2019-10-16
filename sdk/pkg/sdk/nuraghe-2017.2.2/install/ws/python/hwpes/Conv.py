import gv
import combinational.Network
import combinational.reg
import combinational.network
import combinational.Conv
import ico.gv_router

class Conv(combinational.Network.Network):


    def build(self):

        super(Conv, self).build()

        self.newPort('in')
        self.newPort('memPort0')
        self.newPort('memPort1')
        self.newPort('memPort2')

        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico')
        self.getPort('in').linkTo(xbar.getPort('in'))

        network = self.newComp(className=combinational.network.Network, compName="network")

        inBuff = self.newComp(className=combinational.reg.Reg, compName="inBuff", network=network, width=32, sync=False)
        xbar.getPort('out').mapTo(base=0, size=4, removeOffset=0, port=inBuff.getPort('inItf'))

        outBuff = self.newComp(className=combinational.reg.Reg, compName="outBuff", network=network, width=32, sync=False)
        xbar.getPort('out').mapTo(base=4, size=4, removeOffset=4, port=outBuff.getPort('inItf'))

        coeffs = self.newComp(className=combinational.reg.Reg, compName="coeffs", network=network, width=32, sync=False)
        xbar.getPort('out').mapTo(base=8, size=4, removeOffset=8, port=coeffs.getPort('inItf'))

        width = self.newComp(className=combinational.reg.Reg, compName="width", network=network, width=32, sync=False)
        xbar.getPort('out').mapTo(base=12, size=4, removeOffset=12, port=width.getPort('inItf'))

        height = self.newComp(className=combinational.reg.Reg, compName="height", network=network, width=32, sync=False)
        xbar.getPort('out').mapTo(base=16, size=4, removeOffset=16, port=height.getPort('inItf'))

        ctrl = self.newComp(className=combinational.reg.Reg, compName="ctrl", network=network, width=32)
        xbar.getPort('out').mapTo(base=20, size=4, removeOffset=20, port=ctrl.getPort('inItf'))


        conv = self.newComp(className=combinational.Conv.Conv, compName="conv", network=network, width=32)

        inBuff.getPort('out').linkTo(conv.getPort('inBuff'))
        outBuff.getPort('out').linkTo(conv.getPort('outBuff'))
        coeffs.getPort('out').linkTo(conv.getPort('coeffs'))
        width.getPort('out').linkTo(conv.getPort('width'))
        height.getPort('out').linkTo(conv.getPort('height'))
        ctrl.getPort('out').linkTo(conv.getPort('ctrl'))

        conv.getPort('memPort0').linkTo(self.getPort('memPort0'))
        conv.getPort('memPort1').linkTo(self.getPort('memPort1'))
        conv.getPort('memPort2').linkTo(self.getPort('memPort2'))
