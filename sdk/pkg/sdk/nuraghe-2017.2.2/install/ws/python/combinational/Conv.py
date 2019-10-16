import gv
import combinational.Network
import combinational.BitAdder
import combinational.basic
import combinational.convEngine

class Conv(gv.Module):

    width = 32

    def build(self):
        
        self.newPort('memPort0')
        self.newPort('memPort1')
        self.newPort('memPort2')

        self.newPort('inBuff')
        self.newPort('outBuff')
        self.newPort('coeffs')
        self.newPort('width')
        self.newPort('height')
        self.newPort('ctrl')

       
        engine = self.newComp(className=combinational.convEngine.ConvEngine, compName="engine")
        buffFifo = self.newComp(className=combinational.basic.InputFifo, compName="buffFifo", width=32, nbElems=2, outWidth=32)
        coeffFifo = self.newComp(className=combinational.basic.InputFifo, compName="coeffFifo", width=32, nbElems=2, outWidth=32)
        outFifo = self.newComp(className=combinational.basic.OutputFifo, compName="outFifo", width=32, nbElems=2) # TODO, outWidth=32
        engine.getPort('buffAddr').linkTo(buffFifo.getPort('addr'))
        engine.getPort('coeffAddr').linkTo(coeffFifo.getPort('addr'))
        buffFifo.getPort('fetchReq').linkTo(engine.getPort('buffAck'))
        coeffFifo.getPort('fetchReq').linkTo(engine.getPort('coeffAck'))
        engine.getPort('fetchEn').linkTo(buffFifo.getPort('fetchAck'))
        engine.getPort('fetchEn').linkTo(coeffFifo.getPort('fetchAck'))
        buffFifo.getPort('memPort').linkTo(self.getPort('memPort0'))
        coeffFifo.getPort('memPort').linkTo(self.getPort('memPort1'))
        #outFifo.getPort('memPort').linkTo(self.getPort('memPort0'))


        mult = self.newComp(className=combinational.basic.Mult, compName="mult", width=32)
        andComp = self.newComp(className=combinational.basic.And, compName="and")
        buffFifo.getPort('out').linkTo(mult.getPort('in0'))
        coeffFifo.getPort('out').linkTo(mult.getPort('in1'))

        reg = self.newComp(className=combinational.reg.Reg, compName="reg", width=32)
        buffFifo.getPort('outReq').linkTo(andComp.getPort('in0'))
        coeffFifo.getPort('outReq').linkTo(andComp.getPort('in1'))
        andComp.getPort('out').linkTo(reg.getPort('inReq'))
        mult.getPort('out').linkTo(reg.getPort('in'))
        reg.getPort('inAck').linkTo(buffFifo.getPort('outAck'))
        reg.getPort('inAck').linkTo(coeffFifo.getPort('outAck'))

        accu = self.newComp(className=combinational.reg.Reg, compName="accu", width=32)
        adder = self.newComp(className=combinational.basic.Adder, compName="adder", width=32)
        andComp2 = self.newComp(className=combinational.basic.And, compName="and2")

        # Adder mux between accu and zero
        zero = self.newComp(className=combinational.basic.Zero, compName="zero", width=32)
        mux = self.newComp(className=combinational.basic.Mux, compName="mux", width=32, nbStages=2)
        accu.getPort('out').linkTo(mux.getPort('in0'))
        zero.getPort('out').linkTo(mux.getPort('in1'))
        mux.getPort('out').linkTo(adder.getPort('in0'))
        engine.getPort('adderMux').linkTo(mux.getPort('sel'))

        reg.getPort('outReq').linkTo(accu.getPort('inReq'))
        accu.getPort('inAck').linkTo(reg.getPort('outAck'))
        reg.getPort('out').linkTo(adder.getPort('in1'))
        adder.getPort('out').linkTo(accu.getPort('in'))

        accu.getPort('outReq').linkTo(andComp2.getPort('in0'))
        engine.getPort('adderFlush').linkTo(andComp2.getPort('in1'))
        andComp2.getPort('out').linkTo(outFifo.getPort('inReq'))

        # Logic for accu output ack
        notComp = self.newComp(className=combinational.basic.Not, compName="not")
        orComp = self.newComp(className=combinational.basic.Or, compName="or")
        engine.getPort('adderFlush').linkTo(notComp.getPort('in'))
        notComp.getPort('out').linkTo(orComp.getPort('in0'))
        outFifo.getPort('inAck').linkTo(orComp.getPort('in1'))
        orComp.getPort('out').linkTo(accu.getPort('outAck'))

        # Logic for counting accu steps
        andComp3 = self.newComp(className=combinational.basic.And, compName="and3")
        reg.getPort('outReq').linkTo(andComp3.getPort('in0'))
        accu.getPort('inAck').linkTo(andComp3.getPort('in1'))
        andComp3.getPort('out').linkTo(engine.getPort('accuCounter'))

        accu.getPort('out').linkTo(outFifo.getPort('in'))
        engine.getPort('outAddr').linkTo(outFifo.getPort('addr'))
        engine.getPort('fetchEn').linkTo(outFifo.getPort('fetchAck'))
        outFifo.getPort('fetchReq').linkTo(engine.getPort('outAck'))

        self.getPort('inBuff').linkTo(engine.getPort('inBuff'))
        self.getPort('outBuff').linkTo(engine.getPort('outBuff'))
        self.getPort('coeffs').linkTo(engine.getPort('coeffs'))
        self.getPort('width').linkTo(engine.getPort('width'))
        self.getPort('height').linkTo(engine.getPort('height'))
        self.getPort('ctrl').linkTo(engine.getPort('ctrl'))
