module ID_Gen_4
#(
    parameter ID_WIDTH_IN   = 8,
    parameter ID_WIDTH_OUT  = 6
)
(
    input   logic                               clk,
    input   logic                               rst_n,

    input   logic                               incr_i,
    output  logic                               full_o,
    input   logic [ID_WIDTH_IN-1:0]             ID_i,
    output  logic [ID_WIDTH_OUT-1:0]            ID_o,

    input   logic                               release_ID_i,
    input   logic [ID_WIDTH_OUT-1:0]            BID_i,
    output  logic [ID_WIDTH_IN-1:0]             BID_o,
    output  logic                               empty_o
);

integer i;
localparam     N_ENTRY = 4;
localparam     LOG_N_ENTRY = 2;



logic [N_ENTRY-1:0]                              VALID_TABLE;
logic [ID_WIDTH_IN-1:0]                          ID_TABLE [N_ENTRY-1:0];

logic                                            valid_ID_o;
logic [LOG_N_ENTRY-1:0]                          ID_int;

generate

  if(ID_WIDTH_OUT == LOG_N_ENTRY)
        assign ID_o = ID_int;
  else
        assign ID_o = {{(ID_WIDTH_OUT-LOG_N_ENTRY){1'b0}},ID_int};

endgenerate

assign full_o  = ~valid_ID_o;
assign empty_o = ~(|VALID_TABLE);

assign BID_o = ID_TABLE[BID_i[LOG_N_ENTRY-1:0]];


always_ff @(posedge clk, negedge rst_n)
begin
  if(rst_n == 1'b0)
  begin
    for(i=0; i<N_ENTRY; i++)
    begin
      VALID_TABLE[i] <= 1'b0;
      ID_TABLE[i]    <= '0;
    end
  end
  else
    begin

          if(release_ID_i)
            VALID_TABLE[BID_i[LOG_N_ENTRY-1:0]] <= 1'b0;
          else;


          casex(VALID_TABLE)

          4'bxxx0 : 
          begin
                    if(incr_i)
                    begin
                      VALID_TABLE[0] <= 1'b1;
                      ID_TABLE[0]    <= ID_i;
                    end
          end

          4'bxx01 : 
          begin
                    if(incr_i)
                    begin
                      VALID_TABLE[1] <= 1'b1;
                      ID_TABLE[1]    <= ID_i;
                    end
          end

          4'bx011 : 
          begin
                    if(incr_i)
                    begin
                      VALID_TABLE[2] <= 1'b1;
                      ID_TABLE[2]    <= ID_i;
                    end
          end

          4'b0111 : 
          begin
                    if(incr_i)
                    begin
                      VALID_TABLE[3] <= 1'b1;
                      ID_TABLE[3]    <= ID_i;
                    end
          end

          endcase

    end
end


always_comb
begin
          casex(VALID_TABLE)

          4'bxx0 : 
          begin
                    ID_int            = 0;
                    valid_ID_o        = 1'b1;
          end

          4'bxx01 :
          begin
                    ID_int            = 1;
                    valid_ID_o      = 1'b1;
          end

          4'bx011 :
          begin
                    ID_int            = 2;
                    valid_ID_o      = 1'b1;
          end

          4'b0111 :
          begin
                    ID_int            = 3;
                    valid_ID_o      = 1'b1;
          end

          4'b1111 :
          begin
                    ID_int            = 'X;
                    valid_ID_o      = 1'b0;
          end

          default :
          begin
                    ID_int            = 'X;
                    valid_ID_o      = 1'b0;
          end
          endcase
end




endmodule