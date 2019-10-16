* /home/tcmuelle/projects/vbbgen_PULP/mgc_ams/combinedanalog_tb.cmd input netlist
* Creation Date : Sun May 24 17:35:30% CEST 2015 
*

.MODEL A2D_default A2D MODE=std_logic VTH1=0.2 VTH2=0.7 TX=20ps
.MODEL D2A_default D2A MODE=std_logic VLOREF=0 VHI=0.9 TRISE=20ps TFALL=20ps
.DEFHOOK A2D_default D2A_default


.tran 1.0ns 40us
* User minimum step definition
.option hmin=1e-12
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.option adit_group_auto=0
.end

