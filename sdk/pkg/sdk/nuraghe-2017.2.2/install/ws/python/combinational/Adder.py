import gv
import combinational.Network
import combinational.BitAdder
import combinational.basic

class Adder(gv.Module):

    width = 32

    def build(self):
        
        self.newPort('in0')
        self.newPort('in1')
        self.newPort('cin')
        self.newPort('out')
        self.newPort('cout')

        split0 = self.newComp(className=combinational.basic.Splitter, compName="split0", width=32)
        self.getPort('in0').linkTo(split0.getPort('in'))

        split1 = self.newComp(className=combinational.basic.Splitter, compName="split1", width=32)
        self.getPort('in1').linkTo(split1.getPort('in'))

        cin = self.getPort('cin')
        bitAdders = []
        for i in range(0, self.width):

            bitAdder = self.newComp(className=combinational.BitAdder.BitAdder, compName="adder%d" % (i))
            bitAdders.append(bitAdder)
            split0.getPort('out%d' % (i)).linkTo(bitAdder.getPort('in0'))
            split1.getPort('out%d' % (i)).linkTo(bitAdder.getPort('in1'))
            cin.linkTo(bitAdder.getPort('cin'))
            cin = bitAdder.getPort('cout')

        join = self.newComp(className=combinational.basic.Joiner, compName="join", width=32)
        join.getPort('out').linkTo(self.getPort('out'))

        for i in range(0, self.width):
            bitAdders[i].getPort('out').linkTo(join.getPort('in%s' % (i)))

        cin.linkTo(self.getPort('cout'))
