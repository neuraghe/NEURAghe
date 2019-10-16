/*******************************************************************************
_________________________________________________________________________________________________________


             Synchronous Via-1 ROM Compiler 

                   UMC 65nm Low_K Low Leakage Logic Process 

_________________________________________________________________________________________________________

              
        Copyright (C) 2015 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
_________________________________________________________________________________________________________

       IP Name            :  FSE0K_A_SP                                                                  
       IP Version         :  1.5.0                                                                       
       IP Release Status  :  Active                                                                      
       Word               :  1024                                                                        
       Bit                :  64                                                                          
       Mux                :  1                                                                           
       Rom Code Version   :  A                                                                           
       Rom Code Format    :  bin                                                                         
       Rom Code File      :    
       Output Loading     :  0.01                                                                        
       Clock Input Slew   :  0.008                                                                       
       Data Input Slew    :  0.008                                                                       
       Ring Type          :  Ring Shape Model                                                            
       Ring Width         :  2                                                                           
       Bus Format         :  1                                                                           
       Memaker Path       :                              
       GUI Version        :  m20100910                                                                   
       Date               :  2015/03/19 18:35:28                                                         
_________________________________________________________________________________________________________


   Notice on usage: Fixed delay or timing data are given in this model.
                    It supports SDF back-annotation, please generate SDF file
                    by EDA tools to get the accurate timing.

 |-----------------------------------------------------------------------------|

   Warning : If customer's design viloate the set-up time or hold time criteria 
   of synchronous SRAM, it's possible to hit the meta-stable point of 
   latch circuit in the decoder and cause the data loss in the memory bitcell.
   So please follow the memory IP's spec to design your product.

 |-----------------------------------------------------------------------------|

                Library          : FSE0K_A
                Memaker          : FSE0K_A_SP (ver 1.5.0)
                Date             : 2015/03/19 18:35:28

 *******************************************************************************/

`resetall
`timescale 10ps/1ps


module SPKA65_1024X64BM1A (A,DO,DVSE,DVS,CK,CS,OE);
  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `FALSE;           
  parameter  ROMCODE              = "./boot/boot_code.cde";
  parameter  DVSize               = 4;                
  parameter  AddressSize          = 10;               
  parameter  Bits                 = 64;               
  parameter  Words                = 1024;             
  parameter  AspectRatio          = 1;                
  parameter  TOH                  = (40.5:63.1:109.5);

  output     [Bits-1:0]           DO;                 
  input      [AddressSize-1:0]    A;                  
  input      DVSE;                                    
  input      [DVSize-1:0]         DVS;                
  input      OE;                                      
  input      CK;                                      
  input      CS;                                      

`protect
  reg        [Bits-1:0]           Memory [Words-1:0];           

  wire       [Bits-1:0]           DO_;                
  wire       [AddressSize-1:0]    A_;                 
  wire                            OE_;                
  wire                            CK_;                
  wire                            CS_;                


  wire                            con_A;              
  wire                            con_CK;             

  reg        [AddressSize-1:0]    Latch_A;            
  reg                             Latch_CS;           

  reg        [AddressSize-1:0]    A_i;                
  reg                             CS_i;               

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
  reg                             n_flag_A6;          
  reg                             n_flag_A7;          
  reg                             n_flag_A8;          
  reg                             n_flag_A9;          
  reg                             n_flag_CS;          
  reg                             n_flag_CK_PER;      
  reg                             n_flag_CK_MINH;     
  reg                             n_flag_CK_MINL;     
  reg                             LAST_n_flag_CS;     
  reg                             LAST_n_flag_CK_PER; 
  reg                             LAST_n_flag_CK_MINH;
  reg                             LAST_n_flag_CK_MINL;
  reg        [AddressSize-1:0]    NOT_BUS_A;          
  reg        [AddressSize-1:0]    LAST_NOT_BUS_A;     

  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       

  reg        [Bits-1:0]           DO_i;               

  reg                             LastClkEdge;        

  reg                             flag_A_x;           
  reg                             flag_CS_x;          
  reg                             NODELAY;            
  reg        [Bits-1:0]           DO_tmp;             
  event                           EventTOHDO;         
  event                           EventNegCS;         

  assign     DO_                  = {DO_i};
  assign     con_A                = CS_;
  assign     con_CK               = CS_;
  bufif1     ido0            (DO[0], DO_[0], OE_);         
  bufif1     ido1            (DO[1], DO_[1], OE_);         
  bufif1     ido2            (DO[2], DO_[2], OE_);         
  bufif1     ido3            (DO[3], DO_[3], OE_);         
  bufif1     ido4            (DO[4], DO_[4], OE_);         
  bufif1     ido5            (DO[5], DO_[5], OE_);         
  bufif1     ido6            (DO[6], DO_[6], OE_);         
  bufif1     ido7            (DO[7], DO_[7], OE_);         
  bufif1     ido8            (DO[8], DO_[8], OE_);         
  bufif1     ido9            (DO[9], DO_[9], OE_);         
  bufif1     ido10           (DO[10], DO_[10], OE_);       
  bufif1     ido11           (DO[11], DO_[11], OE_);       
  bufif1     ido12           (DO[12], DO_[12], OE_);       
  bufif1     ido13           (DO[13], DO_[13], OE_);       
  bufif1     ido14           (DO[14], DO_[14], OE_);       
  bufif1     ido15           (DO[15], DO_[15], OE_);       
  bufif1     ido16           (DO[16], DO_[16], OE_);       
  bufif1     ido17           (DO[17], DO_[17], OE_);       
  bufif1     ido18           (DO[18], DO_[18], OE_);       
  bufif1     ido19           (DO[19], DO_[19], OE_);       
  bufif1     ido20           (DO[20], DO_[20], OE_);       
  bufif1     ido21           (DO[21], DO_[21], OE_);       
  bufif1     ido22           (DO[22], DO_[22], OE_);       
  bufif1     ido23           (DO[23], DO_[23], OE_);       
  bufif1     ido24           (DO[24], DO_[24], OE_);       
  bufif1     ido25           (DO[25], DO_[25], OE_);       
  bufif1     ido26           (DO[26], DO_[26], OE_);       
  bufif1     ido27           (DO[27], DO_[27], OE_);       
  bufif1     ido28           (DO[28], DO_[28], OE_);       
  bufif1     ido29           (DO[29], DO_[29], OE_);       
  bufif1     ido30           (DO[30], DO_[30], OE_);       
  bufif1     ido31           (DO[31], DO_[31], OE_);       
  bufif1     ido32           (DO[32], DO_[32], OE_);       
  bufif1     ido33           (DO[33], DO_[33], OE_);       
  bufif1     ido34           (DO[34], DO_[34], OE_);       
  bufif1     ido35           (DO[35], DO_[35], OE_);       
  bufif1     ido36           (DO[36], DO_[36], OE_);       
  bufif1     ido37           (DO[37], DO_[37], OE_);       
  bufif1     ido38           (DO[38], DO_[38], OE_);       
  bufif1     ido39           (DO[39], DO_[39], OE_);       
  bufif1     ido40           (DO[40], DO_[40], OE_);       
  bufif1     ido41           (DO[41], DO_[41], OE_);       
  bufif1     ido42           (DO[42], DO_[42], OE_);       
  bufif1     ido43           (DO[43], DO_[43], OE_);       
  bufif1     ido44           (DO[44], DO_[44], OE_);       
  bufif1     ido45           (DO[45], DO_[45], OE_);       
  bufif1     ido46           (DO[46], DO_[46], OE_);       
  bufif1     ido47           (DO[47], DO_[47], OE_);       
  bufif1     ido48           (DO[48], DO_[48], OE_);       
  bufif1     ido49           (DO[49], DO_[49], OE_);       
  bufif1     ido50           (DO[50], DO_[50], OE_);       
  bufif1     ido51           (DO[51], DO_[51], OE_);       
  bufif1     ido52           (DO[52], DO_[52], OE_);       
  bufif1     ido53           (DO[53], DO_[53], OE_);       
  bufif1     ido54           (DO[54], DO_[54], OE_);       
  bufif1     ido55           (DO[55], DO_[55], OE_);       
  bufif1     ido56           (DO[56], DO_[56], OE_);       
  bufif1     ido57           (DO[57], DO_[57], OE_);       
  bufif1     ido58           (DO[58], DO_[58], OE_);       
  bufif1     ido59           (DO[59], DO_[59], OE_);       
  bufif1     ido60           (DO[60], DO_[60], OE_);       
  bufif1     ido61           (DO[61], DO_[61], OE_);       
  bufif1     ido62           (DO[62], DO_[62], OE_);       
  bufif1     ido63           (DO[63], DO_[63], OE_);       
  buf        ick0            (CK_, CK);                    
  buf        ia0             (A_[0], A[0]);                
  buf        ia1             (A_[1], A[1]);                
  buf        ia2             (A_[2], A[2]);                
  buf        ia3             (A_[3], A[3]);                
  buf        ia4             (A_[4], A[4]);                
  buf        ia5             (A_[5], A[5]);                
  buf        ia6             (A_[6], A[6]);                
  buf        ia7             (A_[7], A[7]);                
  buf        ia8             (A_[8], A[8]);                
  buf        ia9             (A_[9], A[9]);                
  buf        ics0            (CS_, CS);                    
  buf        ioe0            (OE_, OE);                    

  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    NODELAY = 1'b0;
  end

  initial
    begin
      if (ROMCODE != "")
        begin
          $readmemh(ROMCODE,Memory);
        end
      else
        begin
          $display("** MEM_Error: No proper input file name is available.\n");
          $finish;
        end
    end

  always @(negedge CS_) begin
    if (SYN_CS == `FALSE) begin
       ->EventNegCS;
    end
  end
  always @(posedge CS_) begin
    if (SYN_CS == `FALSE) begin
       disable NegCS;
    end
  end
  always @(CK_) begin
    casez ({LastClkEdge,CK_})
      2'b01:
         begin
           last_A = latch_last_A;
           CS_monitor;
           pre_latch_data;
           memory_function;
           latch_last_A = A_;
         end
      2'b?x:
         begin
           ErrorMessage(0);
           #0 disable TOHDO;
           DO_i = {Bits{1'bX}};
         end
    endcase
    LastClkEdge = CK_;
  end

  always @(
           n_flag_A0 or
           n_flag_A1 or
           n_flag_A2 or
           n_flag_A3 or
           n_flag_A4 or
           n_flag_A5 or
           n_flag_A6 or
           n_flag_A7 or
           n_flag_A8 or
           n_flag_A9 or
           n_flag_CS or
           n_flag_CK_PER or
           n_flag_CK_MINH or
           n_flag_CK_MINL
          )
     begin
       timingcheck_violation;
     end

  always @(EventTOHDO)
    begin:TOHDO
      #TOH
      NODELAY <= 1'b0;
      DO_i              =  {Bits{1'bX}};
      DO_i              <= DO_tmp;
  end

  always @(EventNegCS)
    begin:NegCS
      #TOH
      disable TOHDO;
      NODELAY = 1'b0;
      DO_i              =  {Bits{1'bX}};
  end


  task timingcheck_violation;
    integer i;
    begin
      if ((n_flag_CK_PER  !== LAST_n_flag_CK_PER)  ||
          (n_flag_CK_MINH !== LAST_n_flag_CK_MINH) ||
          (n_flag_CK_MINL !== LAST_n_flag_CK_MINL)) begin
          if (CS_ !== 1'b0) begin
             #0 disable TOHDO;
             NODELAY = 1'b1;
             DO_i = {Bits{1'bX}};
          end
      end
      else begin
          NOT_BUS_A  = {
                         n_flag_A9,
                         n_flag_A8,
                         n_flag_A7,
                         n_flag_A6,
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          for (i=0; i<AddressSize; i=i+1) begin
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
          end
          Latch_CS  =  (n_flag_CS  !== LAST_n_flag_CS)  ? 1'bx : Latch_CS;
          memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_n_flag_CS                 = n_flag_CS;
      LAST_n_flag_CK_PER             = n_flag_CK_PER;
      LAST_n_flag_CK_MINH            = n_flag_CK_MINH;
      LAST_n_flag_CK_MINL            = n_flag_CK_MINL;
    end
  endtask // end timingcheck_violation;

  task pre_latch_data;
    begin
      Latch_A                        = A_;
      Latch_CS                       = CS_;
    end
  endtask //end pre_latch_data
  task memory_function;
    begin
      A_i                            = Latch_A;
      CS_i                           = Latch_CS;

      if (CS_ == 1'b1) A_monitor;

      casez(CS_i)
        1'b1: begin
           if (AddressRangeCheck(A_i)) begin
              if (NO_SER_TOH == `TRUE) begin
                if (A_i !== last_A) begin
                   NODELAY = 1'b1;
                   DO_tmp = Memory[A_i];
                   ->EventTOHDO;
                end else begin
                   NODELAY = 1'b0;
                   DO_tmp  = Memory[A_i];
                   DO_i    = DO_tmp;
                end
              end else begin
                NODELAY = 1'b1;
                DO_tmp = Memory[A_i];
                ->EventTOHDO;
              end
           end
           else begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
           end
        end
        1'bx: begin
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
        end
      endcase
  end
  endtask //memory_function;

  task A_monitor;
     begin
       if (^(A_) !== 1'bX) begin
          flag_A_x = `FALSE;
       end
       else begin
          if (flag_A_x == `FALSE) begin
              flag_A_x = `TRUE;
              ErrorMessage(2);
          end
       end
     end
  endtask //end A_monitor;

  task CS_monitor;
     begin
       if (^(CS_) !== 1'bX) begin
          flag_CS_x = `FALSE;
       end
       else begin
          if (flag_CS_x == `FALSE) begin
              flag_CS_x = `TRUE;
              ErrorMessage(3);
          end
       end
     end
  endtask //end CS_monitor;

  task ErrorMessage;
     input error_type;
     integer error_type;

     begin
       case (error_type)
         0: $display("** MEM_Error: Abnormal transition occurred (%t) in Clock of %m",$time);
         1: $display("** MEM_Error: Read and Write the same Address, DO is unknown (%t) in clock of %m",$time);
         2: $display("** MEM_Error: Unknown value occurred (%t) in Address of %m",$time);
         3: $display("** MEM_Error: Unknown value occurred (%t) in ChipSelect of %m",$time);
         4: $display("** MEM_Error: Port A and B write the same Address, core is unknown (%t) in clock of %m",$time);
         5: $display("** MEM_Error: Clear all memory core to unknown (%t) in clock of %m",$time);
       endcase
     end
  endtask

  function AddressRangeCheck;
      input  [AddressSize-1:0] AddressItem;
      reg    UnaryResult;
      begin
        UnaryResult = ^AddressItem;
        if(UnaryResult!==1'bX) begin
           if (AddressItem >= Words) begin
              $display("** MEM_Error: Out of range occurred (%t) in Address of %m",$time);
              AddressRangeCheck = `FALSE;
           end else begin
              AddressRangeCheck = `TRUE;
           end
        end
        else begin
           AddressRangeCheck = `FALSE;
        end
      end
  endfunction //end AddressRangeCheck;

/* -----\/----- EXCLUDED -----\/-----
   specify
      specparam TAA  = (102.0:166.6:305.3);
      specparam TRC  = (121.5:189.3:328.4);
      specparam THPW = (40.5:63.1:109.5);
      specparam TLPW = (40.5:63.1:109.5);
      specparam TAS  = (10.0:12.3:22.7);
      specparam TAH  = (10.0:10.0:10.0);
      specparam TCSS = (17.0:23.2:42.8);
      specparam TCSH = (10.0:10.0:10.4);
      specparam TOE  = (23.0:35.5:60.9);
      specparam TOZ  = (20.5:30.9:52.3);

      $setuphold ( posedge CK &&& con_A,          posedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          negedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          posedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          negedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          posedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          negedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          posedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          negedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          posedge A[4], TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          negedge A[4], TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          posedge A[5], TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          negedge A[5], TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          posedge A[6], TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          negedge A[6], TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          posedge A[7], TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CK &&& con_A,          negedge A[7], TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CK &&& con_A,          posedge A[8], TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CK &&& con_A,          negedge A[8], TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CK &&& con_A,          posedge A[9], TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CK &&& con_A,          negedge A[9], TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CK,                    posedge CS, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CS, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& con_CK,         TRC,                       n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );

      if (NODELAY == 0)  (posedge CK => (DO[0] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[1] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[2] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[3] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[4] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[5] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[6] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[7] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[8] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[9] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[10] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[11] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[12] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[13] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[14] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[15] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[16] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[17] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[18] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[19] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[20] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[21] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[22] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[23] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[24] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[25] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[26] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[27] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[28] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[29] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[30] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[31] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[32] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[33] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[34] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[35] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[36] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[37] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[38] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[39] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[40] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[41] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[42] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[43] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[44] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[45] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[46] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[47] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[48] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[49] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[50] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[51] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[52] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[53] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[54] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[55] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[56] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[57] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[58] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[59] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[60] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[61] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[62] :1'bx)) = TAA  ;
      if (NODELAY == 0)  (posedge CK => (DO[63] :1'bx)) = TAA  ;


      (OE => DO[0]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[1]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[2]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[3]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[4]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[5]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[6]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[7]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[8]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[9]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[10]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[11]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[12]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[13]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[14]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[15]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[16]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[17]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[18]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[19]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[20]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[21]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[22]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[23]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[24]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[25]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[26]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[27]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[28]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[29]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[30]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[31]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[32]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[33]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[34]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[35]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[36]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[37]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[38]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[39]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[40]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[41]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[42]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[43]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[44]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[45]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[46]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[47]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[48]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[49]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[50]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[51]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[52]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[53]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[54]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[55]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[56]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[57]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[58]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[59]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[60]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[61]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[62]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
      (OE => DO[63]) = (TOE,  TOE,  TOZ,  TOE,  TOZ,  TOE  );
   endspecify
 -----/\----- EXCLUDED -----/\----- */

`endprotect
endmodule
