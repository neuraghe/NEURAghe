import gv
import cgra.alu
import cgra.regfile
import cgra.control
import ico.gv_router
import combinational.basic

class Tile(gv.Module):

    id = 0
    nbRegs = 8

    def build(self):

        self.newPort('fetch')             # Output port for getting instruction
        self.newPort('fetchEnable')       # Input port for enabling instruction fetching
        self.newPort('in')                # Input port for accessing register (e.g. PC)
        self.newPort('out')               # Output data port

        # Input0 data ports for each neighbour
        self.newPort('inLeft')
        self.newPort('inRight')
        self.newPort('inUp')
        self.newPort('inDown')

        # Hand-shake signals for input data
        self.newPort('inAck')
        self.newPort('inReqLeft')
        self.newPort('inReqRight')
        self.newPort('inReqUp')
        self.newPort('inReqDown')

        # Hand-shake signals for output data
        self.newPort('outAckLeft')
        self.newPort('outAckRight')
        self.newPort('outAckUp')
        self.newPort('outAckDown')
        self.newPort('outReq')

        

        alu = self.newComp(className=cgra.alu.Alu, compName="alu")
        regfile = self.newComp(className=cgra.regfile.Regfile, compName="regfile")
        control = self.newComp(className=cgra.control.Control, compName="control")
        xbar = self.newComp(className=ico.gv_router.Gv_router, compName='ico')
        input0Mux = self.newComp(className=combinational.basic.Mux, compName="input0Mux", nbStages=3, width=32)
        input1Mux = self.newComp(className=combinational.basic.Mux, compName="input1Mux", nbStages=3, width=32)
        inReq0Mux = self.newComp(className=combinational.basic.Mux, compName="inReq0Mux", nbStages=2, width=1)
        inReq1Mux = self.newComp(className=combinational.basic.Mux, compName="inReq1Mux", nbStages=2, width=1)
        outAckMux = self.newComp(className=combinational.basic.Mux, compName="outAckMux", nbStages=2, width=1)

        outReg = self.newComp(className=combinational.reg.Reg, compName="outReg", width=32)

        # Input mux 0 connections
        self.getPort('inLeft').linkTo(input0Mux.getPort('in0'))
        self.getPort('inRight').linkTo(input0Mux.getPort('in1'))
        self.getPort('inUp').linkTo(input0Mux.getPort('in2'))
        self.getPort('inDown').linkTo(input0Mux.getPort('in3'))
        regfile.getPort('out0').linkTo(input0Mux.getPort('in4'))
        input0Mux.getPort('out').linkTo(alu.getPort('in0'))
        control.getPort('input0Mux').linkTo(input0Mux.getPort('sel'))

        # Input mux 1 connections
        self.getPort('inLeft').linkTo(input1Mux.getPort('in0'))
        self.getPort('inRight').linkTo(input1Mux.getPort('in1'))
        self.getPort('inUp').linkTo(input1Mux.getPort('in2'))
        self.getPort('inDown').linkTo(input1Mux.getPort('in3'))
        regfile.getPort('out1').linkTo(input1Mux.getPort('in4'))
        input1Mux.getPort('out').linkTo(alu.getPort('in1'))
        control.getPort('input1Mux').linkTo(input1Mux.getPort('sel'))

        # Input 0 request mux connections
        self.getPort('inReqLeft').linkTo(inReq0Mux.getPort('in0'))
        self.getPort('inReqRight').linkTo(inReq0Mux.getPort('in1'))
        self.getPort('inReqUp').linkTo(inReq0Mux.getPort('in2'))
        self.getPort('inReqDown').linkTo(inReq0Mux.getPort('in3'))
        inReq0Mux.getPort('out').linkTo(control.getPort('inReq0'))
        control.getPort('inReq0Mux').linkTo(inReq0Mux.getPort('sel'))

        # Input 1 request mux connections
        self.getPort('inReqLeft').linkTo(inReq1Mux.getPort('in0'))
        self.getPort('inReqRight').linkTo(inReq1Mux.getPort('in1'))
        self.getPort('inReqUp').linkTo(inReq1Mux.getPort('in2'))
        self.getPort('inReqDown').linkTo(inReq1Mux.getPort('in3'))
        inReq1Mux.getPort('out').linkTo(control.getPort('inReq1'))
        control.getPort('inReq1Mux').linkTo(inReq1Mux.getPort('sel'))

        # Output acknowledgement mux connections
        self.getPort('outAckLeft').linkTo(outAckMux.getPort('in0'))
        self.getPort('outAckRight').linkTo(outAckMux.getPort('in1'))
        self.getPort('outAckUp').linkTo(outAckMux.getPort('in2'))
        self.getPort('outAckDown').linkTo(outAckMux.getPort('in3'))
        outAckMux.getPort('out').linkTo(outReg.getPort('outAck'))
        control.getPort('outAckMux').linkTo(outAckMux.getPort('sel'))

        # Output register connections
        alu.getPort('out').linkTo(outReg.getPort('in'))
        control.getPort('outReq').linkTo(outReg.getPort('inReq'))
        outReg.getPort('inAck').linkTo(control.getPort('outAck'))
        outReg.getPort('outReq').linkTo(self.getPort('outReq'))
        outReg.getPort('out').linkTo(self.getPort('out'))

        # Regfile connections
        control.getPort('regfileSrc0').linkTo(regfile.getPort('out0Sel'))
        control.getPort('regfileSrc1').linkTo(regfile.getPort('out1Sel'))
        control.getPort('regfileDst').linkTo(regfile.getPort('inSel'))
        control.getPort('regfileWrite').linkTo(regfile.getPort('inEn'))
        alu.getPort('out').linkTo(regfile.getPort('in'))
        
        # Control connections
        control.getPort('inAck').linkTo(self.getPort('inAck'))
        control.getPort('fetch').linkTo(self.getPort('fetch'))
        self.getPort('in').linkTo(xbar.getPort('in'))
        self.getPort('fetchEnable').linkTo(control.getPort('fetchEnable'))
        xbar.getPort('out').mapTo(base=0, size=4, removeOffset=0, port=control.getPort('in'))
        control.getPort('aluOp').linkTo(alu.getPort('op'))
