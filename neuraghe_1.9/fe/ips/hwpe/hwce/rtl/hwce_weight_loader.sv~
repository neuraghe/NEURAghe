/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 *          EOLAB @ DIEE - Università degli studi di Cagliari                 *
 *                      Via marengo 2 - 09123                                 *
 *                              Cagliari                                      *
 *                                                                            *
 *                                                                            *
 * Engineer:       Francesco Conti  - f.conti@unibo.it                        *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                                                                            *
 * Project:        Shared-memory HWPE wrapper                                 *
 * File:           weight_loader.sv                                           *
 * Description:    Weight loader for the HWCE                                 *
 *                                                                            *
 ******************************************************************************/

module hwce_weight_loader
#(
  parameter FS          = 3, //3
  parameter WL_PORTS    = 8, //8
  parameter DATA_WIDTH  = 64,
  parameter BE_WIDTH      = DATA_WIDTH/8,  
  parameter CONV_WIDTH  = 16,
  parameter N_ROW       = 4, //4
  parameter N_COL       = 4, //4
  parameter NPF         = 3  // number of parallel filters
)
(
  input  logic                                                             clk,
  input  logic                                                             rst_n,
  input  logic                                                             start_i,
  output logic                                                             done_o,
  input  logic [32-1:0]                                                    wl_base_addr_i, 
  output logic [N_ROW-1:0][N_COL-1:0][FS * FS * NPF - 1:0][CONV_WIDTH-1:0] weights_o,
  output logic [N_ROW-1:0][CONV_WIDTH-1:0]                                 bias,
  
  XBAR_TCDM_BUS_64BIT.Master                                               wl_mem_bus [WL_PORTS - 1:0]
);
  localparam NUM_OF_ELEMENTS  = 32;
  localparam NUM_OF_WEIGTHS   = N_ROW * N_COL * NUM_OF_ELEMENTS; 
  localparam WORD_NUM         = NUM_OF_WEIGTHS / (WL_PORTS*DATA_WIDTH/CONV_WIDTH) ; // number of words needed to store all the weigths into the WL memory with word of WL_PORTS*2 * 16 bit
  localparam ADDR_WIDTH       = $clog2(WORD_NUM);
  localparam BIAS_POS         = 27; // the word that contains the bias is the last of a set.
  localparam WS_WORD_WIDTH    = NUM_OF_ELEMENTS / WORD_NUM;
  
  logic [32-1:0] base_addr;
  
  logic [ADDR_WIDTH - 1 : 0] counter;
  logic [ADDR_WIDTH - 1 : 0] counter_old;
  logic [ADDR_WIDTH - 1 : 0] counter_to_addr;
  enum { idle, counting } fsm_state;
  logic counter_en;
  logic counter_clr;
  logic wait_n;
  logic is_counting;
  logic [WL_PORTS-1:0][DATA_WIDTH-1:0]                   weights_in;

  
//  logic                                                  weights_re;
  logic [ADDR_WIDTH-1:0]                                 weights_addr;
 // logic [WL_PORTS * 32-1:0]                    weights_rdata;
  logic                                                  weights_we;
  //logic [WL_PORTS*32-1:0]                      weights_wdata;
  logic [WL_PORTS*DATA_WIDTH/8-1:0]                         weights_be;
  logic [2**ADDR_WIDTH-1:0][WL_PORTS-1:0][DATA_WIDTH/CONV_WIDTH-1:0][CONV_WIDTH-1:0] weights_mem;

  // weight address computation - interleaved
  assign counter_to_addr = wait_n ? counter : counter_old;
  assign base_addr = wl_base_addr_i;
  genvar i;
  generate
    for(i=0; i <WL_PORTS; i++)
    begin
      assign wl_mem_bus[i].add = base_addr + counter_to_addr;
      assign wl_mem_bus[i].req = (fsm_state == counting) ? 1'b1 : 1'b0;
    end
  endgenerate
  // scm
  register_file_1r_1w_all #(
    .ADDR_WIDTH ( ADDR_WIDTH          ),
    .DATA_WIDTH ( WL_PORTS * DATA_WIDTH )
  ) weights_i (
    .clk        ( clk                     ),
    .rst_n      ( rst_n                   ),
    .ReadEnable ( 1'b0         ), // tied to 0
    .ReadAddr   ( weights_addr       ),
    .ReadData   (       ), // not used
    .WriteAddr  ( weights_addr       ),
    .WriteEnable( weights_we         ),
    .WriteData  ( weights_in      ),
    .WriteBE    ( weights_be         ),
    .MemContent ( weights_mem        ) //[2**ADDR_WIDTH-1:0][DATA_WIDTH-1:0]
  );
 // assign weights_re    = 1'b0;
  assign weights_we    = is_counting & wait_n;
 // assign weights_wdata = weight_in;
  assign weights_be    = {(BE_WIDTH*WL_PORTS){1'b1}};
  
  
  
  //weigths rewiring
  
  genvar r,c,k;
  generate
    for (r=0;r<N_ROW;r++) begin
      for (c=0;c<N_COL;c++) begin
        for (k=0;k<FS*FS  * NPF;k++) begin
          assign weights_o [r][c][k]   = weights_mem [k/WS_WORD_WIDTH][(c+r*N_COL)][k%WS_WORD_WIDTH];
        end
        
      end
    end
  endgenerate

  // biases are stored in the last slot of each set of weights.
  genvar b;
  generate
    for (b=0;b<N_ROW;b++)
      //logic [2**ADDR_WIDTH-1:0][WL_PORTS-1:0][DATA_WIDTH/CONV_WIDTH-1:0][CONV_WIDTH-1:0] weights_mem;
      assign bias [b] = weights_mem[WORD_NUM-1][b*N_COL][WS_WORD_WIDTH-1]; // weights_mem[6][b*4][3] with N_ROW=N_COL=4
  endgenerate
  
  always_ff @(posedge clk )
  begin
    if(rst_n == 1'b0) begin
      weights_addr <= 0;
    end
    else if(wait_n == 1'b1) begin
      weights_addr <= counter;
    end
  end

  // weight counter
  always_ff @(posedge clk )
  begin
    if (rst_n == 1'b0) begin
      counter <= {ADDR_WIDTH{1'b0}};
    end
    else begin
      if (counter_clr == 1'b1) 
        counter <= {ADDR_WIDTH{1'b0}};
      else if (counter_en == 1'b1) begin
        counter <= counter + 1;
      end
    end
  end
  
  always_ff @(posedge clk )
  begin
    if (rst_n == 1'b0) begin
      counter_old <= {ADDR_WIDTH{1'b0}};
    end
    else if (counter_en == 1'b1) begin
        counter_old <= counter;
      end
  end

  assign counter_en = (fsm_state == counting) & wait_n;
   
  logic [WL_PORTS-1:0] wl_mem_gnt;  
   

  assign wait_n = &wl_mem_gnt;
  
  //assign wait_n = &tcdm_wait_ni[WL_PORTS-1:0].gnt;
  //  else
  //    assign wait_n = wl_mem_bus[0].gnt;
  
  
  genvar q;
  generate
  for (q=0;q<WL_PORTS;q++)
  begin  
    assign wl_mem_gnt[q] = wl_mem_bus[q].gnt;
    assign wl_mem_bus[q].wen   = 1'b1;
    assign wl_mem_bus[q].wdata = '0;
    assign wl_mem_bus[q].be    = {(BE_WIDTH){1'b0}};
  end  
  endgenerate
  
  
  always_ff @(posedge clk)
  begin
    if(rst_n == 1'b0)
      is_counting <= 1'b0;
    else if(fsm_state == counting)
      is_counting <= 1'b1;
    else
      is_counting <= 1'b0;
  end

  // fsm
  always_ff @(posedge clk)
  begin
    if (rst_n == 1'b0) begin
      fsm_state <= idle;
      done_o    <= 1'b0;
      counter_clr <= 1'b1;
    end
    else begin
      case(fsm_state)
        idle: begin
          if ((start_i == 1'b1) )//&& (wait_n == 1'b1))
            fsm_state <= counting;
          done_o      <= 1'b0;
          counter_clr <= 1'b0;
        end
        counting: begin
          if ((counter == WORD_NUM-1) && (wait_n == 1'b1)) begin
            fsm_state <= idle;
            done_o      <= 1'b1;
            counter_clr <= 1'b1;
          end
          else begin
            done_o      <= 1'b0;
            counter_clr <= 1'b0;
          end
        end
        default: begin
          fsm_state <= idle;
          done_o    <= 1'b0;
          counter_clr <= 1'b0;
        end
      endcase
    end
  end

  genvar j;
  generate
    for(j=0; j<WL_PORTS; j++)                   
        assign weights_in[j] = wl_mem_bus[j].r_rdata;  
        
      
  endgenerate

endmodule
