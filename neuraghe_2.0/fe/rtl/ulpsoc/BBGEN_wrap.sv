module BBGEN_wrap
#(
	parameter  CVP_DATA_WIDTH = 64,
	parameter  CVP_ADDR_WIDTH = 29,
	parameter  CVP_BE_WIDTH   = CVP_DATA_WIDTH/8,
	parameter  IS_WEAK        = 0
)
(
	input  logic 							clk_i,
	input  logic 							rst_n,

    //-------------------------------------------------------------------------
    // CVP interface
    //-------------------------------------------------------------------------
    input  logic            				cvp_req_i         , // in  std_logic;
    output logic            				cvp_ack_o         , // out std_logic;
    input  logic [CVP_DATA_WIDTH-1:0]     	cvp_w_data_i      , // in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
    output logic [CVP_DATA_WIDTH-1:0]     	cvp_r_data_o      , // out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
    input  logic [CVP_ADDR_WIDTH-1:0]     	cvp_addr_i        , // in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
    input  logic            				cvp_rw_i          , // in  std_logic;
    input  logic [CVP_BE_WIDTH-1:0]   		cvp_be_i          , // in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
    output logic            				cvp_error_o       , // out std_logic;

    input  logic [1:0]						preset_select_i   , // in std_logic_vector(1 downto 0);
    input  logic 							preset_activate_i , // in std_logic;

    output logic            				target_reached_o  , // out std_logic
    input  logic 							force_sleep_i
);

	localparam	BBGEN_DAC_WIDTH = 5; //FIXME

	logic [BBGEN_DAC_WIDTH-1:0]             monitor_nwell_UB;
	logic [BBGEN_DAC_WIDTH-1:0]             monitor_nwell_LB;
	logic [BBGEN_DAC_WIDTH-1:0]             monitor_pwell_UB;
	logic [BBGEN_DAC_WIDTH-1:0]             monitor_pwell_LB;
	
	logic 									monitor_nwell_clk     ;
	logic 									monitor_pos_pwell_clk ;
	logic 									monitor_neg_pwell_clk ;

	logic 									monitor_comp_nwell_UB     ;
	logic 									monitor_comp_nwell_LB     ;
	logic 									monitor_comp_pos_pwell_UB ;
	logic 									monitor_comp_pos_pwell_LB ;
	logic 									monitor_comp_neg_pwell_UB ;
	logic 									monitor_comp_neg_pwell_LB ;

	logic [1:0]	  						    driver_sel_nwell  ;
	logic [1:0]   							driver_sel_pwell  ;
	logic 									driver_charge_clk ;


generate
		if(IS_WEAK == 1 )
		begin : WEAK_DRIVER

			bbgen_control bbgen_control_i
			(
			    .reference_clk              ( clk_i                      ),  // in  std_logic;
			    .nRST                       ( rst_n                      ),  // in  std_logic;
			    //-------------------------------------------------------------------------
			    // CVP interface
			    //-------------------------------------------------------------------------
			    .cvp_req                    ( cvp_req_i                  ),  // in  std_logic;
			    .cvp_ack                    ( cvp_ack_o                  ),  // out std_logic;
			    .cvp_w_data                 ( cvp_w_data_i               ),  // in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
			    .cvp_r_data                 ( cvp_r_data_o               ),  // out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
			    .cvp_addr                   ( cvp_addr_i                 ),  // in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
			    .cvp_rw                     ( cvp_rw_i                   ),  // in  std_logic;
			    .cvp_be                     ( cvp_be_i                   ),  // in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
			    .cvp_error                  ( cvp_error_o                ),  // out std_logic;

			    //-------------------------------------------------------------------------
			    // interface to monitor block
			    //-------------------------------------------------------------------------
			    // reference settings
			    .monitor_nwell_UB           ( monitor_nwell_UB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // upper bound for nwell comperator
			    .monitor_nwell_LB           ( monitor_nwell_LB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // lower bound for nwell comperator
			    .monitor_pwell_UB           ( monitor_pwell_UB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // upper bound for pwell comperator
			    .monitor_pwell_LB           ( monitor_pwell_LB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // lower bound for pwell comperator

			    // sampling clocks
			    .monitor_nwell_clk          ( monitor_nwell_clk          ), // out std_logic;
			    .monitor_pos_pwell_clk      ( monitor_pos_pwell_clk      ), // out std_logic;
			    .monitor_neg_pwell_clk      ( monitor_neg_pwell_clk      ), // out std_logic;

			    // comparator outputs
			    .monitor_comp_nwell_UB      ( monitor_comp_nwell_UB      ), // in std_logic;
			    .monitor_comp_nwell_LB      ( monitor_comp_nwell_LB      ), // in std_logic;
			    .monitor_comp_pos_pwell_UB  ( monitor_comp_pos_pwell_UB  ), // in std_logic;
			    .monitor_comp_pos_pwell_LB  ( monitor_comp_pos_pwell_LB  ), // in std_logic;
			    .monitor_comp_neg_pwell_UB  ( monitor_comp_neg_pwell_UB  ), // in std_logic;
			    .monitor_comp_neg_pwell_LB  ( monitor_comp_neg_pwell_LB  ), // in std_logic;

			    //-------------------------------------------------------------------------
			    // Interface to the driver block
			    //-------------------------------------------------------------------------

			    .driver_sel_nwell           ( driver_sel_nwell           ), // out std_logic_vector(1 downto 0);
			    .driver_sel_pwell           ( driver_sel_pwell           ), // out std_logic_vector(1 downto 0);
			    .driver_charge_clk          ( driver_charge_clk          ), // out std_logic;
			    .driver_weak                ( 1'b1                       ),

			    //-------------------------------------------------------------------------
			    // interface to externally select a preset
			    //-------------------------------------------------------------------------

			    .preset_select              ( preset_select_i            ), // in std_logic_vector(1 downto 0);
			    .preset_activate            ( preset_activate_i          ), // in std_logic;

			    //-------------------------------------------------------------------------
			    // High active signal, high as soon as the body bias target is reached
			    // after a mode change.
			    //-------------------------------------------------------------------------
			    .target_reached             ( target_reached_o           ),   // out std_logic
			    .force_sleep                ( force_sleep_i              )
			);

			vbbgen_PULPV3_weakdriver  weak_bbgen_driver_i
			(
				.selP0 (  driver_sel_pwell[0]  ),
				.selP1 (  driver_sel_pwell[1]  ),
				.selN0 (  driver_sel_nwell[0]  ),
				.selN1 (  driver_sel_nwell[1]  ),
				.clk   (  driver_charge_clk    )
			);

		end
		else
		begin : STRONG_DRIVER
			
			bbgen_control bbgen_control_i
			(
			    .reference_clk              ( clk_i                      ),  // in  std_logic;
			    .nRST                       ( rst_n                      ),  // in  std_logic;
			    //-------------------------------------------------------------------------
			    // CVP interface
			    //-------------------------------------------------------------------------
			    .cvp_req                    ( cvp_req_i                  ),  // in  std_logic;
			    .cvp_ack                    ( cvp_ack_o                  ),  // out std_logic;
			    .cvp_w_data                 ( cvp_w_data_i               ),  // in  std_logic_vector(CVP_DATA_WIDTH - 1 downto 0);
			    .cvp_r_data                 ( cvp_r_data_o               ),  // out std_logic_vector(CVP_DATA_WIDTH -1 downto 0);
			    .cvp_addr                   ( cvp_addr_i                 ),  // in  std_logic_vector(CVP_ADDR_WIDTH -1 downto 0);
			    .cvp_rw                     ( cvp_rw_i                   ),  // in  std_logic;
			    .cvp_be                     ( cvp_be_i                   ),  // in  std_logic_vector(CVP_BE_WIDTH - 1 downto 0);
			    .cvp_error                  ( cvp_error_o                ),  // out std_logic;

			    //-------------------------------------------------------------------------
			    // interface to monitor block
			    //-------------------------------------------------------------------------
			    // reference settings
			    .monitor_nwell_UB           ( monitor_nwell_UB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // upper bound for nwell comperator
			    .monitor_nwell_LB           ( monitor_nwell_LB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // lower bound for nwell comperator
			    .monitor_pwell_UB           ( monitor_pwell_UB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // upper bound for pwell comperator
			    .monitor_pwell_LB           ( monitor_pwell_LB           ), // out std_logic_vector(BBGEN_DAC_WIDTH - 1 downto 0);  // lower bound for pwell comperator

			    // sampling clocks
			    .monitor_nwell_clk          ( monitor_nwell_clk          ), // out std_logic;
			    .monitor_pos_pwell_clk      ( monitor_pos_pwell_clk      ), // out std_logic;
			    .monitor_neg_pwell_clk      ( monitor_neg_pwell_clk      ), // out std_logic;

			    // comparator outputs
			    .monitor_comp_nwell_UB      ( monitor_comp_nwell_UB      ), // in std_logic;
			    .monitor_comp_nwell_LB      ( monitor_comp_nwell_LB      ), // in std_logic;
			    .monitor_comp_pos_pwell_UB  ( monitor_comp_pos_pwell_UB  ), // in std_logic;
			    .monitor_comp_pos_pwell_LB  ( monitor_comp_pos_pwell_LB  ), // in std_logic;
			    .monitor_comp_neg_pwell_UB  ( monitor_comp_neg_pwell_UB  ), // in std_logic;
			    .monitor_comp_neg_pwell_LB  ( monitor_comp_neg_pwell_LB  ), // in std_logic;

			    //-------------------------------------------------------------------------
			    // Interface to the driver block
			    //-------------------------------------------------------------------------

			    .driver_sel_nwell           ( driver_sel_nwell           ), // out std_logic_vector(1 downto 0);
			    .driver_sel_pwell           ( driver_sel_pwell           ), // out std_logic_vector(1 downto 0);
			    .driver_charge_clk          ( driver_charge_clk          ), // out std_logic;
			    .driver_weak                ( 1'b0                       ),

			    //-------------------------------------------------------------------------
			    // interface to externally select a preset
			    //-------------------------------------------------------------------------

			    .preset_select              ( preset_select_i            ), // in std_logic_vector(1 downto 0);
			    .preset_activate            ( preset_activate_i          ), // in std_logic;

			    //-------------------------------------------------------------------------
			    // High active signal, high as soon as the body bias target is reached
			    // after a mode change.
			    //-------------------------------------------------------------------------
			    .target_reached             ( target_reached_o           ),   // out std_logic
			    .force_sleep                ( force_sleep_i              )
			);

			vbbgen_PULPV3_driver    strong_bbgen_driver_i
			(
				.selP0 (  driver_sel_pwell[0]  ),
				.selP1 (  driver_sel_pwell[1]  ),
				.selN0 (  driver_sel_nwell[0]  ),
				.selN1 (  driver_sel_nwell[1]  ),
				.clk   (  driver_charge_clk    )
			);
		end
endgenerate

vbbgen_PULPV3_monitor  vbbgen_monitor_i
(
    .pwell_value_LB        ( monitor_pwell_LB           ), // input [4:0]
    .pwell_value_UB        ( monitor_pwell_UB           ), // input [4:0] 
    .nwell_value_LB        ( monitor_nwell_LB           ), // input [4:0]
    .nwell_value_UB        ( monitor_nwell_UB           ), // input [4:0]

    .nwell_clk             ( monitor_nwell_clk          ), // input
    .pwell_pos_clk         ( monitor_pos_pwell_clk      ), // input
    .pwell_neg_clk         ( monitor_neg_pwell_clk      ), // input

    .compare_pwell_neg_LB  ( monitor_comp_neg_pwell_LB  ), // output 
    .compare_pwell_neg_UB  ( monitor_comp_neg_pwell_UB  ), // output 
    .compare_nwell_LB      ( monitor_comp_nwell_LB      ), // output     
    .compare_nwell_UB      ( monitor_comp_nwell_UB      ), // output     
    .compare_pwell_pos_LB  ( monitor_comp_pos_pwell_LB  ), // output
    .compare_pwell_pos_UB  ( monitor_comp_pos_pwell_UB  )  // output
);


endmodule