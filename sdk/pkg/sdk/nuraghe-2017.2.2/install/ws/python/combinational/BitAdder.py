import gv
import combinational.Network
import combinational.basic

class BitAdder(gv.Module):

    def build(self):

        self.newPort('in0')
        self.newPort('in1')
        self.newPort('cin')
        self.newPort('out')
        self.newPort('cout')

        # Output generation
        xor0 = self.newComp(className=combinational.basic.Xor, compName="xor0")
        xor1 = self.newComp(className=combinational.basic.Xor, compName="xor1")
        
        self.getPort('in0').linkTo(xor0.getPort('in0'))
        self.getPort('in1').linkTo(xor0.getPort('in1'))
        xor0.getPort('out').linkTo(xor1.getPort('in0'))
        self.getPort('cin').linkTo(xor1.getPort('in1'))
        xor1.getPort('out').linkTo(self.getPort('out'))
                                   
        # Carry generation
        and0 = self.newComp(className=combinational.basic.And, compName="and0")
        and1 = self.newComp(className=combinational.basic.And, compName="and1")
        or0 = self.newComp(className=combinational.basic.Or, compName="or0")
        xor0.getPort('out').linkTo(and0.getPort('in0'))
        self.getPort('cin').linkTo(and0.getPort('in1'))
        self.getPort('in0').linkTo(and1.getPort('in0'))
        self.getPort('in1').linkTo(and1.getPort('in1'))
        and0.getPort('out').linkTo(or0.getPort('in0'))
        and1.getPort('out').linkTo(or0.getPort('in1'))
        or0.getPort('out').linkTo(self.getPort('cout'))
        
        
