module debug
#(
    parameter ADDR_WIDTH   = 12,
    parameter DATA_WIDTH   = 32,
    parameter NB_CORES     = 4,
    parameter DEBUG_TYPE   = "FS",  // FS || PE
    parameter SILENT_MODE  = "OFF", // ON || OFF
    parameter FULL_LINE    = "ON",  // ON || OFF  Print only full lines of fake stdout
    parameter COLORED_MODE = "ON"   // ON || OFF
)
(
      input  logic                      rst_ni,        //: in  std_logic;
      input  logic                      clk_i,         //: in  std_logic;
      input  logic                      req_i,         //: in  std_logic;
      input  logic [ADDR_WIDTH-1:0]     add_i,         //: in  std_logic_vector(11 downto 0);
      input  logic [DATA_WIDTH-1:0]     dat_i          //: in  std_logic_vector(31 downto 0));
);

localparam              LOG_2_NB_CORES = NB_CORES <= 1 ? 1 : $clog2(NB_CORES);

integer                 IOFILE[NB_CORES];
string                  FILENAME[NB_CORES];
string                  FILE_ID;
int unsigned            index;

string                  LINE_BUFFER[NB_CORES];

initial
begin
    for(index = 0; index < NB_CORES; index++)
    begin : _CREATE_IO_FILES_
              FILE_ID.itoa(index);
              case(DEBUG_TYPE)
                "FS" : FILENAME[index] = { "FS_FILE_", FILE_ID, ".txt" };
                "PE" : FILENAME[index] = { "stdout/stdout_fake_pe", FILE_ID     };
              endcase
              IOFILE[index]   = $fopen(FILENAME[index],"w");

              LINE_BUFFER[index] = "";
    end
end


always @(posedge clk_i)
begin
    if(rst_ni == 1'b1)
    begin
        if( req_i == 1'b1)
        begin
          
          if(NB_CORES > 1 )
            begin
              index = add_i[LOG_2_NB_CORES-1:0];
              //$display("aaaa");
            end
          else
            begin
              index = 0;
              //$display("bbbb");
            end
          
          //$display("add_i: %0x", add_i);

          $fwrite(IOFILE[index],"%s",dat_i[7:0]);

          if(SILENT_MODE == "OFF")
          begin
                if(COLORED_MODE == "ON")
                begin
                      case(index)
                      0:  begin  $write("%c[1;30m",27); end
                      1:  begin  $write("%c[1;31m",27); end
                      2:  begin  $write("%c[1;32m",27); end
                      3:  begin  $write("%c[1;33m",27); end
                      4:  begin  $write("%c[1;34m",27); end
                      5:  begin  $write("%c[1;35m",27); end
                      6:  begin  $write("%c[1;36m",27); end
                      7:  begin  $write("%c[4;30m",27); end
                      8:  begin  $write("%c[4;31m",27); end
                      9:  begin  $write("%c[4;32m",27); end
                      10: begin  $write("%c[4;33m",27); end
                      11: begin  $write("%c[4;34m",27); end
                      12: begin  $write("%c[4;35m",27); end
                      13: begin  $write("%c[4;36m",27); end
                      14: begin  $write("%c[5;30m",27); end
                      15: begin  $write("%c[5;31m",27); end
                      endcase
                end

                if (FULL_LINE == "ON")
                begin
                    LINE_BUFFER[index] = {LINE_BUFFER[index], string'(dat_i[7:0])};
                end else begin
                    $write("PE%0d Required Putchar: %s", index, dat_i[7:0]);

                    if(COLORED_MODE == "ON")
                        $write("%c[0m\n",27);
                    else
                        $write("\n");
                end
          end

          if((dat_i[7:0] == 10) || (dat_i == 0))
          begin
              if(NB_CORES > 1)
                $fflush(IOFILE[add_i[LOG_2_NB_CORES-1:0]]);
              else
                $fflush(IOFILE[0]);


              if(SILENT_MODE == "OFF")
              begin
                  if (FULL_LINE == "ON")
                  begin
                      $display("[STDOUT-PE%0d] %s", index, LINE_BUFFER[index].substr(0, LINE_BUFFER[index].len()-2));
                      LINE_BUFFER[index] = "";
                  end else begin
                      $display("PE%0d Writing line", index);
                  end
              end
          end

        end
    end
end



endmodule
