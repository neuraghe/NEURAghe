import gv
import combinational.Network
import combinational.reg
import combinational.Adder
import combinational.network
import ico.gv_router

class Adder(combinational.Network.Network):


    def build(self):

        super(Adder, self).build()

        self.newPort('in')

        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico')
        self.getPort('in').linkTo(xbar.getPort('in'))

        network = self.newComp(className=combinational.network.Network, compName="network")

        a0 = self.newComp(className=combinational.reg.Reg, compName="A", network=network, width=32)
        xbar.getPort('out').mapTo(base=0, size=4, removeOffset=0, port=a0.getPort('inItf'))

        a1 = self.newComp(className=combinational.reg.Reg, compName="B", network=network, width=32)
        xbar.getPort('out').mapTo(base=4, size=4, removeOffset=4, port=a1.getPort('inItf'))

        a2 = self.newComp(className=combinational.reg.Reg, compName="out", network=network, width=32)
        xbar.getPort('out').mapTo(base=8, size=4, removeOffset=8, port=a2.getPort('inItf'))

        a3 = self.newComp(className=combinational.reg.Reg, compName="cin", network=network, width=1)


        adder = self.newComp(className=combinational.Adder.Adder, compName="adder", network=network, width=32)

        a0.getPort('out').linkTo(adder.getPort('in0'))
        a1.getPort('out').linkTo(adder.getPort('in1'))
        a3.getPort('out').linkTo(adder.getPort('cin'))
        adder.getPort('out').linkTo(a2.getPort('in'))
