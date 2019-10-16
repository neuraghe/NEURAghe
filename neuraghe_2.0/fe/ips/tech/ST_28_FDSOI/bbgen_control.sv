module bbgen_control
#(
    parameter   CVP_DATA_WIDTH = 64,
    parameter   CVP_ADDR_WIDTH = 29,
    parameter   CVP_BE_WIDTH   = 8,
    parameter   BBGEN_DAC_WIDTH = 16
)
(
    input  logic                                reference_clk, // in  std_logic;
    input  logic                                nRST,          // in  std_logic;
   //-------------------------------------------------------------------------
   // CVP interface
   //-------------------------------------------------------------------------
    input  logic                                cvp_req,       // in  std_logic;
    output logic                                cvp_ack,       // out std_logic;
    input  logic [CVP_DATA_WIDTH-1:0]           cvp_w_data,    // in  std_logic_vector(63 downto 0);
    output logic [CVP_DATA_WIDTH-1:0]           cvp_r_data,    // out std_logic_vector(63 downto 0);
    input  logic [CVP_ADDR_WIDTH-1:0]           cvp_addr,      // in  std_logic_vector(31 downto 0);
    input  logic                                cvp_rw,        // in  std_logic;
    input  logic [CVP_BE_WIDTH-1:0]             cvp_be,        // in  std_logic_vector(7 downto 0);
    output logic                                cvp_error,     // out std_logic;

   //-------------------------------------------------------------------------
   // interface to monitor block
   //-------------------------------------------------------------------------
   // reference settings
    output logic [BBGEN_DAC_WIDTH-1:0]          monitor_nwell_UB, // out std_logic_vector(15 downto 0); // upper bound for nwell comperator
    output logic [BBGEN_DAC_WIDTH-1:0]          monitor_nwell_LB, // out std_logic_vector(15 downto 0); // lower bound for nwell comperator
    output logic [BBGEN_DAC_WIDTH-1:0]          monitor_pwell_UB, // out std_logic_vector(15 downto 0); // upper bound for pwell comperator
    output logic [BBGEN_DAC_WIDTH-1:0]          monitor_pwell_LB, // out std_logic_vector(15 downto 0); // lower bound for pwell comperator

   // sampling clocks
    output logic                                monitor_nwell_clk ,    // out std_logic;
    output logic                                monitor_pos_pwell_clk, // out std_logic;
    output logic                                monitor_neg_pwell_clk, // out std_logic;

   // comparator outputs
    input  logic                                monitor_comp_nwell_UB,     // in std_logic;
    input  logic                                monitor_comp_nwell_LB,     // in std_logic;
    input  logic                                monitor_comp_pos_pwell_UB, // in std_logic;
    input  logic                                monitor_comp_pos_pwell_LB, // in std_logic;
    input  logic                                monitor_comp_neg_pwell_UB, // in std_logic;
    input  logic                                monitor_comp_neg_pwell_LB, // in std_logic;

   //-------------------------------------------------------------------------
   // Interface to the driver block
   //-------------------------------------------------------------------------

    output logic [1:0]                          driver_sel_nwell,  // out std_logic_vector(1 downto 0);
    output logic [1:0]                          driver_sel_pwell,  // out std_logic_vector(1 downto 0);
    output logic                                driver_charge_clk, // out std_logic;

   //-------------------------------------------------------------------------
   // interface to externally select a preset
   //-------------------------------------------------------------------------

    input  logic [1:0]                          preset_select, // in std_logic_vector(1 downto 0);
    input  logic                                preset_activate, // in std_logic;

   //-------------------------------------------------------------------------
   // High active signal, high as soon as the body bias target is reached
   // after a mode change.
   //-------------------------------------------------------------------------
    output logic                                target_reached // out std_logic
);



endmodule

