////////////////////////////////////////////////////////////////////////////////
// Company:        Multitherman Laboratory @ DEIS - University of Bologna     //
//                    Viale Risorgimento 2 40136                              //
//                    Bologna - fax 0512093785 -                              //
//                                                                            //
// Engineer:       Davide Rossi - davide.rossi@unibo.it                       //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    13/02/2013                                                 // 
// Design Name:    ULPSoC                                                     // 
// Module Name:    ulpcluster_top                                             //
// Project Name:   ULPSoC                                                     //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    ULPSoC cluster                                             //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
// Revision v0.2 - Added DVS-DVSE support for memories                        //
// Revision v0.3 - Cleand Code, added non-blocking assign in the always_ff    //
// Revision v0.4 - Updated the address range from [4:3] to[3:2]               //
// Revision v0.5 - Restored Back Addr range [4:3], because of TB issues       //
// Revision v0.6 - 29/05/15 : removed DVS-DVSE, added HS,LS,RM,WM             //
//                 LS is default 1, other are '0 by default                   //
// ciaoooooo                                                                  //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module cluster_control_unit
#(
    parameter CORE_NUM     = 4,
    parameter PER_ID_WIDTH = 5,
    parameter RM_SIZE      = 4,
    parameter WM_SIZE      = 4
)
(
    input logic                      clk_i,
    input logic                      rst_ni,
    input logic                      en_sa_boot_i,
    input logic                      fetch_en_i,
    output logic                     addr_tran_en_o,
    XBAR_PERIPH_BUS.Slave            speriph_slave,

    output logic                     event_o,
    output logic                     eoc_o,

    output logic                     LS_o,
    output logic                     HS_o,
    
    output logic [RM_SIZE-1:0]       RM_o,
    output logic [WM_SIZE-1:0]       WM_o,

    output logic [2-1:0]             return_o,

    output logic [CORE_NUM-1:0]      fetch_enable_o
);

    logic                               r_valid;
    logic [PER_ID_WIDTH-1:0]            id;
    logic [31:0]                        rdata;
    logic [2:0]                         fetch_en_i_P;
    logic                               start_fetch;
    logic [CORE_NUM:0]                  r_fetch_en;

generate
    if(CORE_NUM > 1 )
    begin
        assign fetch_enable_o[CORE_NUM-1:1]   = r_fetch_en[CORE_NUM:2];
    end
endgenerate

    assign fetch_enable_o[0]              = r_fetch_en[1] | (en_sa_boot_i & r_fetch_en[0]);
    assign addr_tran_en_o                 = (en_sa_boot_i & r_fetch_en[0]);

    assign start_fetch                    = fetch_en_i_P[1] & !(fetch_en_i_P[0]);

    ////////ASYNCH SIGNAL SYNCHRONIZER + EDGE DETECTOR\\\\\\\\
    always_ff @(posedge clk_i, negedge rst_ni)
    begin
      if(rst_ni == 1'b0)
          begin
            fetch_en_i_P <= 3'b000;
          end
          else
          begin
            fetch_en_i_P <= {fetch_en_i,fetch_en_i_P[2:1]};
      end
    end


    always_ff @(posedge clk_i, negedge rst_ni)
    begin
          if(rst_ni == 1'b0)
          begin
              eoc_o          <= 1'b0;
              return_o       <= 1'b0;
              
              event_o        <=   1'b0;
              r_fetch_en     <=  'h0;
              r_valid        <= 1'b0;
              id             <= '0;
              rdata          <= '0;
              HS_o           <= 1'b0;
              LS_o           <= 1'b1;
              RM_o           <= '0;
              WM_o           <= '0;
          end
          else //~ not reset
          begin
                event_o    <= 1'b0;
                if (en_sa_boot_i)
                  r_fetch_en[0] <= 'b1;
                else
                  r_fetch_en  <= r_fetch_en;

                if (speriph_slave.req == 1'b1)
                begin
                      r_valid  <= 1'b1;
                      id       <= speriph_slave.id;

                       // WRITE
                      if(speriph_slave.wen == 1'b0)
                      begin : WRITE_CTRL_REGS

                            case( speriph_slave.add[4:3] )

                            2'b11: 
                            begin //0x00  {LS_o,HS_o,WM_o,RM_o}
                                  RM_o     <= speriph_slave.wdata[RM_SIZE-1:0];
                                  WM_o     <= speriph_slave.wdata[WM_SIZE+RM_SIZE-1:RM_SIZE];
                                  HS_o     <= speriph_slave.wdata[WM_SIZE+RM_SIZE];
                                  LS_o     <= speriph_slave.wdata[WM_SIZE+RM_SIZE+1];
                            end

                            2'b01: 
                            begin //0x04
                                  r_fetch_en[CORE_NUM:1] <= speriph_slave.wdata[CORE_NUM-1:0];
                                  r_fetch_en[0]          <= speriph_slave.wdata[CORE_NUM];
                            end

                            2'b10: // 0x08
                            begin
                                  event_o <= speriph_slave.wdata[0];
                            end

                            2'b00: // 0x00
                            begin
                                  eoc_o    <= speriph_slave.wdata[0];
                                  return_o <= speriph_slave.wdata[2:1];
                                  
                            end

                            endcase

                      end
                      else  // READ
                      begin : READ_CTRL_REGS
                            case( speriph_slave.add[4:3] )

                            2'b11: 
                            begin 
                                  rdata[WM_SIZE+RM_SIZE+1]               <= LS_o;
                                  rdata[WM_SIZE+RM_SIZE  ]               <= HS_o;
                                  rdata[WM_SIZE+RM_SIZE-1:RM_SIZE]       <= WM_o;
                                  rdata[RM_SIZE-1:0]                     <= RM_o;
                            end

                            2'b00:
                            begin
                                  rdata[0]    <= eoc_o;
                            
                                  rdata[2:1]  <= return_o;
                                  rdata[31:3] <= '0;
                            
                            end

                            2'b01:
                            begin
                                  rdata[CORE_NUM-1:0]  <= r_fetch_en[CORE_NUM:1];
                                  rdata[CORE_NUM]      <= r_fetch_en[0];
                                  rdata[31:CORE_NUM+1] <= '0;
                            end

                            default:
                            begin
                                  rdata <= '0;
                            end
                            endcase

                      end
                end
                else // There is no request
                begin
                  r_valid <= 1'b0;
                  rdata   <= 'X;

                  //initialize fetch register after a rising edge of the signal fetch_en_i
                  if( start_fetch )
                  begin
                        r_fetch_en[CORE_NUM:1] <= '1;
                  end
               end // end of if not req
          end // end of if not reset
    end // end of always_ff

   // to check with igor
   assign speriph_slave.gnt                    = 1'b1;
   assign speriph_slave.r_valid                = r_valid;
   assign speriph_slave.r_opc                  = 1'b0;
   assign speriph_slave.r_id                   = id;
   assign speriph_slave.r_rdata                = rdata;

endmodule
