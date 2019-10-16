`include "ulpsoc_defines.sv"

module level_shifter_wrap
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 10,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_STRB_WIDTH = AXI_DATA_WIDTH/8,
    parameter BUFFER_WIDTH   = 8
)
(
    // From APC SOC CTRL unit
    input  logic                 power_down_i,
    // FROM SOC
    input  logic                 clk_i,
    input  logic                 rst_n_i,
    // Jtag signals
    input  logic                 tck_i,
    input  logic                 tms_i,
    input  logic                 trstn_i,
    input  logic                 tdi_i,
    output logic                 tdo_shift_o,
`ifdef REMAP_ADDRESS
    input logic [3:0]            base_addr_i,
`endif
    input logic                  test_mode_i,
    input logic                  en_sa_boot_i,
    input logic [4:0]            cluster_id_i,
    input logic                  fetch_en_i,
    input logic [7:0]            ext_events_i,
    output logic                 eoc_shift_o,
    output logic                 busy_shift_o,

    AXI_BUS_ASYNC.Slave         data_slave_soc,
    AXI_BUS_ASYNC.Master        instr_master_soc,
    AXI_BUS_ASYNC.Master        data_master_soc,

    input  logic [10:0]          SI_i,
    input  logic                SE_i,
    output logic [10:0]          SO_shift_o,


    //To/From Cluster
    output logic                 clk_shift_o,
    output logic                 rst_n_shift_o,
    // Jtag
    output  logic                tck_shift_o,
    output  logic                tms_shift_o,
    output  logic                trstn_shift_o,
    output  logic                tdi_shift_o,
    input   logic                tdo_i,
`ifdef REMAP_ADDRESS
   output logic [3:0]            base_addr_shift_o,
`endif
    output logic                 test_mode_shift_o,
    output logic                 en_sa_boot_shift_o,
    output logic [4:0]           cluster_id_shift_o,
    output logic                 fetch_en_shift_o,
    output logic [7:0]           ext_events_shift_o,
    input  logic                 eoc_i,
    input  logic                 busy_i,

    AXI_BUS_ASYNC.Master         data_slave_cluster,
    AXI_BUS_ASYNC.Slave          instr_master_cluster,
    AXI_BUS_ASYNC.Slave          data_master_cluster,

    output  logic [10:0]           SI_shift_o,
    output  logic                 SE_shift_o,
    input   logic [10:0]           SO_i
);

genvar i;
generate
    //downShifting H->L, or H->H
    pulp_level_shifter_in        lev_shifter_clk_i    ( .out_o(clk_shift_o),      .in_i(clk_i)                                );
    pulp_level_shifter_in        lev_shifter_rst_n_i  ( .out_o(rst_n_shift_o),    .in_i(rst_n_i)                              );
    pulp_level_shifter_in        lev_shifter_tck_i    ( .out_o(tck_shift_o),      .in_i(tck_i)                                );
    pulp_level_shifter_in        lev_shifter_tms_i    ( .out_o(tms_shift_o),      .in_i(tms_i)                                );
    pulp_level_shifter_in        lev_shifter_trstn_i  ( .out_o(trstn_shift_o),    .in_i(trstn_i)                              );
    pulp_level_shifter_in        lev_shifter_tdi_i    ( .out_o(tdi_shift_o),      .in_i(tdi_i)                                );

    //TDO UpShifting L->H, or H->H
    pulp_level_shifter_clamp_out lev_shifter_tdo_i    ( .out_o(tdo_shift_o),      .in_i(tdo_i),  .clamp_i(power_down_i)       );

`ifdef REMAP_ADDRESS 
    //downShifting H->L, or H->H

    for(i=0; i<4; i++)
    begin : lev_shifter_BASE_ADDR_REMAP
      pulp_level_shifter_in        lev_shifter_base_addr_i ( .out_o(base_addr_shift_o[i]), .in_i(base_addr_i[i]) ); 
    end

`endif
    //downShifting H->L, or H->H
    pulp_level_shifter_in         lev_shifter_test_mode_i  ( .out_o(test_mode_shift_o),  .in_i(test_mode_i)  );
    pulp_level_shifter_in         lev_shifter_en_sa_boot_i ( .out_o(en_sa_boot_shift_o), .in_i(en_sa_boot_i) );

    for(i=0; i<5; i++)
    begin : lev_shifter_CLUSTER_ID
        pulp_level_shifter_in     lev_shifter_cluster_id_i ( .out_o(cluster_id_shift_o[i]), .in_i(cluster_id_i[i]) );
    end
    pulp_level_shifter_in         lev_shifter_fetch_en_i   ( .out_o(fetch_en_shift_o), .in_i(fetch_en_i)   );

    for(i=0; i<8; i++)
    begin : lev_shifter_EXT_EVENTS
        pulp_level_shifter_in     lev_shifter_ext_events_i ( .out_o(ext_events_shift_o[i]), .in_i(ext_events_i[i]) );
    end

    //eoc and busy UpShifting L->H, or H->H
    pulp_level_shifter_clamp_out lev_shifter_eoc_i    ( .out_o(eoc_shift_o),       .in_i(eoc_i),   .clamp_i(power_down_i)       );
    pulp_level_shifter_clamp_out lev_shifter_busy_i   ( .out_o(busy_shift_o),      .in_i(busy_i),  .clamp_i(power_down_i)       );


    // Level Shifter for ScanIn ScanOut and ScanEnable
    for(i=0; i<11; i++)
    begin : lev_shifter_SI
      //downShifting H->L, or H->H
      pulp_level_shifter_in lev_shifter_SI_i ( .out_o(SI_shift_o[i]), .in_i(SI_i[i]) );
    end

    //downShifting H->L, or H->H
    pulp_level_shifter_in lev_shifter_SE_i ( .out_o(SE_shift_o), .in_i(SE_i) );

    for(i=0; i<11; i++)
    begin : lev_shifter_SO
      //UP shifting: Scan Out UpShifting L->H, or H->H
      pulp_level_shifter_clamp_out lev_shifter_SO_i ( .out_o(SO_shift_o[i]), .in_i(SO_i[i]), .clamp_i(power_down_i) );
    end






   axi_slave_ls_wrap
   #(
       .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH    ),
       .AXI_ID_WIDTH   ( AXI_ID_WIDTH      ),
       .AXI_USER_WIDTH ( AXI_USER_WIDTH    ),
       .AXI_DATA_WIDTH ( AXI_DATA_WIDTH    ),
       .AXI_STRB_WIDTH ( AXI_STRB_WIDTH    ),
       .BUFFER_WIDTH   ( BUFFER_WIDTH      )
    )
   data_slave_ls_wrap_i
   (
      .power_down_i    ( power_down_i      ),
      .slave_in        ( data_slave_soc    ),
      .master_out      ( data_slave_cluster)
   );

   axi_master_ls_wrap
   #(
       .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH    ),
       .AXI_ID_WIDTH   ( AXI_ID_WIDTH      ),
       .AXI_USER_WIDTH ( AXI_USER_WIDTH    ),
       .AXI_DATA_WIDTH ( AXI_DATA_WIDTH    ),
       .AXI_STRB_WIDTH ( AXI_STRB_WIDTH    ),
       .BUFFER_WIDTH   ( BUFFER_WIDTH      )
   )
   instr_master_ls_wrap_i
   (
      .power_down_i    ( power_down_i         ),
      .slave_in        ( instr_master_cluster ),
      .master_out      ( instr_master_soc     )
   );

   axi_master_ls_wrap
   #(
       .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH   ),
       .AXI_ID_WIDTH   ( AXI_ID_WIDTH     ),
       .AXI_USER_WIDTH ( AXI_USER_WIDTH   ),
       .AXI_DATA_WIDTH ( AXI_DATA_WIDTH   ),
       .AXI_STRB_WIDTH ( AXI_STRB_WIDTH   ),
       .BUFFER_WIDTH   ( BUFFER_WIDTH     )
    )
   data_master_ls_wrap_i
   (
      .power_down_i   ( power_down_i          ),
      .slave_in       ( data_master_cluster   ),
      .master_out     ( data_master_soc       )
   );

endgenerate
endmodule
