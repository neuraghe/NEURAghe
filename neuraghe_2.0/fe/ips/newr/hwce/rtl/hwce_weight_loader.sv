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
  parameter FILTER_SIZE         = 3, //3
  parameter N_ACCELERATOR_PORT  = 8, //8
  parameter N_ROW               = 4, //4
  parameter N_COL               = 4, //4
  parameter NPF                 = 3  // number of parallel filters
)
(
  input  logic                                                                     clk,
  input  logic                                                                     rst_n,
  input  logic                                                                     start_i,
  output logic                                                                     done_o,
  input  logic [3:0]                                                               mask_i, // not used
  input  logic [3:0]                                                               size_i, // not used
  output logic [N_ROW-1:0][N_COL-1:0][FILTER_SIZE * FILTER_SIZE * NPF - 1:0][15:0] weights_o,
  output logic [N_ROW-1:0][15:0]                                                   bias,
  
  // TCDM interface
  output logic [N_ACCELERATOR_PORT-1:0]                                            tcdm_req_o,
  output logic [N_ACCELERATOR_PORT-1:0][31:0]                                      tcdm_addr_o,
  input  logic [N_ACCELERATOR_PORT-1:0][31:0]                                      tcdm_r_rdata_i,
  input  logic [N_ACCELERATOR_PORT-1:0]                                            tcdm_wait_ni
);
  localparam NUM_OF_WEIGTHS   = N_ROW*N_COL*(FILTER_SIZE * FILTER_SIZE * NPF + (FILTER_SIZE * FILTER_SIZE * NPF)%2); // rouded to upper 2 multiple
  localparam WORD_NUM         = NUM_OF_WEIGTHS / (N_ACCELERATOR_PORT*2) +( NUM_OF_WEIGTHS) % 2; // number of words needed to store all the weigths into the WL memory with word of N_ACCELERATOR_PORT*2 * 16 bit
  localparam ADDR_WIDTH       = $clog2(WORD_NUM);
  localparam WSET_STRIDE = (FILTER_SIZE * FILTER_SIZE * NPF + (FILTER_SIZE * FILTER_SIZE * NPF)%2)/2;
  localparam BIAS_WORD     = WSET_STRIDE - 1; // the word that may contains a bias is the last of a set.
  
  const logic [31:0] tcdm_base_addr = 32'h0;
  logic [ADDR_WIDTH - 1 : 0] counter;
  logic [ADDR_WIDTH - 1 : 0] counter_old;
  logic [ADDR_WIDTH - 1 : 0] counter_to_addr;
  enum { idle, counting } fsm_state;
  logic counter_en;
  logic counter_clr;
  logic wait_n;
  logic is_counting;
  logic [N_ACCELERATOR_PORT-1:0][31:0]                   weight_in;

  
  logic                                                  weight_latch_re;
  logic [ADDR_WIDTH-1:0]                                 weight_latch_addr;
  logic [N_ACCELERATOR_PORT * 32-1:0]                    weight_latch_rdata;
  logic                                                  weight_latch_we;
  logic [N_ACCELERATOR_PORT*32-1:0]                      weight_latch_wdata;
  logic [N_ACCELERATOR_PORT*4-1:0]                         weight_latch_be;
  logic [2**ADDR_WIDTH-1:0][N_ACCELERATOR_PORT-1:0][2-1:0][15:0] weight_latch_mem;

  // weight address computation - interleaved
  assign counter_to_addr = wait_n ? counter : counter_old;

  genvar i;
  generate
    for(i=0; i <N_ACCELERATOR_PORT; i++)
    begin
      assign tcdm_addr_o[i] = {tcdm_base_addr[31 : ADDR_WIDTH], counter_to_addr};
      assign tcdm_req_o[i] = (fsm_state == counting) ? 1'b1 : 1'b0;
    end
  endgenerate
  // scm
  register_file_1r_1w_all #(
    .ADDR_WIDTH ( ADDR_WIDTH          ),
    .DATA_WIDTH ( N_ACCELERATOR_PORT * 32 )
  ) weight_latch_i (
    .clk        ( clk                     ),
    .rst_n      ( rst_n                   ),
    .ReadEnable ( weight_latch_re         ), // fixed to 0
    .ReadAddr   ( weight_latch_addr       ),
    .ReadData   ( weight_latch_rdata      ), // not used
    .WriteAddr  ( weight_latch_addr       ),
    .WriteEnable( weight_latch_we         ),
    .WriteData  ( weight_latch_wdata      ),
    .WriteBE    ( weight_latch_be         ),
    .MemContent ( weight_latch_mem        ) //[2**ADDR_WIDTH-1:0][DATA_WIDTH-1:0]
  );
  assign weight_latch_re    = 1'b0;
  assign weight_latch_we    = is_counting & wait_n;
  assign weight_latch_wdata = weight_in;
  assign weight_latch_be    = {(4*N_ACCELERATOR_PORT){1'b1}};
  
  
  
  //weigths rewiring
  
  genvar r,c,k;
  generate
    for (r=0;r<N_ROW;r++) begin
      for (c=0;c<N_COL;c++) begin
        for (k=0;k<FILTER_SIZE*FILTER_SIZE  * NPF;k++) begin
         // assign weights_o [r][c][k]   = weight_latch_mem [(r/(N_ACCELERATOR_PORT/N_COL))*(FILTER_SIZE*FILTER_SIZE*NPF/2 + (FILTER_SIZE*FILTER_SIZE*NPF)%2) + k/2]  [r%(N_ACCELERATOR_PORT/N_COL)*N_COL+c]  [k%2] ; // MEM_WORD, PORT OF ORIGIN, W

          // [2**ADDR_WIDTH-1:0][N_ACCELERATOR_PORT-1:0][2-1:0][15:0]
          assign weights_o [r][c][k]   = weight_latch_mem [k/4][(k%4)/2+(c+r*4)*2][k%2];
        end
        
      end
    end
  endgenerate

  // biases are stored in the last 16bit slot of each set of weights.
  genvar b;
  generate
    for (b=0;b<N_ROW;b++)
      assign bias [b] = weight_latch_mem[WSET_STRIDE * (b/2) +BIAS_WORD][(b%2)*4][1];
  endgenerate
  
  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0) begin
      weight_latch_addr <= 0;
    end
    else if(wait_n == 1'b1) begin
      weight_latch_addr <= counter;
    end
  end

  // weight counter
  always_ff @(posedge clk or negedge rst_n)
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
  
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (rst_n == 1'b0) begin
      counter_old <= {ADDR_WIDTH{1'b0}};
    end
    else if (counter_en == 1'b1) begin
        counter_old <= counter;
      end
  end

  assign counter_en = (fsm_state == counting) & wait_n;
  
  generate
    if (N_ACCELERATOR_PORT>1)
      assign wait_n = &tcdm_wait_ni[N_ACCELERATOR_PORT-1:0];
    else
      assign wait_n = tcdm_wait_ni[0];
  endgenerate
  
  
  always_ff @(posedge clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      is_counting <= 1'b0;
    else if(fsm_state == counting)
      is_counting <= 1'b1;
    else
      is_counting <= 1'b0;
  end

  // fsm
  always_ff @(posedge clk or negedge rst_n)
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
          if ((counter == WORD_NUM) && (wait_n == 1'b1)) begin
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

  // masking
  genvar j;
  generate
    for(j=0; j<N_ACCELERATOR_PORT; j++) begin : gen_j
      for(i=0; i<2; i++) begin : gen_i
        always_comb begin          
          weight_in[j][16*(i+1)-1:16*i] = tcdm_r_rdata_i[j][16*(i+1)-1:16*i];  
        end
      end
    end
  endgenerate

endmodule
