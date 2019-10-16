////////////////////////////////////////////////////////////////////////////////
//          ERC Multitherman Lab @ DEIS - University of Bologna               //
//                    Viale Pepoli 3/2 40136                                  //
//                    Bologna - tel 0512092759                                //
//                                                                            //
// Engineer:       Francesco Conti - f.conti@unibo.it                         //
//                                                                            //
// Create Date:    15/06/2012                                                 //
// Last Update:    10/05/2013                                                 //
// Design Name:    hwpe_sm                                                    //
// Module Name:    test_pkg                                                   //
// Project Name:   Shared-memory HWPE wrapper                                 //
// Target Devices: FPGA, ASIC                                                 //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Test package - mimicks the HAL                             //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

const int N_MANDATORY_REGS = 7;
const int N_RESERVED_REGS  = 1;
const int N_GENERIC_REGS   = 8;
const int N_MAX_GENERIC_REGS = 8;

// Triggers the HWPE execution
task triggerHWPE(int hwpe_id);
   writeCfg(0,1);
   resetCfg();
endtask

// Reads status register, returns 1 if working, 0 if finished
task isWorkingHWPE(int hwpe_id);
   readCfg(3);
endtask

// Reads the context_id register and, if HW sync is active, initiates the setting phase
// returns -1 if no context available, or context_id if one is available
task checkContextHWPE(int hwpe_id);
   readCfg(1);
endtask

// Sets the synchronization mode (0=polling, 1=events)
task setSyncModeHWPE(int hwpe_id, integer sync_mode);
   writeCfg(2, sync_mode);
   resetCfg();
endtask

// Sets one of the generic registers (valid regs: 0 to N_GENERIC_REGS-1)
task setGenericRegHWPE(int hwpe_id, integer register, integer value);
  writeCfg(N_MANDATORY_REGS+N_RESERVED_REGS + register, value);
  resetCfg();
endtask

// Sets one of the IO registers (valid regs: 0 to N_IO_REGS-1)
task setIORegHWPE(int hwpe_id, integer register, integer value);
  writeCfg(N_MANDATORY_REGS+N_RESERVED_REGS+N_MAX_GENERIC_REGS + register, value);
  resetCfg();
endtask

// Sets the base_addr reg
task setBaseAddr(int hwpe_id, integer stream, integer value);
  integer register;
  register = stream*4 + 0;
  setIORegHWPE(hwpe_id, register, value);
endtask

// Sets the trans_size reg
task setTransSize(int hwpe_id, integer stream, integer value);
  integer register;
  register = stream*4 + 1;
  setIORegHWPE(hwpe_id, register, value);
endtask

// Sets the line_param reg (stride is in bytes)
task setLineParams(int hwpe_id, integer stream, integer length, integer stride);
  integer register;
  integer value;
  register = stream*4 + 2;
  value = {stride[15:0], length[15:0]};
  setIORegHWPE(hwpe_id, register, value);
endtask

// Sets the feat_param reg (stride is in bytes)
task setFeatParams(int hwpe_id, integer stream, integer length, integer stride);
  integer register;
  integer value;
  register = stream*4 + 3;
  value = {stride[15:0], length[15:0]};
  setIORegHWPE(hwpe_id, register, value);
endtask

/* HWCE - specific functions */

task hwce_acquire(int hwce_id);
  checkContextHWPE(hwce_id);
  tb_wait(1);
  // assert(testbench.hw_acc_cfg_r_data != -1)
  resetCfg();
endtask

task hwce_setup(int hwce_id, integer weight_ptr, integer x_in_ptr, integer y_in_ptr, integer y_out_ptr, integer n_feat, integer height, integer width);
  // width is scaled down by a factor of two because image is 16-bit based
  setIORegHWPE(hwce_id, 12, weight_ptr);
  setIORegHWPE(hwce_id, 13, {16'h5, 16'h0});
  setIORegHWPE(hwce_id, 14, {n_feat[15:0], 16'd13});
  setIORegHWPE(hwce_id, 15, width/2);

  setBaseAddr  (hwce_id, 0, y_out_ptr);
  setTransSize (hwce_id, 0, n_feat*(height-4)*(width/2-4/2));
  setLineParams(hwce_id, 0, width/2-4/2, 4*(width/2-4/2));
  setFeatParams(hwce_id, 0, (height-4), 4*(height-4)*(width/2-4/2));
  setBaseAddr  (hwce_id, 1, y_in_ptr);
  setTransSize (hwce_id, 1, n_feat*(height-4)*(width/2-4/2));
  setLineParams(hwce_id, 1, width/2-4/2, 4*(width/2-4/2));
  setFeatParams(hwce_id, 1, (height-4), 0);//4*(height-4)*(width/2-4/2));
  setBaseAddr  (hwce_id, 2, x_in_ptr);
  setTransSize (hwce_id, 2, n_feat*height*width/2);
  setLineParams(hwce_id, 2, width/2, 4*width/2);
  setFeatParams(hwce_id, 2, height, 4*height*width/2);

    // (hwce_id, 0, y_out_ptr);
    // (hwce_id, 0, n_feat*(height-4)*(width/2-2));
    // (hwce_id, 0, width/2-2, 4*(width/2-2));
    // (hwce_id, 0, (height-4)*(width/2-2), 4*n_feat*(height-4)*(width/2-2));
    // (hwce_id, 1, y_in_ptr);
    // (hwce_id, 1, n_feat*(height-4)*(width/2-2));
    // (hwce_id, 1, width/2-2, 4*(width/2-2));
    // (hwce_id, 1, (height-4)*(width/2-2), 4*n_feat*(height-4)*(width/2-2));
    // (hwce_id, 2, x_in_ptr);
    // (hwce_id, 2, n_feat*height*width/2);
    // (hwce_id, 2, width/2, 4*width/2);
    // (hwce_id, 2, height*width/2, 4*n_feat*height*width/2);
endtask

task hwce_trigger(int hwce_id);
  triggerHWPE(hwce_id);
endtask

/* Real tasks: */

task resetCfg();
   testbench.hw_acc_cfg_add  <= 0;
   testbench.hw_acc_cfg_be   <= 0;
   testbench.hw_acc_cfg_data <= 0;
   testbench.hw_acc_cfg_type <= 0;
   testbench.hw_acc_cfg_req  <= 0;
   testbench.hw_acc_cfg_ID   <= 0;
   tb_wait(3);
endtask

task writeCfg(
   input integer     reg_addr,
   input logic[31:0] reg_value
);
   testbench.hw_acc_cfg_add  <= reg_addr;
   testbench.hw_acc_cfg_be   <= 4'hf;
   testbench.hw_acc_cfg_data <= reg_value;
   testbench.hw_acc_cfg_type <= 1;
   testbench.hw_acc_cfg_req  <= 1;
   testbench.hw_acc_cfg_ID   <= 0;
   tb_wait(1);
endtask

task readCfg(
   input integer    reg_addr
);
   testbench.hw_acc_cfg_add  <= reg_addr;
   testbench.hw_acc_cfg_be   <= 0;
   testbench.hw_acc_cfg_data <= 0;
   testbench.hw_acc_cfg_type <= 0;
   testbench.hw_acc_cfg_req  <= 1;
   testbench.hw_acc_cfg_ID   <= 0;
   tb_wait(1);
endtask

task tb_wait(input int cycles);
   #(8000ps*cycles);
endtask
