`include "ulpsoc_defines.sv"

module clock_rst_gen
(
    input  logic        ref_clk_i,
    input  logic        test_clk_i,
    input  logic        rstn_i,

    input  logic        test_mode_i,
    input  logic        shift_enable_i,
    input  logic        fll_si_i,
    output logic        fll_so_o,

    output logic        clk_out_o,

    output logic        ref_clk_o,
    output logic        ref_rstn_sync_o,

    // CLOCK TO SOC BBGEN
    output logic        clk_soc_bbgen100M_o, //--> 3
    output logic        rstn_soc_bbgen100M_o,

    // CLOCK TO CLUSTER BBGEN
    output logic        clk_cluster_bbgen100M_o,  //--> 2
    output logic        rstn_cluster_bbgen100M_o,


    //clock bypass signals coming from JTAG. Consider them static!!!
    input  logic        jtag_fll_bypass_soc_i,
    input  logic        jtag_fll_bypass_cluster_i,
    input  logic        jtag_use_one_fll_i,
    input  logic        jtag_use_fll_soc_i,         //clock soc with fll clock. When 0 uses either xor or test_clk
    input  logic        jtag_use_fll_cluster_i,     //clock cluster with fll clock. When 0 uses either xor or test_clk
    input  logic        jtag_enable_clk_xor_i,      

    input  logic        pm_enable_soc_clk_i,       //Signal coming from Power Manager enabling soc clock
    input  logic        pm_enable_cluster_clk_i,   //Signal coming from Power Manager enabling cluster clock

    output logic        fll_lock_soc_o,            //not used with FDSOI fll
    output logic        fll_lock_cluster_o,        //not used with FDSOI fll

    input  logic        jtag_enable_clk_out_i,
    input  logic  [1:0] jtag_clk_out_sel_i,

    input  logic        jtag_soc_rst_inhibit_i,    //signal to prevent soc to be rst
    input  logic        jtag_cluster_rst_inhibit_i,//signal to prevent cluster to be rst

    input  logic        pm_cluster_sw_rstn_i,      //set by power manager to rst cluster when recovering from power down
    input  logic        pm_soc_sw_rstn_i,      //set by power manager to rst soc when at power up bbgen is not ready

    input  logic        clking_axi_aclk,
    input  logic        clking_axi_aresetn,
    input  logic [10:0] clking_axi_awaddr,
    input  logic        clking_axi_awvalid,
    output logic        clking_axi_awready,
    input  logic [31:0] clking_axi_wdata,
    input  logic  [3:0] clking_axi_wstrb,
    input  logic        clking_axi_wvalid,
    output logic        clking_axi_wready,
    output logic  [1:0] clking_axi_bresp,
    output logic        clking_axi_bvalid,
    input  logic        clking_axi_bready,
    input  logic [10:0] clking_axi_araddr,
    input  logic        clking_axi_arvalid,
    output logic        clking_axi_arready,
    output logic [31:0] clking_axi_rdata,
    output logic  [1:0] clking_axi_rresp,
    output logic        clking_axi_rvalid,
    input  logic        clking_axi_rready,


    input  logic  [7:0] clk_div0_data_i,
    input  logic        clk_div0_valid_i,
    output logic        clk_div0_ack_o,

    input  logic  [7:0] clk_div1_data_i,
    input  logic        clk_div1_valid_i,
    output logic        clk_div1_ack_o,

    input  logic  [7:0] clk_div2_data_i,        // CLK OUT 
    input  logic        clk_div2_valid_i,       // CLK OUT 
    output logic        clk_div2_ack_o,         // CLK OUT 

    input  logic  [7:0] clk_div3_data_i,        // SOC BBGEN
    input  logic        clk_div3_valid_i,       // SOC BBGEN
    output logic        clk_div3_ack_o,         // SOC BBGEN
    
    input  logic  [7:0] clk_div4_data_i,        // CLUSTER BBGEN
    input  logic        clk_div4_valid_i,       // CLUSTER BBGEN
    output logic        clk_div4_ack_o,         // CLUSTER BBGEN



    input  logic        cvp_soc_pwr_req,
    input  logic        cvp_soc_pwr_wr_rd,
    input  logic [28:0] cvp_soc_pwr_add,
    input  logic  [7:0] cvp_soc_pwr_be,
    input  logic [63:0] cvp_soc_pwr_w_data,
    output logic        cvp_soc_pwr_ack,
    output logic        cvp_soc_pwr_error,
    output logic [63:0] cvp_soc_pwr_r_data,

    input  logic        cvp_cluster_pwr_req,
    input  logic        cvp_cluster_pwr_wr_rd,
    input  logic [28:0] cvp_cluster_pwr_add,
    input  logic  [7:0] cvp_cluster_pwr_be,
    input  logic [63:0] cvp_cluster_pwr_w_data,
    output logic        cvp_cluster_pwr_ack,
    output logic        cvp_cluster_pwr_error,
    output logic [63:0] cvp_cluster_pwr_r_data,

    output logic        rstn_sync_o,
    output logic        initn_sync_o,
    output logic        rstn_sync_ref_o,
    output logic        rstn_cluster_o,
    output logic        rstn_cluster_sync_soc_o,
    output logic        clk_soc_o,
    output logic        clk_cluster_o
);

    logic               s_clk_fll_soc;
    logic               s_clk_fll_soc_int;
    logic               s_clk_soc_int;
    logic               s_clk_fll_cluster;
    logic               s_clk_cluster_int;
    logic               s_clk_soc;
    logic               s_clk_cluster;
    logic               s_clk_ref_bypass;

    logic               s_clk_mux_soc;
    logic               s_clk_mux_cluster;
    logic               s_clk_mux_xor;
    logic               s_clk_xor;
    logic               s_clk_ext;

    logic               s_rstn_ref_sync;
    logic               s_rstn_ref_sync_bypass;

    logic               s_rstn_soc;
    logic               s_rstn_cluster;

    logic               s_rstn_soc_sync;
    logic               s_initn_soc_sync;

    logic               s_rstn_cluster_sync_local;
    logic               s_rstn_soc_sync_local;

    logic               s_rstn_cluster_soc_sync;

    logic               s_clk_out_mux_0;
    logic               s_clk_out_mux_1;
    logic               s_clk_out_mux;

    logic               s_clk_soc_high;
    logic               s_clk_cluster_high;
    logic               s_clk_out_0;
    logic               s_clk_out_1;
    logic               s_clk_out_int;

    logic               mprob_0_rst_n      ;
    logic               mprob_0_mode       ;
    logic               mprob_0_sample     ;
    logic               mprob_0_test_freq  ;
    
    logic               mprob_0_serdes_clk ;
    logic               mprob_0_1_serdes   ;
    logic               mprob_0_serdes_out ;
    logic               mprob_1_serdes_in  ;

    logic               clk_div0_ack_int;
    logic  [7:0]        clk_div0_data_int;
    logic               clk_div0_valid_int;

    logic               clk_div1_ack_int;
    logic  [7:0]        clk_div1_data_int;
    logic               clk_div1_valid_int;

    logic               clk_div2_ack_int;
    logic  [7:0]        clk_div2_data_int;
    logic               clk_div2_valid_int;

    logic               clk_div3_ack_int;
    logic  [7:0]        clk_div3_data_int;
    logic               clk_div3_valid_int;

    logic               clk_div4_ack_int;
    logic  [7:0]        clk_div4_data_int;
    logic               clk_div4_valid_int;
  

    xilinx_clock_manager clk_manager_i
    (
        .s_axi_aclk    (clking_axi_aclk   ),
        .s_axi_aresetn (clking_axi_aresetn),
        .s_axi_awaddr  (clking_axi_awaddr ),
        .s_axi_awvalid (clking_axi_awvalid),
        .s_axi_awready (clking_axi_awready),
        .s_axi_wdata   (clking_axi_wdata  ),
        .s_axi_wstrb   (clking_axi_wstrb  ),
        .s_axi_wvalid  (clking_axi_wvalid ),
        .s_axi_wready  (clking_axi_wready ),
        .s_axi_bresp   (clking_axi_bresp  ),
        .s_axi_bvalid  (clking_axi_bvalid ),
        .s_axi_bready  (clking_axi_bready ),
        .s_axi_araddr  (clking_axi_araddr ),
        .s_axi_arvalid (clking_axi_arvalid),
        .s_axi_arready (clking_axi_arready),
        .s_axi_rdata   (clking_axi_rdata  ),
        .s_axi_rresp   (clking_axi_rresp  ),
        .s_axi_rvalid  (clking_axi_rvalid ),
        .s_axi_rready  (clking_axi_rready ),
        .clk50_i(ref_clk_i),
        .clk_o  (s_clk_soc_int),
        .rst_no ()
    );

    assign s_clk_cluster_int = s_clk_soc_int;

/*
    assign s_clk_mux_soc     = (test_mode_i) ? 1'b0 : jtag_use_fll_soc_i;
    assign s_clk_mux_cluster = (test_mode_i) ? 1'b0 : jtag_use_fll_cluster_i;
    assign s_clk_mux_xor     = (test_mode_i) ? 1'b0 : jtag_enable_clk_xor_i;


    // FIXME: ANTONIO CHECK
    assign fll_lock_soc_o     = 1'b1;



//synopsys translate_off

freq_meter #(     .FLL_NAME("SOC_FLL"),          .MAX_SAMPLE(4096)  )  SOC_METER (     .clk(s_clk_fll_soc) );
freq_meter #(     .FLL_NAME("CLUSTER_FLL"),      .MAX_SAMPLE(4096)  )  CLUSTER_METER ( .clk(s_clk_fll_cluster) );

//synopsys translate_on


    cvp_mprobe
    #(
        .ADDRESS_SIZE(12)
    )
    cvp_soc_i
    (
        .rst_async_n        ( rstn_i               ), //: IN STD_LOGIC;
        .clk_cvp            ( ref_clk_i            ), //: IN STD_LOGIC;
        .clk_ref            ( ref_clk_i            ), //: IN STD_LOGIC;
        .clk_fll_0          ( s_clk_fll_soc        ), //: OUT STD_LOGIC;

        .power_on           ( 1'b0                 ), // FIXME

        // CVP interface//
        .pwr_req            ( cvp_soc_pwr_req      ), //: IN  STD_LOGIC;
        .pwr_w_data         ( cvp_soc_pwr_w_data   ), //: IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
        .pwr_addr           ( cvp_soc_pwr_add      ), //: IN  STD_LOGIC_VECTOR(31 DOWNTO 3);
        .pwr_be             ( cvp_soc_pwr_be       ), //: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        .pwr_wr_rd          ( cvp_soc_pwr_wr_rd    ), //: IN  STD_LOGIC; -- '1' > read / '0' > write
        .pwr_ack            ( cvp_soc_pwr_ack      ), //: OUT STD_LOGIC;
        .pwr_r_data         ( cvp_soc_pwr_r_data   ), //: OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        .pwr_error          ( cvp_soc_pwr_error    ), //: OUT STD_LOGIC;


        //multiprobes interface
        .mprob_0_rst_n      ( mprob_0_rst_n        ), //: OUT STD_LOGIC;
        .mprob_0_mode       ( mprob_0_mode         ), //: OUT STD_LOGIC;
        .mprob_0_sample     ( mprob_0_sample       ), //: OUT STD_LOGIC;
        .mprob_0_serdes_clk ( mprob_0_serdes_clk   ), //: OUT STD_LOGIC;
        .mprob_0_serdes_out ( mprob_0_serdes_out   ), //: OUT STD_LOGIC;
        .mprob_0_serdes_in  ( mprob_1_serdes_in    ), //: IN  STD_LOGIC;
        .mprob_0_test_freq  ( mprob_0_test_freq    ), //: OUT STD_LOGIC;

        // DEBUG obervation interface
        .core_rst_n         (                      ), //: OUT STD_LOGIC;
        .core_power_on      (                      ), //: OUT STD_LOGIC;

        // TEST part  
        .test_mode          ( test_mode_i          ), //: IN  STD_LOGIC;
        .test_se            ( 1'b0                 ), //: IN  STD_LOGIC;
        .test_si            ( 1'b0                 ), //: IN  STD_LOGIC;
        .test_so            (                      )  //: OUT STD_LOGIC
    );


    C28SOI_LL_MULTIPROBE MULTIPROBE_0_i
    (
        .RST_N     ( mprob_0_rst_n      ), //: IN  STD_LOGIC;
        .MODE      ( mprob_0_mode       ), //: IN  STD_LOGIC;
        .SAMPLE    ( mprob_0_sample     ), //: IN  STD_LOGIC;
        .TEST_FREQ ( mprob_0_test_freq  ), //: IN  STD_LOGIC;
        
        // functional scan chain, do not use for test                 CVP
        .SCAN_CLK  ( mprob_0_serdes_clk ), //: IN  STD_LOGIC;          |
        .SCAN_IN   ( mprob_0_serdes_out ), //: IN  STD_LOGIC;------<---
        .SCAN_OUT  ( mprob_0_1_serdes   )  //: OUT STD_LOGIC ------>----          
    );                                     //                          |
                                           //                          v
    C28SOI_LL_MULTIPROBE MULTIPROBE_1_i    //                          |
    (                                      //                          |
        .RST_N     ( mprob_0_rst_n      ), //: IN  STD_LOGIC;          |
        .MODE      ( mprob_0_mode       ), //: IN  STD_LOGIC;          |
        .SAMPLE    ( mprob_0_sample     ), //: IN  STD_LOGIC;          |
        .TEST_FREQ ( mprob_0_test_freq  ), //: IN  STD_LOGIC;          |
                                           //                          v
        // functional scan chain, do not use for test                  |
        .SCAN_CLK  ( mprob_0_serdes_clk ), //: IN  STD_LOGIC;          |
        .SCAN_IN   ( mprob_0_1_serdes   ), //: IN  STD_LOGIC; ---<------
        .SCAN_OUT  ( mprob_1_serdes_in  )  //: OUT STD_LOGIC;----------->----- Back to CVP
    );
    


    // FIXME: ANTONIO CHECK
    assign fll_lock_cluster_o = 1'b1;
    assign fll_so_o           = 1'b0;

    cvp cvp_cluster_i
    (
        .rst_async_n(rstn_i),
        .clk_cvp(ref_clk_i),
        .clk_ref(ref_clk_i),
        .clk_fll_0(s_clk_fll_cluster),

        .power_on(1'b0),
        .pwr_req(cvp_cluster_pwr_req),
        .pwr_w_data(cvp_cluster_pwr_w_data),
        .pwr_addr(cvp_cluster_pwr_add),
        .pwr_be(cvp_cluster_pwr_be),
        .pwr_wr_rd(cvp_cluster_pwr_wr_rd),
        .pwr_ack(cvp_cluster_pwr_ack),
        .pwr_r_data(cvp_cluster_pwr_r_data),
        .pwr_error(cvp_cluster_pwr_error),

        .core_rst_n(),
        .core_power_on(),
        .test_mode(test_mode_i),
        .test_se(1'b0),
        .test_si(1'b0),
        .test_so()
    );

    pulp_clock_xor2 clk_xor_i
    (
        .clk0_i(ref_clk_i),
        .clk1_i(test_clk_i),
        .clk_o(s_clk_xor)
    );

    pulp_clock_mux2 clk_mux_xor_i
    (
        .clk_o(s_clk_ext),
        .clk0_i(test_clk_i),
        .clk1_i(s_clk_xor),
        .clk_sel_i(s_clk_mux_xor)
    );

    pulp_clock_mux2 clk_mux_one_fll_i
    (
        .clk_o(s_clk_fll_soc_int),
        .clk0_i(s_clk_fll_soc),
        .clk1_i(s_clk_fll_cluster),
        .clk_sel_i(jtag_use_one_fll_i)
    );

    //fll bypass mux when fll_bypass_soc_i=1 clk_o=ref_clk
    pulp_clock_mux2 clk_mux_fll_soc_i
    (
        .clk_o(s_clk_soc_high),
        .clk0_i(s_clk_fll_soc_int),
        .clk1_i(ref_clk_i),
        .clk_sel_i(jtag_fll_bypass_soc_i)
    );

    //fll bypass mux when fll_bypass_cluster_i=1 clk_o=ref_clk
    pulp_clock_mux2 clk_mux_fll_cluster_i
    (
        .clk_o(s_clk_cluster_high),
        .clk0_i(s_clk_fll_cluster),
        .clk1_i(ref_clk_i),
        .clk_sel_i(jtag_fll_bypass_cluster_i)
    );

    pulp_clock_mux2 clk_mux_soc_i
    (
        .clk_o(s_clk_soc_int),
        .clk0_i(s_clk_ext),
        .clk1_i(s_clk_soc_high),
        .clk_sel_i(s_clk_mux_soc)
    );

    pulp_clock_mux2 clk_mux_cluster_i
    (
        .clk_o(s_clk_cluster_int),
        .clk0_i(s_clk_ext),
        .clk1_i(s_clk_cluster_high),
        .clk_sel_i(s_clk_mux_cluster)
    );

    pulp_clock_mux2 clk_ref_bypass_i
    (
        .clk_o(s_clk_ref_bypass),
        .clk0_i(ref_clk_i),
        .clk1_i(test_clk_i),
        .clk_sel_i(test_mode_i)
    );
    
*/

    assign s_rstn_soc     = test_mode_i ? rstn_i : (rstn_i | jtag_soc_rst_inhibit_i    ) & pm_soc_sw_rstn_i;
    assign s_rstn_cluster = test_mode_i ? rstn_i : (rstn_i | jtag_cluster_rst_inhibit_i) & pm_cluster_sw_rstn_i;

    rstgen i_rst_gen_ref
    (
        // PAD FRAME SIGNALS
        .clk_i(ref_clk_i),
        .rst_ni(rstn_i),            //async signal coming from pads

        // TEST MODE
        .test_mode_i(1'b0),

        // OUTPUT RESET
        .rst_no(s_rstn_ref_sync),  //to be used by logic clocked with ref clock in AO domain
        .init_no()                 //not used
    );

    rstgen i_rst_gen_ref_bypass
    (
        // PAD FRAME SIGNALS
        .clk_i(ref_clk_i),
        .rst_ni(rstn_i),            //async signal coming from pads

        // TEST MODE
        .test_mode_i(test_mode_i),

        // OUTPUT RESET
        .rst_no(s_rstn_ref_sync_bypass),  //to be used by logic clocked with ref clock in AO domain
        .init_no()                 //not used
    );

    rstgen i_rst_gen_soc
    (
        // PAD FRAME SIGNALS
        .clk_i(s_clk_soc),
        .rst_ni(s_rstn_soc),

        // TEST MODE
        .test_mode_i(test_mode_i),

        // OUTPUT RESET
        .rst_no(s_rstn_soc_sync),
        .init_no(s_initn_soc_sync)
    );

    rstgen i_rst_gen_soc_bbgen100M
    (
        // PAD FRAME SIGNALS
        .clk_i(clk_soc_bbgen100M_o),
        .rst_ni(rstn_i),

        // TEST MODE
        .test_mode_i(1'b0), //bbgen will be active in test mode

        // OUTPUT RESET
        .rst_no(rstn_soc_bbgen100M_o),
        .init_no()
    );

    rstgen i_rst_gen_cluster_bbgen100M
    (
        // PAD FRAME SIGNALS
        .clk_i(clk_cluster_bbgen100M_o),
        .rst_ni(rstn_i),

        // TEST MODE
        .test_mode_i(1'b0), //bbgen will be active in test mode

        // OUTPUT RESET
        .rst_no(rstn_cluster_bbgen100M_o),
        .init_no()
    );


    //cluster rst is sync with the soc clock to proper reset the soc side of the dual clock fifos
    rstgen i_rst_gen_cluster_soc
    (
        // PAD FRAME SIGNALS
        .clk_i(s_clk_soc),
        .rst_ni(s_rstn_cluster),

        // TEST MODE
        .test_mode_i(test_mode_i),

        // OUTPUT RESET
        .rst_no(s_rstn_cluster_soc_sync),  //going to the dual clock fifos inside the soc
        .init_no() //not used
    );


/*
    clock_divider i_clkdiv_cluster
    (
        .clk_i(s_clk_cluster_int),
        .rstn_i(rstn_i),
        .test_mode_i(test_mode_i),
        .clk_gate_async_i(pm_enable_cluster_clk_i),
        .clk_div_ack_o(clk_div0_ack_int),
        .clk_div_data_i(clk_div0_data_int),
        .clk_div_valid_i(clk_div0_valid_int),
        .clk_o(s_clk_cluster)
    );
    clock_divider i_clkdiv_soc
    (
        .clk_i(s_clk_soc_int),
        .rstn_i(rstn_i),
        .test_mode_i(test_mode_i),
        .clk_gate_async_i(pm_enable_soc_clk_i),
        .clk_div_ack_o(clk_div1_ack_int),
        .clk_div_data_i(clk_div1_data_int),
        .clk_div_valid_i(clk_div1_valid_int),
        .clk_o(s_clk_soc)
    );

    clock_divider i_ckdiv_bbgen_cluster
    (
        .clk_i(s_clk_soc_int),
        .rstn_i(rstn_i),
        .test_mode_i(1'b0), //bbgen will be active in testmode
        .clk_gate_async_i(1'b1),
        .clk_div_ack_o(clk_div4_ack_int),
        .clk_div_data_i(clk_div4_data_int),
        .clk_div_valid_i(clk_div4_valid_int),
        .clk_o(clk_cluster_bbgen100M_o)
    );

    clock_divider i_ckdiv_bbgen_soc
    (
        .clk_i(s_clk_soc_int),
        .rstn_i(rstn_i),
        .test_mode_i(1'b0), //bbgen will be active in testmode
        .clk_gate_async_i(1'b1),
        .clk_div_ack_o(clk_div3_ack_int),
        .clk_div_data_i(clk_div3_data_int),
        .clk_div_valid_i(clk_div3_valid_int),
        .clk_o(clk_soc_bbgen100M_o)
    );

    assign clk_div0_ack_o     = test_mode_i ? 1'b0 : clk_div0_ack_int;
    assign clk_div0_data_int  = test_mode_i ?  'h0 : clk_div0_data_i;
    assign clk_div0_valid_int = test_mode_i ? 1'b0 : clk_div0_valid_i;

    assign clk_div1_ack_o     = test_mode_i ? 1'b0 : clk_div1_ack_int;
    assign clk_div1_data_int  = test_mode_i ?  'h0 : clk_div1_data_i;
    assign clk_div1_valid_int = test_mode_i ? 1'b0 : clk_div1_valid_i;

    assign clk_div2_ack_o     = test_mode_i ? 1'b0 : clk_div2_ack_int;
    assign clk_div2_data_int  = test_mode_i ?  'h0 : clk_div2_data_i;
    assign clk_div2_valid_int = test_mode_i ? 1'b0 : clk_div2_valid_i;

    assign clk_div3_ack_o     = test_mode_i ? 1'b0 : clk_div3_ack_int;
    assign clk_div3_data_int  = test_mode_i ?  'h0 : clk_div3_data_i;
    assign clk_div3_valid_int = test_mode_i ? 1'b0 : clk_div3_valid_i;

    assign clk_div4_ack_o     = test_mode_i ? 1'b0 : clk_div4_ack_int;
    assign clk_div4_data_int  = test_mode_i ?  'h0 : clk_div4_data_i;
    assign clk_div4_valid_int = test_mode_i ? 1'b0 : clk_div4_valid_i;  

*/
    assign s_clk_soc  = s_clk_soc_int;
    assign s_clk_cluster  = s_clk_soc_int;
   
    assign clk_div0_ack_o = 1'b1; // missing in ASIC: is this by chance? 
    assign clk_div1_ack_o = 1'b1;
    assign clk_div2_ack_o = 1'b1;
    assign clk_div3_ack_o = 1'b1;
    assign clk_div4_ack_o = 1'b1;


    pulp_clock_mux2 clk_out_mux_0_i
    (
        .clk_o(s_clk_out_0),
        .clk0_i(s_clk_fll_soc),
        .clk1_i(s_clk_fll_cluster),
        .clk_sel_i(s_clk_out_mux_0)
    );

    pulp_clock_mux2 clk_out_mux_1_i
    (
        .clk_o(s_clk_out_1),
        .clk0_i(s_clk_xor),
        .clk1_i(ref_clk_i),
        .clk_sel_i(s_clk_out_mux_1)
    );

    pulp_clock_mux2 clk_out_mux_i
    (
        .clk_o(s_clk_out_int),
        .clk0_i(s_clk_out_0),
        .clk1_i(s_clk_out_1),
        .clk_sel_i(s_clk_out_mux)
    );

/*
    clock_divider 
    #(
        .DIV_INIT(10),
        .BYPASS_INIT(0)
    )
    i_clkdiv_out
    (
        .clk_i(s_clk_out_int),
        .rstn_i(rstn_i),
        .test_mode_i(test_mode_i),
        .clk_gate_async_i(jtag_enable_clk_out_i),
        .clk_div_data_i(clk_div2_data_int),
        .clk_div_valid_i(clk_div2_valid_int),
        .clk_div_ack_o(clk_div2_ack_int),
        .clk_o(clk_out_o)
    );
*/

    always_comb
    begin
        case (jtag_clk_out_sel_i)
            2'b00:
            begin
                s_clk_out_mux_0 = 1'b0;
                s_clk_out_mux_1 = 1'b0;
                s_clk_out_mux = 1'b0;
            end
            2'b01:
            begin
                s_clk_out_mux_0 = 1'b1;
                s_clk_out_mux_1 = 1'b0;
                s_clk_out_mux = 1'b0;
            end
            2'b10:
            begin
                s_clk_out_mux_0 = 1'b0;
                s_clk_out_mux_1 = 1'b0;
                s_clk_out_mux = 1'b1;
            end
            2'b11:
            begin
                s_clk_out_mux_0 = 1'b0;
                s_clk_out_mux_1 = 1'b1;
                s_clk_out_mux = 1'b1;
            end
        endcase
    end
    assign rstn_sync_ref_o = s_rstn_ref_sync;
    assign rstn_sync_o     = s_rstn_soc_sync;
    assign initn_sync_o    = s_initn_soc_sync;

    assign rstn_cluster_o          = s_rstn_cluster;
    assign rstn_cluster_sync_soc_o = s_rstn_cluster_soc_sync;

    assign ref_clk_o       = s_clk_ref_bypass;
    assign ref_rstn_sync_o = s_rstn_ref_sync_bypass;

    assign clk_soc_o     = s_clk_soc;
    assign clk_cluster_o = s_clk_cluster;

endmodule
