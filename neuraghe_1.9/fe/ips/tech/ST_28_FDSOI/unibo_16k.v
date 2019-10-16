
// ----------------------------------------------------------------------------------------
// LETI 2014
// Author: Olivier THOMAS
// Project: UNIBO
// Division: DACLE
// ----------------------------------------------------------------------------------------
// Description: Verilog Model
// Version: 4.0
// Date: 2014/06/16
// ----------------------------------------------------------------------------------------
// Words = 512
// bits = 32
// Mux = 8
// Bit masking = 32
// Synchronous negative chip select (CSN)
// Asynchronous negative reset (RSTN)
// Internal clock
// ----------------------------------------------------------------------------------------
// taa = 1ns
// thold = 100p
// tsetup = 100p
// ----------------------------------------------------------------------------------------

//`timescale 1ns / 1ps

module unibo_16kb (CK, RSTN, CSN, RDDELAY, WRDELAY, WEN, ADDR, DIN, DOUT, MASK);  
  //----- Parameters -----
  parameter Words = 512;                 // Memory word capacity
  parameter Word_bits = 32;               // Memory word wise
  parameter Mux = 4;                      // Memory mux
  parameter Rows = Words/Mux;             // 
  parameter Addr_bits = $clog2(Words);    // Memory address bits 
  parameter Ctrl_bits = 2;                // Memory control bit wise
  
  parameter taa = 1;                      // Cycle time (Arbitrary value so far, has to be updated)
  parameter tcq = 0.1;                    // FF clock to Q
  parameter trd = taa*0.8;                // Read access time
  parameter twr = taa*0.7;                // Write access time
    
  //----- IOs -----
  input CK;                       // External clock signal
  input CSN;                      // Synchronous Negative memory select 
  input RSTN;                     // Asychronous reset
  input [Ctrl_bits-1:0] RDDELAY;  // Adjust the memory read timing
  input [Ctrl_bits-1:0] WRDELAY;  // Adjust the memory write timing
  input WEN;                      // Read or Write select (Negative write) 
  input [Addr_bits-1:0] ADDR;     // Memory address bus
  input [Word_bits-1:0] DIN;      // Memory data in bus
  output [Word_bits-1:0] DOUT;    // Memmory data out bus
  input [Word_bits-1:0] MASK;     // Bit masking (Mask at 0)
  
  //---- IOs declaration -----
  wire CK;
  wire CSN;
  wire RSTN;
  wire [Ctrl_bits-1:0] RDDELAY;
  wire [Ctrl_bits-1:0] WRDELAY;
  wire WEN;
  wire [Addr_bits-1:0] ADDR;
  wire [Word_bits-1:0] DIN;
  reg [Word_bits-1:0] DOUT; 
  wire [Word_bits-1:0] MASK;
 
  //---- Registers -----
  reg CKint;                              // Internal clock
  reg [Ctrl_bits-1:0] RDDELAYreg;         // Memory read timing tunning register
  reg [Ctrl_bits-1:0] WRDELAYreg;         // Memory write timing tunning register
  reg [Addr_bits-1:0] Areg;               // Address bus internal register
  reg [Word_bits-1:0] Dreg;               // Data bus internal register
  reg Wreg;                               // WR/RD contral signal internal latch
  reg [Word_bits-1:0] Array [Words-1:0];  // Array (modeled has a single bank)
  reg [Word_bits-1:0] Mreg;               // Bit masking internal register
  
  //---- Behavioural description -----
  task WriteCycle; 
    input [Addr_bits-1:0] Address;
    input [Word_bits-1:0] Data_in;
    input [Word_bits-1:0] Mask;
    begin
      #twr Array[Address] = (~Mask & Array[Address]) | (Mask & Data_in);
    end
  endtask 
  
  task ReadCycle;
    input [Addr_bits-1:0] Address;
    output [Word_bits-1:0] Data_out;
    begin
      #trd Data_out = Array[Address];
    end
  endtask
  
  task NoAccess;
    input [Word_bits-1:0] Data_out_cur;
    output [Word_bits-1:0] Data_out;
    begin
      Data_out = Data_out_cur;
    end
  endtask
  
  always @(CK)
  begin
    CKint = CK;
  end
  
  always @(posedge CKint or RSTN)
  begin
    /*----- Latching signals -----*/
    if (RSTN == 1'b0)
      begin
        Wreg = 1'b0;
        Areg = 0;
        Dreg = 0;
        RDDELAYreg = 0;
        WRDELAYreg = 0;
        Mreg = 0;
      end
    else
      begin
        #tcq Areg = ADDR;
        Dreg = DIN;
        Wreg = WEN;
        RDDELAYreg = RDDELAY;
        WRDELAYreg = WRDELAY;
        Mreg = MASK;
      end
      
    /*----- Normal Read and Write operations -----*/
    if (CSN == 1'b0)
      begin
        if (Wreg == 1'b1)
          begin
            ReadCycle(Areg, DOUT);
          end //if (WEN == 1'b1)
        else if (Wreg == 1'b0)
          begin
            WriteCycle(Areg, Dreg, Mreg);
          end // else if (WEN == 1'b0)
      end // if (CSN == 1'b0) 
    else if (CSN == 1'b1)
      begin
        NoAccess(DOUT, DOUT);
      end // else if (CSN == 1'b1)
  end // always @(posedge CK or RSTN)
 
endmodule
