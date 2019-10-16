/*********************************************************************
 *
 * -- VERILOG Model for a 1Mb Quad SPI MRAM
 *  -- Device Part Number: MR10Q010
 *  -- Device Data Sheet: http://www.everspin.com/PDF/EST_MR10Q010_Datasheet.pdf
 *
 *  -- Model Revision: 1.0
 *  -- Model Release Date: October 2013
 *
 *  ---------------------------------------------------------------------
 *  -- This Verilog models is provided "as is" without warranty of
 *  -- any kind, included but not limited to, implied warranty of
 *  -- merchant ability and fitness for a particular purpose.
 *  -- Please refer to the datasheet for all specifications. 
 *  -- Datasheet serves as the final arbiter of product performance
 *  ---------------------------------------------------------------------
 *
 *  ***********************************************************************/


`timescale 1 ps/1 ps

module mr10q010
(
    SCK     ,
    SI      ,
    CS_B    ,
    HOLD_B  ,
    WP_B    ,
    SO
);
    input  SCK    ;
    inout  SI     ;
    input  CS_B   ;
    inout  HOLD_B ;
    inout  WP_B   ;
    inout  SO     ;

    wire  SCK_ipd           ;
    wire  SI_ipd            ;
    wire  SI_in             ;
    assign SI_in = SI_ipd   ;
    wire  SI_out            ;
    assign SI_out = SI      ;
    wire  CS_B_ipd          ;
    wire  HOLD_B_ipd        ;
    wire  WP_B_ipd          ;
    wire  SO_ipd            ;
    wire HOLD_B_in          ;
    assign HOLD_B_in = (HOLD_B_ipd === 1'bx) ? 1'b1 : HOLD_B_ipd;
    wire   HOLD_B_out          ;
    assign HOLD_B_out = HOLD_B ;
    wire   WP_B_in             ;
    assign WP_B_in = (WP_B_ipd === 1'bx) ? 1'b1 : WP_B_ipd;
    wire   WP_B_out         ;
    assign WP_B_out = WP_B  ;
    wire  SOIn              ;
    assign SOIn = SO_ipd    ;
    wire  SOut              ;
    assign SOut = SO        ;

    reg SLEEP_in       ;
    reg SLEEP_out      ;
    reg WAKE_in       ;
    reg WAKE_out      ;
    reg SOut_zd = 1'bZ;
    reg SOut_z  = 1'bZ;
    wire  SI_z        ;
    wire  SO_z         ;
    reg SIOut_zd = 1'bZ;
    reg SIOut_z  = 1'bZ;
    reg WP_BOut_zd   = 1'bZ;
    reg HOLD_BOut_zd = 1'bZ;
    assign SI_z = SIOut_z;
    assign SO_z = SOut_z;

    parameter UserPreload   = 1;
    parameter mem_file_name = "none";
    parameter TimingModel   = "DefaultTimingModel";
    parameter PartID        = "MR10Q010";
    parameter MaxData       = 255;
    parameter SecNum        = 3;
    parameter HiAddrBit     = 23;
    parameter AddrRANGE     = 17'h1FFFF;
    parameter BYTE          = 8;
    parameter Manuf_ID      = 16'h076B;
    parameter ES            = 8'h15;
    parameter DeviceID      = 24'h111111;

`define SPEEDSIM;

    reg PoweredUp;
    reg PDONE    ; 
    reg PSTART   ; 
    reg WDONE    ; 
    reg WSTART   ; 
    reg write;
    reg read_out;
    reg[7:0] Status_reg      = 8'b0;
    reg[7:0] Status_reg_in   = 8'b0;
    reg QUAD = 0;

    wire WEL;
    wire [1:0]BP;
    wire SRWD;
    reg WIP = 0;
    assign WEL      = Status_reg[1];
    assign BP       = Status_reg[3:2];
    assign SRWD     = Status_reg[7];

    integer SA          = 0;         
    integer Byte_number = 0;
    integer sect;

    integer Address = 0;         
    reg  change_addr;
    reg  rd_fast;       
    reg  rd_slow;
    reg  rd_jedec;
    reg  change_BP = 0;
    reg  rd_dual;
    reg  dual;
    wire fast_rd;
    wire rd;
    wire rd_jid;

    wire RD_EQU_1;
    assign RD_EQU_1 = rd_slow;
    wire RD_EQU_0;
    assign RD_EQU_0 = ~rd_slow;
    reg  hold_mode;
    reg  mpm_mode = 0;
    wire hold;

    reg [SecNum:0] Sec_Prot = 64'b0; 

    reg Viol = 1'b0;

    integer Mem[0:AddrRANGE];

    integer WByte[0:AddrRANGE];
    integer AddrLo = 0;
    integer AddrHi = AddrRANGE;

    reg[7:0]  old_bit, new_bit;
    integer old_int, new_int;
    integer wr_cnt;
    integer cnt;

    integer read_cnt = 0;
    integer read_addr = 0;
    reg[7:0] data_out;
    reg[39:0] ident_out;

    reg oe = 1'b0;
    event oe_event;



 buf   (SCK_ipd, SCK);
 buf   (SI_ipd, SI);

 buf   (CS_B_ipd, CS_B);
 buf   (HOLD_B_ipd, HOLD_B);
 buf   (WP_B_ipd, WP_B);
 buf   (SO_ipd, SO);

    nmos   (SO,   SO_z , 1);

    nmos   (SI,   SI_z , 1);
    nmos   (HOLD_B,   HOLD_BOut_zd , 1);
    nmos   (WP_B,   WP_BOut_zd , 1);

    wire deg_pin;
    wire deg_sin;
    wire deg_holdin;
    wire dual_wr;
    assign dual_wr = deg_holdin && QUAD;
    wire dual_rd;
    assign dual_rd = dual;
    wire quad_wr;
    assign quad_wr = SRWD && WEL ;
    wire power;
    assign power = PoweredUp;

 specify
     specparam           tV    = 7000;
     specparam           tDIS  = 7000;
     specparam           tHZ   = 7000;
     specparam           tSU   = 2000;
     specparam           tCSS  = 5000;
     specparam           tHD   = 2000;
     specparam           tCD   = 2000;
     specparam           tWPS  = 5000;
     specparam           tH    = 5000;
     specparam           tCSH  = 5000;
     specparam           tWPH  = 5000;
     specparam           tWH   = 4000;
     specparam           tWHR  =11000;
     specparam           tWL   = 4000;
     specparam           tWLR  =11000;
     specparam           tCSR  =10000;
     specparam           tCSW  =50000;
     specparam  tperiod_SCK_rd =25000;
     specparam  tperiod_SCK    = 9610;         

        `ifdef SPEEDSIM
            specparam   tWRITE                  =  3e3; 
            specparam   tWR                     =  3e3; 
            specparam   tDP                     = 10e3; 
            specparam   tRDP                    = 30e3; 
            specparam   tPU                     =  5e6; 
        `else
            specparam   tWRITE                  = 40e3; 
            specparam   tWR                     = 40e3; 
            specparam   tDP                     =  3e6; 
            specparam   tRDP                    =400e6; 
            specparam   tPU                     =400e6; 
        `endif

  if (~dual) (SCK => SO) = tV;
  if (dual)  (SCK => SO) = tV;
  if (CS_B)(CS_B => SO) = tDIS;
  if (~dual) (HOLD_B => SO) = tHZ;
  if (dual)  (HOLD_B => SO) = tHZ;

  if (dual)(SCK => SI) = tV;
  if (dual && CS_B)(CS_B => SI) = tDIS;
  if (dual)(HOLD_B => SI) = tHZ;

  if (dual && QUAD)(SCK => HOLD_B) = tV;
  if (dual && CS_B && QUAD)(CS_B => HOLD_B) = tDIS;

  if (dual && QUAD)(SCK => WP_B) = tV;
  if (dual && CS_B && QUAD)(CS_B => WP_B) = tDIS;
        $setup ( SI             , posedge SCK &&& deg_sin,
                                                tSU, Viol);
        $setup ( negedge HOLD_B, posedge SCK &&& dual_wr,
                                                tHD, Viol);
        $setup ( posedge SCK    , posedge HOLD_B &&& dual_wr,
                                                tCD, Viol);
        $setup ( CS_B          , posedge SCK &&& power,
                                                tCSS, Viol);
        $setup ( WP_B          , negedge CS_B &&& WP_B,
                                                tWPS, Viol);

        $hold ( posedge SCK     , SI &&& deg_sin,
                                                tH, Viol);
        $hold ( posedge HOLD_B , posedge SCK &&& dual_wr,
                                                tHD, Viol);
        $hold ( posedge SCK     , CS_B &&& power,
                                                tCSH, Viol);
        $hold ( posedge CS_B   , WP_B &&& quad_wr,
                                                tWPH, Viol);
        $hold ( posedge SCK     , negedge HOLD_B &&& dual_wr,
                                                tCD, Viol);

        $width (posedge SCK &&& rd      , tWHR);
        $width (posedge SCK &&& fast_rd , tWH);
        $width (posedge SCK &&& dual_rd , tWH);
        $width (posedge SCK &&& rd_jid  , tWH);
        $width (negedge SCK &&& rd      , tWLR);
        $width (negedge SCK &&& fast_rd , tWL);
        $width (negedge SCK &&& dual_rd , tWL);
        $width (negedge SCK &&& rd_jid  , tWL);

        $width (posedge CS_B &&& RD_EQU_0, tCSW);
        $width (posedge CS_B &&& RD_EQU_1, tCSR);

        $period (posedge SCK &&& rd, tperiod_SCK_rd);
        $period (posedge SCK &&& fast_rd, tperiod_SCK);
        $period (posedge SCK &&& dual_rd, tperiod_SCK);
        $period (posedge SCK &&& rd_jid,  tperiod_SCK);

    endspecify

always @(Viol)                                                                               
begin                                                                                        
    if (Viol === 1'b1)                                                                       
    begin                                                                                    
        $display("\n====================================================================\n");
        $display("\n====ERROR: Simulation Terminated due to Timing Violation \n");           
        $display("\n====================================================================\n");
        $finish;                                                                             
    end                                                                                      
end                                                                                          

 parameter IDLE            =4'd0;
 parameter WRITE_SR        =4'd1;
 parameter SLEEP_WAIT      =4'd2;
 parameter SLEEP_STATE     =4'd3;
 parameter WRITE_STATE     =4'd6;

 reg [3:0] current_state;
 reg [3:0] next_state;

 parameter NONE            =5'd0;
 parameter WREN            =5'd1;
 parameter WRDI            =5'd2;
 parameter WRSR            =5'd3;
 parameter RDSR            =5'd4;
 parameter READ            =5'd5;
 parameter RDID            =5'd7;
 parameter FREAD           =5'd8;
 parameter DUAL_READ       =5'd9;
 parameter FRQO            =5'd10;
 parameter DH_READ         =5'd11;
 parameter FRQAD           =5'd12;
 parameter WRITE           =5'd15;
 parameter FWQD            =5'd16;
 parameter SLEEP           =5'd17;
 parameter WAKE            =5'd18;
 parameter FWQAD           =5'd25;
 reg [4:0] Instruct;

 parameter STAND_BY        =3'd0;
 parameter CODE_BYTE       =3'd1;
 parameter ADDRESS_BYTES   =3'd2;
 parameter DUMMY_BYTES     =3'd3;
 parameter MODE_BYTE       =3'd4;
 parameter DATA_BYTES      =3'd5;

 reg [2:0] bus_cycle_state;

 reg deq_pin;
    always @(SOIn, SO_z)
    begin
      if (SOIn==SO_z)
        deq_pin=1'b0;
      else
        deq_pin=1'b1;
    end
    assign deg_pin=deq_pin;

 reg deq_sin;
    always @(SI_in, SIOut_z)
    begin
      if (SI_in==SIOut_z)
        deq_sin=1'b0;
      else
        deq_sin=1'b1;
    end
    assign deg_sin=deq_sin;

 reg deq_holdin;
    always @(HOLD_B_ipd, HOLD_BOut_zd)
    begin
      if (HOLD_B_ipd==HOLD_BOut_zd)
        deq_holdin=1'b0;
      else
        deq_holdin=1'b1;
    end
    assign deg_holdin=deq_holdin;

    initial
    begin : Init

        write       = 1'b0;
        read_out    = 1'b0;
        Address     = 0;
        change_addr = 1'b0;

        PDONE       = 1'b1;
        PSTART      = 1'b0;


        WDONE       = 1'b1;
        WSTART      = 1'b0;

        SLEEP_in       = 1'b0;
        SLEEP_out      = 1'b0;
        WAKE_in      = 1'b0;
        WAKE_out     = 1'b0;
        Instruct    = NONE;

        bus_cycle_state = STAND_BY;
        current_state   = IDLE;
        next_state      = IDLE;
    end


    initial
    begin: InitMemory
    integer i;

        for (i=0;i<=AddrRANGE;i=i+1)
        begin
            Mem[i] = MaxData;
        end

        if ((UserPreload) && !(mem_file_name == "none"))
        begin
           $readmemh(mem_file_name,Mem);
        end

    end

    initial
    begin
        PoweredUp = 1'b0;
        #tPU PoweredUp = 1'b1;
    end

   always @(posedge SLEEP_in)
   begin:TSLEEPr
     #tDP SLEEP_out = SLEEP_in;
   end
   always @(negedge SLEEP_in)
   begin:TSLEEPf
     #1 SLEEP_out = SLEEP_in;
   end

   always @(posedge WAKE_in)
   begin:TWAKEr
     #tRDP WAKE_out = WAKE_in;
   end
   always @(negedge WAKE_in)
   begin:TWAKEf
     #1 WAKE_out = WAKE_in;
   end

   always @(next_state or PoweredUp)
   begin: StateTransition
       if (PoweredUp)
       begin
           current_state = next_state;
       end
   end

   always @(negedge CS_B_ipd)
   begin:CheckCSOnPowerUP
       if (~PoweredUp)
           $display ("Device is selected during Power Up");
   end

 integer data_cnt   = 0;
 integer addr_cnt   = 0;
 integer code_cnt   = 0;
 integer mode_cnt   = 0;
 integer dummy_cnt  = 0;
 integer bit_cnt    = 0;

 reg[(8*AddrRANGE+7):0] Data_in = 0;
 integer quad_data_in [0:(2*AddrRANGE+1)];
 reg[3:0] quad_nybble = 4'b0;
 reg[3:0] Quad_slv = 4'b0;
 reg[7:0] code = 8'b0;
 reg[7:0] code_in = 8'b0;
 reg[7:0] Byte_slv = 8'b0;
 reg[HiAddrBit:0] addr_bytes;
 reg[23:0] Address_in = 8'b0;
 reg[7:0] mode_bytes;
 reg[7:0] mode_in;

 reg rising_edge_CS_B_ipd  = 1'b0;
 reg falling_edge_CS_B_ipd = 1'b0;
 reg rising_edge_SCK_ipd    = 1'b0;
 reg falling_edge_SCK_ipd   = 1'b0;

    always @(falling_edge_CS_B_ipd or rising_edge_CS_B_ipd
    or rising_edge_SCK_ipd or falling_edge_SCK_ipd)
    begin: Buscycle1
        integer i;
        integer j;
        integer k;
        if (falling_edge_CS_B_ipd)
        begin
            if (bus_cycle_state==STAND_BY)
            begin
                bus_cycle_state = CODE_BYTE;
                Instruct = NONE;
                write = 1'b1;
                code_cnt = 0;
                addr_cnt = 0;
                data_cnt = 0;
                mode_cnt = 0;
                dummy_cnt = 0;
            end
        end

        if (rising_edge_SCK_ipd)
        begin
            if (~CS_B_ipd)
            begin
                case (bus_cycle_state)
                    CODE_BYTE :
                    begin
                        if ((HOLD_B_in && ~QUAD) || QUAD)
                        begin
                            code_in[code_cnt] = SI_in;
                            code_cnt = code_cnt + 1;
                            if (code_cnt == BYTE)
                            begin
                                for (i=0;i<=7;i=i+1)
                                begin
                                    code[i] = code_in[7-i];
                                end
                                case(code)
                                    8'b00000110 :
                                    begin
                                        Instruct = WREN;
                                        bus_cycle_state = DATA_BYTES;
                                    end
                                    8'b00000100 :
                                    begin
                                        Instruct = WRDI;
                                        bus_cycle_state = DATA_BYTES;
                                    end
                                    8'b00000001 :
                                    begin
                                        Instruct = WRSR;
                                        bus_cycle_state = DATA_BYTES;
                                    end
                                    8'b00000101 :
                                    begin
                                        Instruct = RDSR;
                                        bus_cycle_state = DATA_BYTES;
                                    end
                                    8'b00000011 :
                                    begin
                                        Instruct = READ;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b00001011 :
                                    begin
                                        Instruct = FREAD;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b01001011 :
                                    begin
                                        Instruct = RDID;
                                        bus_cycle_state = MODE_BYTE;
                                    end
                                    8'b10101011 :
                                    begin
                                        Instruct = WAKE;
                                        bus_cycle_state = DUMMY_BYTES;
                                    end
                                    8'b00000010 :
                                    begin
                                        Instruct = WRITE;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b00110010 :
                                    begin
                                        Instruct = FWQD;   QUAD = 1;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b00010010 :                       
                                    begin                               
                                        Instruct = FWQAD; QUAD = 1; 
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end                                 
                                    8'b10111001 :
                                    begin
                                        Instruct = SLEEP;
                                        bus_cycle_state = DATA_BYTES;
                                    end
                                    8'b00111011 :
                                    begin
                                        Instruct = DUAL_READ;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b01101011 :
                                    begin
                                        Instruct = FRQO;   QUAD = 1;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b10111011 :
                                    begin
                                        Instruct = DH_READ;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                    8'b11101011 :
                                    begin
                                        Instruct = FRQAD;   QUAD = 1;
                                        bus_cycle_state = ADDRESS_BYTES;
                                    end
                                endcase
                            end
                        end
                    end

                    ADDRESS_BYTES :
                    begin
                        if (((Instruct == FREAD ||                          
                            Instruct == DUAL_READ) &&
                            ((HOLD_B_in && ~QUAD) || QUAD)) ||
                            ((Instruct == FRQO) && QUAD))
                        begin
                            Address_in[addr_cnt] = SI_in;
                            addr_cnt = addr_cnt + 1;
                            if (addr_cnt == 3*BYTE)
                            begin
                                for (i=23;i>=23-HiAddrBit;i=i-1)
                                begin
                                    addr_bytes[23-i] = Address_in[i];
                                end
                                Address = addr_bytes;
                                change_addr = 1'b1;
                                #1 change_addr = 1'b0;
                                if (Instruct == FRQO || Instruct == FREAD)   
				bus_cycle_state = MODE_BYTE; 
                                else                         
                                bus_cycle_state = DUMMY_BYTES;
                            end
                        end
                        else if (Instruct == DH_READ &&
                                ((HOLD_B_in && ~QUAD) || QUAD))
                        begin
                            if (SOIn !== 1'b0 && SOIn !== 1'b1)
                            begin
                                mpm_mode = 0;
                                bus_cycle_state = STAND_BY;
                            end
                            else
                            begin
                                Address_in[2*addr_cnt]   = SOIn;
                                Address_in[2*addr_cnt+1] = SI_in;
                                read_cnt = 0;
                                addr_cnt = addr_cnt + 1;
                                if (addr_cnt == 12)
                                begin
                                    addr_cnt = 0;
                                    for (i=23;i>=23-HiAddrBit;i=i-1)
                                    begin
                                        addr_bytes[23-i] = Address_in[i];
                                    end
                                    Address = addr_bytes;
                                    change_addr = 1'b1;
                                    #1 change_addr = 1'b0;
                                    bus_cycle_state = MODE_BYTE;
                                end
                            end
                        end
                        else if ((Instruct == FRQAD) || (Instruct == FWQAD))
                        begin
                            if(QUAD)
                            begin
                                if (SOIn !== 1'b0 && SOIn !== 1'b1)
                                begin
                                    mpm_mode = 0;
                                    bus_cycle_state = STAND_BY;
                                end
                                else
                                begin
                                    Address_in[4*addr_cnt]   = HOLD_B_in;
                                    Address_in[4*addr_cnt+1] = WP_B_in;
                                    Address_in[4*addr_cnt+2] = SOIn;
                                    Address_in[4*addr_cnt+3] = SI_in;
                                    read_cnt = 0;
                                    addr_cnt = addr_cnt + 1;
                                    if (addr_cnt == 6)
                                    begin
                                        addr_cnt = 0;
                                        for (i=23;i>=23-HiAddrBit;i=i-1)
                                        begin
                                            addr_bytes[23-i] = Address_in[i];
                                        end
                                        Address = addr_bytes;
                                        change_addr = 1'b1;
                                        #1 change_addr = 1'b0;
                                        if (Instruct == FRQAD)     
					bus_cycle_state = MODE_BYTE;
                                        else if (Instruct == FWQAD)  
					bus_cycle_state = DATA_BYTES;
                                    end
                                end
                            end
                            else
                            begin
                                bus_cycle_state = STAND_BY;
                            end
                        end
                        else if ((HOLD_B_in && ~QUAD) || QUAD)
                        begin
                            Address_in[addr_cnt] = SI_in;
                            addr_cnt = addr_cnt + 1;
                            if (addr_cnt == 3*BYTE)
                            begin
                                for (i=23;i>=23-HiAddrBit;i=i-1)
                                begin
                                    addr_bytes[23-i] = Address_in[i];
                                end
                                Address = addr_bytes;
                                change_addr = 1'b1;
                                #1 change_addr = 1'b0;
                                bus_cycle_state = DATA_BYTES;
                            end
                        end
                    end

                    MODE_BYTE :
                    begin
                        if((Instruct == DH_READ) &&
                          ((HOLD_B_in && ~QUAD) || QUAD))
                        begin
                            mode_in[2*mode_cnt]   = SOIn;
                            mode_in[2*mode_cnt+1] = SI_in;
                            mode_cnt = mode_cnt + 1;
                            if (mode_cnt == BYTE/2)
                            begin
                                mode_cnt = 0;
                                for (i=7;i>=7-BYTE;i=i-1)
                                begin
                                    mode_bytes[i] = mode_in[7-i];
                                end
                                bus_cycle_state = DATA_BYTES;
                            end
                        end
                        else if((Instruct == FREAD || Instruct == RDID) &&
                          ((HOLD_B_in && ~QUAD) || QUAD))       
                        begin                                    
                            mode_in[mode_cnt] = SI_in;           
                            mode_cnt = mode_cnt + 1;             
                            if (mode_cnt == BYTE)                
                            begin                                
                                mode_cnt = 0;                    
                                for (i=7;i>=7-BYTE;i=i-1)        
                                begin                            
                                    mode_bytes[i] = mode_in[7-i];
                                end                              
                                bus_cycle_state = DATA_BYTES;    
                            end                                  
                        end                                      
                        else if((Instruct == FRQAD || Instruct == FRQO) && QUAD)
                        begin
                            mode_in[4*mode_cnt]   = HOLD_B_in;
                            mode_in[4*mode_cnt+1] = WP_B_in;
                            mode_in[4*mode_cnt+2] = SOIn;
                            mode_in[4*mode_cnt+3] = SI_in;
                            mode_cnt = mode_cnt + 1;
                            if (mode_cnt == BYTE/4)
                            begin
                                mode_cnt = 0;
                                for (i=7;i>=7-BYTE;i=i-1)
                                begin
                                    mode_bytes[i] = mode_in[7-i];
                                end
                                bus_cycle_state = DATA_BYTES;
                            end
                        end
                        dummy_cnt = 0;
                    end

                    DUMMY_BYTES :
                    begin
                        if(QUAD && (Instruct == FRQO ||
                           Instruct == FRQAD))
                        begin
                            dummy_cnt = dummy_cnt + 1;
                            if ((dummy_cnt == BYTE) && Instruct == FRQO)
                                bus_cycle_state = DATA_BYTES;
                            else if ((dummy_cnt == BYTE/2) &&
                                      Instruct == FRQAD)
                                bus_cycle_state = DATA_BYTES;
                        end
                        else if((HOLD_B_in && ~QUAD) || QUAD)
                        begin
                            dummy_cnt = dummy_cnt + 1;
                            if (dummy_cnt == BYTE && (Instruct == FREAD ||
                                Instruct == DUAL_READ))                     
                                bus_cycle_state = DATA_BYTES;
                            else if (dummy_cnt == 3*BYTE)
                                bus_cycle_state = DATA_BYTES;
                        end
                    end

                    DATA_BYTES :
                    begin
                        if(QUAD && ((Instruct == FWQD)||(Instruct == FWQAD)))
                        begin
                            quad_nybble = {HOLD_B_in, WP_B_in, SOIn, SI_in};
                                quad_data_in[data_cnt%(2*(AddrRANGE+1))] = quad_nybble;
                                data_cnt = data_cnt + 1;
                        end
                        else if ((HOLD_B_in && ~QUAD) || QUAD)
                        begin
                                Data_in[data_cnt%(8*(AddrRANGE+1))] = SI_in;
                                data_cnt = data_cnt + 1;
                        end
                    end
                endcase
            end
        end
        if (falling_edge_SCK_ipd)
        begin
            if ((bus_cycle_state == DATA_BYTES) && (~CS_B_ipd))
            begin
                if (((Instruct == READ || Instruct == FREAD ||
                    Instruct == DUAL_READ || Instruct == DH_READ ||
                    Instruct == WAKE || Instruct == RDID ||
                    Instruct == RDSR                                  
                      ) &&                                            
                    ((HOLD_B_in && ~QUAD) || QUAD)) ||
                    ((Instruct == FRQO || Instruct == FRQAD) && QUAD))
                begin
                    read_out = 1'b1;
                    #1 read_out = 1'b0;
                end
            end
        end
        if (rising_edge_CS_B_ipd)
        begin
            QUAD = 0; 
	    if ((bus_cycle_state != DATA_BYTES) &&
                (bus_cycle_state != DUMMY_BYTES))
            begin
                bus_cycle_state = STAND_BY;
            end
            else
            begin
            if (bus_cycle_state == DATA_BYTES)
            begin
                if (mpm_mode && (mode_bytes[7:4] == 4'b1010) &&
                    (Instruct == DH_READ || Instruct == FRQAD))
                begin
                    bus_cycle_state = ADDRESS_BYTES;
                end
                else
                begin
                    mpm_mode = 0;
                    bus_cycle_state = STAND_BY;
                end
                if ((Instruct == FWQD) || (Instruct == FWQAD))
                begin
                    if (data_cnt > 0)
                    begin
                        if ((data_cnt % 2) == 0)
                        begin
                            write = 0;
                            for(i=0;i<=AddrRANGE;i=i+1)
                            begin
                                for(j=1;j>=0;j=j-1)
                                begin
                                    Quad_slv = quad_data_in[(i*2)+(1-j)];
                                    for(k=3;k>=0;k=k-1)
                                    begin
                                        Byte_slv[4*j+k] = Quad_slv[k];
                                    end
                                end
                                WByte[i] = Byte_slv;
                            end
                            if (data_cnt > 2*(AddrRANGE+1))
                                Byte_number = AddrRANGE;
                            else
                                Byte_number = data_cnt/2 -1;
                        end
                        else                                                                                     
			begin                                                                                    
			    $display("\n====================================================================\n");
			    $display("\n====ERROR: Simulation Terminated due to incomplete write data bytes \n");
			    $display("\n====================================================================\n");
			    $finish;                                                                             
			end                                                                                      
                    end
                end
                if ((HOLD_B_in && ~QUAD) || QUAD)
                begin
                    case (Instruct)
                        WRDI,
                        WREN,
                        SLEEP:
                        begin
                            if (data_cnt == 0)
                                write = 1'b0;
                        end

                        WAKE:
                        begin
                            write = 1'b0;
                        end

                        WRSR :
                        begin
                            if((HOLD_B_in && ~QUAD) || QUAD)
                            begin
                                if (data_cnt == 8)
                                begin
                                    write = 0;
                                    for(i=0;i<=7;i=i+1)
                                    begin
                                        Status_reg_in[i]=
                                        Data_in[7-i];
                                    end
                                end
                            end
                        end

                        WRITE :
                        begin
                            if (data_cnt > 0)
                            begin
                                if ((data_cnt % 8) == 0)
                                begin
                                    write = 1'b0;
                                    for (i=0;i<=AddrRANGE;i=i+1)
                                    begin
                                        for (j=7;j>=0;j=j-1)
                                        begin
                                            Byte_slv[j] =
                                            Data_in[(i*8) + (7-j)];
                                        end
                                        WByte[i] = Byte_slv;
                                    end
                                    if (data_cnt > (AddrRANGE+1)*BYTE)
                                        Byte_number = AddrRANGE;      
                                    else
                                        Byte_number = ((data_cnt/8) - 1);
                                end
                                else                                                                                     
			        begin                                                                                    
			            $display("\n====================================================================\n");
			            $display("\n====ERROR: Simulation Terminated due to incomplete write data bytes \n");
			            $display("\n====================================================================\n");
			            $finish;                                                                             
			        end                                                                                      
                            end
                        end

                    endcase
                end
            end
            else
                if (bus_cycle_state == DUMMY_BYTES)
                begin
                    bus_cycle_state = STAND_BY;
                    if (((HOLD_B_in && ~QUAD) || QUAD) &&
                       (Instruct == WAKE) && (dummy_cnt == 0))
                        write = 1'b0;
                end
            end
        end
    end


 event pdone_event;

    always @(PSTART)
    begin
        if (PSTART && PDONE)
            if (Sec_Prot[SA] == 1'b0)
            begin
                PDONE = 1'b0;
                ->pdone_event;
            end
    end

    always @(pdone_event)
    begin:pdone_process
        PDONE = 1'b0;
        #tWRITE PDONE = 1'b1;
    end


 event wdone_event;

    always @(WSTART)
    begin
        if (WSTART && WDONE)
        begin
            WDONE = 1'b0;
            ->wdone_event;
        end
    end

    always @(wdone_event)
    begin:wdone_process
        WDONE = 1'b0;
        #tWR WDONE = 1'b1;
    end


    reg rising_edge_PDONE = 1'b0;
    reg rising_edge_WDONE = 1'b0;
    reg rising_edge_SLEEP_out = 1'b0;
    reg falling_edge_write = 1'b0;
    integer i;
    integer j;

    always @(falling_edge_write or rising_edge_PDONE or rising_edge_WDONE
    or rising_edge_SLEEP_out)                                           
    begin: StateGen1
        if (falling_edge_write)
        begin
            case (current_state)
                IDLE :
                begin
                    if (~write)
                    begin
                        if ((Instruct == WRSR) && WEL)
                        begin
                            if (~(Status_reg[7] && ~WP_B_in && ~QUAD))
                                next_state = WRITE_SR;
                        end

                        else if ((Instruct == WRITE || Instruct == FWQD || Instruct == FWQAD) &&   
                                  WEL)
                        begin
                            sect = Address / 16'h8000;
                            if (Sec_Prot[sect] == 1'b0)
                                next_state = WRITE_STATE;
                        end

                        else if (Instruct == SLEEP)
                            next_state = SLEEP_WAIT;
                        else
                            next_state = IDLE;
                    end
                end

                SLEEP_STATE :
                begin
                    if (~write)
                    begin
                        if (Instruct == WAKE)
                            next_state = IDLE;
                    end
                end

            endcase
        end

        if (rising_edge_PDONE)
        begin
            if (current_state==WRITE_STATE)                           
            begin
                next_state = IDLE;
            end
        end

        if (rising_edge_WDONE)
        begin
            if (current_state==WRITE_SR)
            begin
                next_state = IDLE;
            end
        end


        if (rising_edge_SLEEP_out)
        begin
            if (current_state==SLEEP_WAIT)
                next_state = SLEEP_STATE;
        end

    end

    reg rising_edge_read_out = 1'b0;
    reg rising_edge_WAKE_out  = 1'b0;
    reg Instruct_event       = 1'b0;
    reg change_addr_event    = 1'b0;
    reg rising_edge_powered  = 1'b0;
    reg current_state_event  = 1'b0;

    integer sector;
    integer WData [0:AddrRANGE];
    integer Addr;
    integer Addr_tmp;

    always @(oe_event)
    begin
        oe = 1'b1;
        #1 oe = 1'b0;
    end

    always @(rising_edge_read_out or Instruct_event or
             change_addr_event or oe or current_state_event or
             falling_edge_write or WDONE or PDONE or                   
             CS_B_ipd or rising_edge_WAKE_out or rising_edge_powered or
             rising_edge_SLEEP_out)
    begin: Functionality
    integer i,j;

        if (rising_edge_read_out)
        begin
            if (PoweredUp == 1'b1)
                ->oe_event;
        end

        if (Instruct_event)
        begin
            read_cnt = 0;
            rd_fast  = 1'b1;
            rd_slow  = 1'b0;
            rd_jedec = 1'b0;
            dual     = 1'b0;
            if (current_state == SLEEP_WAIT)
            begin
                if (SLEEP_in == 1'b1)
                begin
                    $display ("Command results can be corrupted");
                end
            end
            if (Instruct == DH_READ || Instruct == FRQAD)
            begin
                mpm_mode = 1;
            end
        end



        if (change_addr_event)
        begin
            read_addr = Address;
        end

        if (oe || current_state_event)
        begin
            case (current_state)
                IDLE :
                begin
                    if (oe && ~WAKE_in)
                    begin
                        if (Instruct == RDSR)
                        begin
                            SOut_zd = Status_reg[7-read_cnt];
                            read_cnt = read_cnt + 1;
                            if (read_cnt == 8)
                                read_cnt = 0;
                        end
                        else if (Instruct == READ || Instruct == FREAD)
                        begin
                            if (Instruct == READ)
                            begin
                                rd_fast  = 1'b0;
                                rd_jedec = 1'b0;
                                rd_slow  = 1'b1;
                            end
                            data_out[7:0] = Mem[read_addr];
                            SOut_zd  = data_out[7-read_cnt];
                            read_cnt = read_cnt + 1;
                            if (read_cnt == 8)
                            begin
                                read_cnt = 0;
                                if (read_addr == AddrRANGE)
                                    read_addr = 0;
                                else
                                    read_addr = read_addr + 1;
                            end
                        end
                        else if (Instruct == DUAL_READ || Instruct == DH_READ)
                        begin
                            rd_fast  = 1'b0;
                            rd_slow  = 1'b0;
                            rd_jedec = 1'b0;
                            dual     = 1'b1;
                            data_out[7:0] = Mem[read_addr];
                            SOut_zd       = data_out[7-2*read_cnt];
                            SIOut_zd      = data_out[6-2*read_cnt];
                            read_cnt = read_cnt + 1;
                            if (read_cnt == 4)
                            begin
                                read_cnt = 0;
                                if (read_addr == AddrRANGE)
                                    read_addr = 0;
                                else
                                    read_addr = read_addr + 1;
                            end
                        end
                        else if (Instruct == FRQO || Instruct == FRQAD)
                        begin
                            rd_fast  = 1'b0;
                            rd_slow  = 1'b0;
                            rd_jedec = 1'b0;
                            dual     = 1'b1;
                            data_out[7:0] = Mem[read_addr];
                            HOLD_BOut_zd  = data_out[7-4*read_cnt];
                            WP_BOut_zd     = data_out[6-4*read_cnt];
                            SOut_zd        = data_out[5-4*read_cnt];
                            SIOut_zd       = data_out[4-4*read_cnt];
                            read_cnt = read_cnt + 1;
                            if (read_cnt == 2)
                            begin
                                read_cnt = 0;
                                if (read_addr == AddrRANGE)
                                    read_addr = 0;
                                else
                                    read_addr = read_addr + 1;
                            end
                        end
                        else if (Instruct == RDID)
                        begin
                            rd_fast  = 1'b0;
                            rd_slow  = 1'b0;
                            rd_jedec = 1'b1;
                            dual     = 1'b0;
                            ident_out = {Manuf_ID,DeviceID};
                            SOut_zd = ident_out[39-read_cnt];
                            read_cnt  = read_cnt + 1;
                            if (read_cnt > 40)
                                SOut_zd = 0;
                        end
                    end
                    else if (oe && WAKE_in)
                    begin
                        $display ("Command results can be corrupted");
                        SOut_zd = 1'bX;
                        read_cnt = read_cnt + 1;
                        if (read_cnt == 8)
                            read_cnt = 0;
                    end
                end

                WRITE_SR,
                WRITE_STATE :
                begin
                    if (oe && Instruct == RDSR)
                    begin
                        SOut_zd = Status_reg[7-read_cnt];
                        read_cnt = read_cnt + 1;
                        if (read_cnt == 8)
                            read_cnt = 0;
                    end
                end
                SLEEP_STATE :
                begin
                    if (oe && Instruct == WAKE)
                    begin
                        data_out[7:0] = ES;
                        SOut_zd = data_out[7-read_cnt];
                        read_cnt = read_cnt + 1;
                        if (read_cnt == 8)
                            read_cnt = 0;
                    end
                end

            endcase
        end

        if (falling_edge_write)
        begin
            case (current_state)
                IDLE :
                begin
                    if (~write)
                    begin
                        if (WAKE_in == 1'b1 && Instruct != SLEEP)
                        begin
                            $display ("Command results can be corrupted");
                        end
                        if (Instruct == WREN)
                            Status_reg[1] = 1'b1;
                        else if (Instruct == WRDI)
                            Status_reg[1] = 1'b0;
                        else if (Instruct == WRSR && WEL)
                        begin
                            if (~(Status_reg[7] && ~WP_B_in && ~QUAD))
                            begin
                                WSTART = 1'b1;
                                WSTART <= #1 1'b0;
                                WIP = 1'b1;
                            end
                            else
                            begin
                            end
                        end
                        else if ((Instruct == WRITE || Instruct == FWQD || Instruct == FWQAD) &&   
                                  WEL)
                        begin
                            sect = Address / 16'h8000;
                            if (Sec_Prot[sect] == 1'b0)
                            begin
                                PSTART = 1'b1;
                                PSTART <= #1 1'b0;
                                WIP = 1'b1; 
                                Addr = Address;
                                Addr_tmp = Address;
                                SA = sect;
                                wr_cnt = Byte_number;
                                for (i=0;i<=wr_cnt;i=i+1)
                                begin
                                    if (Viol != 1'b0)
                                        WData[i] = -1;
                                    else
                                        WData[i] = WByte[i];
                                end
                            end
                            else
                            begin
                            end
                        end
                        else if (Instruct == SLEEP)
                        begin
                            WAKE_in <= 1'b0;
                            SLEEP_in = 1'b1;
                        end
                        else if (Instruct == WAKE)
                        begin
                            WAKE_in <= 1'b1;
                        end
                    end

                end

                SLEEP_STATE :
                begin
                    if (~write)
                    begin
                        if (Instruct == WAKE)
                            WAKE_in = 1'b1;
                    end
                end

            endcase
        end


        if(current_state_event || WDONE)
        begin
            if (current_state == WRITE_SR)
            begin
                if (WDONE)
                begin
                    WIP = 1'b0;
                    Status_reg[7] = Status_reg_in[7];

                        Status_reg[3] = Status_reg_in[3];
                        Status_reg[2] = Status_reg_in[2];


                        change_BP = 1'b1;
                        #1 change_BP = 1'b0;

                end
            end
        end

        if(current_state_event || PDONE)
        begin
            if (current_state == WRITE_STATE)
            begin
                cnt = 0;

                for (i=0;i<=wr_cnt;i=i+1)
                begin
                    new_int = WData[i];
                    old_int = Mem[Addr + i - cnt];
                    if (new_int > -1)
                    begin
                        new_bit = new_int;
                        if (old_int > -1)
                        begin
                            old_bit = old_int;
                            for(j=0;j<=7;j=j+1)
                                if (~old_bit[j])
                            new_int=new_bit;
                        end

                        WData[i]= new_int;
                    end
                    else
                    begin
                        WData[i] = -1;
                    end

                    Mem[Addr + i -cnt] = - 1;

                    if ((Addr + i) == AddrHi)
                    begin
                        Addr = AddrLo;
                        cnt = i + 1;
                    end
                end

                cnt = 0;

                if (PDONE)
                begin
                    WIP = 1'b0;
                    for (i=0;i<=wr_cnt;i=i+1)
                    begin
                        if (Sec_Prot[(Addr_tmp + i - cnt)/16'h8000] == 1'b0) Mem[Addr_tmp + i - cnt] = WData[i];
                        if ((Addr_tmp + i) == AddrHi)
                        begin
                            Addr_tmp = AddrLo;
                            cnt = i + 1;
                        end
                    end
                end
            end
        end


        if (CS_B_ipd )
        begin
            SIOut_zd      = 1'bZ;
            HOLD_BOut_zd = 1'bZ;
            WP_BOut_zd   = 1'bZ;
            SOut_zd = 1'bZ;
        end

        if (rising_edge_WAKE_out)
        begin
            if(WAKE_out)
            begin
                WAKE_in = 1'b0;
            end
        end

        if (rising_edge_SLEEP_out)
        begin
            if (current_state == SLEEP_WAIT)
            begin
                SLEEP_in = 1'b0;
            end
        end

    end

    always @(change_BP)
    begin
        if (change_BP)
        begin
            case (Status_reg[3:2])
                2'b00 :
                begin
                    Sec_Prot = 4'h0;
                end

                2'b01 :
                begin
                        Sec_Prot[SecNum : (SecNum+1)*3/4] = 1'b1;
                        Sec_Prot[(SecNum+1)*3/4 - 1 : 0] = 3'h0;
                end

                2'b10 :
                begin
                        Sec_Prot[SecNum : (SecNum+1)/2] = 2'b11;
                        Sec_Prot[(SecNum+1)/2 - 1 : 0] = 2'h0;
                end


                2'b11 :
                begin
                        Sec_Prot = 4'hF;
                end

            endcase
        end
    end

    assign fast_rd = rd_fast;
    assign rd = rd_slow;
    assign rd_jid = rd_jedec;

    always @(SOut_zd or HOLD_B_in or SIOut_zd)
    begin
        if (~HOLD_B_in && ~QUAD)
        begin
            hold_mode = 1'b1;
            SIOut_z   = 1'bZ;
            SOut_z    = 1'bZ;
        end
        else
        begin
            if (hold_mode)
            begin
                SIOut_z <= #(tHZ) SIOut_zd;
                SOut_z  <= #(tHZ) SOut_zd;
                hold_mode = 1'b0;
            end
            else
            begin
                SIOut_z = SIOut_zd;
                SOut_z  = SOut_zd;
                hold_mode = 1'b0;
            end
        end
    end





    always @(negedge CS_B_ipd)
    begin
        falling_edge_CS_B_ipd = 1'b1;
        #1 falling_edge_CS_B_ipd = 1'b0;
    end

    always @(posedge SCK_ipd)
    begin
        rising_edge_SCK_ipd = 1'b1;
        #1 rising_edge_SCK_ipd = 1'b0;
    end

    always @(negedge SCK_ipd)
    begin
        falling_edge_SCK_ipd = 1'b1;
        #1 falling_edge_SCK_ipd = 1'b0;
    end

    always @(posedge CS_B_ipd)
    begin
        rising_edge_CS_B_ipd = 1'b1;
        #1 rising_edge_CS_B_ipd = 1'b0;
    end

    always @(negedge write)
    begin
        falling_edge_write = 1'b1;
        #1 falling_edge_write = 1'b0;
    end

    always @(posedge PDONE)
    begin
        rising_edge_PDONE = 1'b1;
        #1 rising_edge_PDONE = 1'b0;
    end

    always @(posedge WDONE)
    begin
        rising_edge_WDONE = 1'b1;
        #1 rising_edge_WDONE = 1'b0;
    end


    always @(posedge SLEEP_out)
    begin
        rising_edge_SLEEP_out = 1'b1;
        #1 rising_edge_SLEEP_out = 1'b0;
    end

    always @(posedge WAKE_out)
    begin
        rising_edge_WAKE_out = 1'b1;
        #1 rising_edge_WAKE_out = 1'b0;
    end

    always @(posedge read_out)
    begin
        rising_edge_read_out = 1'b1;
        #1 rising_edge_read_out = 1'b0;
    end

    always @(posedge PoweredUp)
    begin
        rising_edge_powered = 1'b1;
        #1 rising_edge_powered = 1'b0;
    end

    always @(Instruct)
    begin
        Instruct_event = 1'b1;
        #1 Instruct_event = 1'b0;
    end

    always @(change_addr)
    begin
        change_addr_event = 1'b1;
        #1 change_addr_event = 1'b0;
    end

    always @(current_state)
    begin
        current_state_event = 1'b1;
        #1 current_state_event = 1'b0;
    end

endmodule
