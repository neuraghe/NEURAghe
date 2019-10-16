`define ADDR_STDOUT_PRINT 32'hE0001000
`define ADDR_STDOUT_FS    32'h1A111000

`define ADDR_FOPEN  32'h1A112000
`define ADDR_RW     32'h1A113000
`define CMD_FOPEN   0
`define CMD_FCLOSE  1
 
module FS_HANDLER
#(
    parameter  ADDR_WIDTH = 32,
    parameter  DATA_WIDTH = 64,
    parameter  NB_CORES   = 4
)
(
    input  logic                      clk,
    input  logic                      rst_n,

    input  logic                      CSN,
    input  logic                      WEN,
    input  logic [ADDR_WIDTH-1:0]     ADDR,
    input  logic [DATA_WIDTH-1:0]     WDATA,
    input  logic [DATA_WIDTH/8-1:0]   BE,
    output logic [DATA_WIDTH-1:0]     RDATA
);


    //addr demux block
    logic      [11:0]                 add_fopen;
    logic      [31:0]                 dat_fopen;
    logic                             req_fopen;

    //addr demux block
    logic      [11:0]                 add_stdout;
    logic      [31:0]                 dat_sdtout;
    logic                             req_stdout;

    integer     FILE_00;
    integer     FILE_TO_OPEN;
    string      file_name;
    integer     tmp;
    integer     single_char;

    event FOPEN_EVENT;
    event FCLOSE_EVENT;
    event READ_EVENT;
    event WRITE_EVENT;



   assign req_stdout = ( (CSN == 1'b0) && (WEN == 1'b0) && ({ADDR[31:8],8'h00} == `ADDR_STDOUT_PRINT) );
   assign req_fopen  = ( (CSN == 1'b0) && (WEN == 1'b0) && (ADDR == `ADDR_STDOUT_FS) );

   assign req_rw     = (CSN == 1'b0) && (ADDR == `ADDR_RW);

   assign add_stdout = ADDR[11:0];
   assign add_fopen  = ADDR[11:0];
   assign add_rw     = ADDR[11:0];

   assign dat_stdout = WDATA[31:0];
   assign dat_fopen  = WDATA[31:0];
   assign dat_rw     = WDATA[31:0];

   debug
   #(
      .ADDR_WIDTH   ( 12       ),
      .DATA_WIDTH   ( 32       ),
      .NB_CORES     ( NB_CORES ),
      .DEBUG_TYPE   ( "PE"     ),  // FS || PE
      .SILENT_MODE  ( "OFF"    ),  // ON || OFF
      .COLORED_MODE ( "OFF"    )   // ON || OFF
   )
   STDOUT_PRINTF
   (
      .rst_ni ( rst_n              ),
      .clk_i  ( clk                ),
      .req_i  ( req_stdout         ),
      .add_i  ( 12'b0         ),
      .dat_i  ( WDATA[31:0]        )
   );

   debug
   #(
      .ADDR_WIDTH   ( 12       ),
      .DATA_WIDTH   ( 32       ),
      .NB_CORES     ( NB_CORES ),
      .DEBUG_TYPE   ( "FS"     ),  // FS || PE
      .SILENT_MODE  ( "ON"     ),  // ON || OFF
      .COLORED_MODE ( "OFF"    )   // ON || OFF
   )
   FS_PRINTF
   (
      .rst_ni ( rst_n              ),
      .clk_i  ( clk                ),
      .req_i  ( req_fopen          ),
      .add_i  ( ADDR[11:0]         ),
      .dat_i  ( WDATA[31:0]        )
   );

   always @(FOPEN_EVENT)
   begin
      FOPEN();
   end

   always @(FCLOSE_EVENT)
   begin
      FCLOSE();
   end


   always @(READ_EVENT)
   begin
    F_READ();
   end

   always @(WRITE_EVENT)
   begin
    F_WRITE();
   end



   always_ff @(posedge clk, negedge rst_n)
   begin
      if(rst_n == 1'b0)
      begin
        RDATA <= '0;
      end
      else
      begin
        if ( (CSN == 1'b0) && (WEN == 1'b1) && ({ADDR[31:8],8'h00} == `ADDR_STDOUT_PRINT) )
          RDATA<='0; //workaround fof simulation of code written for uart in Zynq.
        else
          RDATA <= single_char;
        

        if((ADDR == `ADDR_FOPEN ) && ( CSN == 1'b0 ) && (WEN == 1'b0) && (WDATA == `CMD_FOPEN) )
          -> FOPEN_EVENT;

        if((ADDR == `ADDR_FOPEN ) && ( CSN == 1'b0 ) && (WEN == 1'b0) && (WDATA == `CMD_FCLOSE) )
          -> FCLOSE_EVENT;


        if((ADDR == `ADDR_RW ) && ( CSN == 1'b0 ) && (WEN == 1'b1))
          -> READ_EVENT;

        if((ADDR == `ADDR_RW ) && ( CSN == 1'b0 ) && (WEN == 1'b0))
          -> WRITE_EVENT;
      end
   end
   
   
   task FOPEN;
      FILE_00      = $fopen("FS/FILE_00.txt", "r");
      tmp          = $fgets(file_name, FILE_00);
      $fclose(FILE_00);
      $display("Openening Binary file %s",file_name);
      file_name = file_name.substr(0,file_name.len()-2);
      FILE_TO_OPEN = $fopen(file_name, "r+b");
      if (!FILE_TO_OPEN)
        $error("Error opening the FILE %s", file_name);
   endtask


   task FCLOSE;
      FILE_00      = $fopen("FS/FILE_00.txt","r");
      tmp          = $fgets(file_name, FILE_00);
      $fclose(FILE_00);
      $display("Closing Binary file %s",file_name);
      $fclose(FILE_TO_OPEN);
   endtask   
   
   
   task F_READ;
      single_char = $fgetc(FILE_TO_OPEN);
   endtask 
   
   task F_WRITE;
      $fwrite(FILE_TO_OPEN, "%c", WDATA);
   endtask   
   
endmodule
