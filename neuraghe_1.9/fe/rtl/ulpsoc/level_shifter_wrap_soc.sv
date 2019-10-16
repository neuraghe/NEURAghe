`include "ulpsoc_defines.sv"

module level_shifter_wrap_soc
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
    output logic                 tdo_shift_o,
    output logic                 eoc_shift_o,
    output logic                 busy_shift_o,
    output logic [7:0]           ext_events_ack_o,

    AXI_BUS_ASYNC.Slave          data_slave_soc,
    AXI_BUS_ASYNC.Master         instr_master_soc,
    AXI_BUS_ASYNC.Master         data_master_soc,

    output logic [11:0]          SO_shift_o,

    output  logic [1:0]          CLUSTER_PMB_serial_out_o,
    output  logic [1:0]          CLUSTER_PMB_pmbw_ack_o,



    //From Cluster
    input   logic                tdo_i,
    input  logic                 eoc_i,
    input  logic                 busy_i,
    input  logic [7:0]           ext_events_ack_i,

    AXI_BUS_ASYNC.Master         data_slave_cluster,
    AXI_BUS_ASYNC.Slave          instr_master_cluster,
    AXI_BUS_ASYNC.Slave          data_master_cluster,

    input  logic [11:0]          SO_i,
    input  logic [1:0]           CLUSTER_PMB_serial_out_i,
    input  logic [1:0]           CLUSTER_PMB_pmbw_ack_i
);

genvar i;
generate

    //TDO,  eoc, busy UpShifting L->H, or H->H
    pulp_level_shifter_in_clamp lev_shifter_tdo_i    ( .out_o(tdo_shift_o),       .in_i(tdo_i),   .clamp_i(power_down_i)       );
    pulp_level_shifter_in_clamp lev_shifter_eoc_i    ( .out_o(eoc_shift_o),       .in_i(eoc_i),   .clamp_i(power_down_i)       );
    pulp_level_shifter_in_clamp lev_shifter_busy_i   ( .out_o(busy_shift_o),      .in_i(busy_i),  .clamp_i(power_down_i)       );

    for(i=0; i<8; i++)
    begin : lev_shifter_ext_events_ack_i
      pulp_level_shifter_in_clamp lev_shifter_ext_events_ack_i ( .out_o(ext_events_ack_o[i]), .in_i(ext_events_ack_i[i]), .clamp_i(power_down_i) );
    end

    for(i=0; i<12; i++)
    begin : lev_shifter_SO
      //UP shifting: Scan Out UpShifting L->H, or H->H
      pulp_level_shifter_in_clamp lev_shifter_SO_i ( .out_o(SO_shift_o[i]), .in_i(SO_i[i]), .clamp_i(power_down_i) );
    end

    for(i=0; i<2; i++)
    begin : lev_shifter_CLUSTER_PMB_serial_out_i
      //UP shifting: Scan Out UpShifting L->H, or H->H
      pulp_level_shifter_in_clamp lev_shifter_CLUSTER_PMB_serial_out_i( .out_o(CLUSTER_PMB_serial_out_o[i]), .in_i(CLUSTER_PMB_serial_out_i[i]), .clamp_i(power_down_i) );
    end
    for(i=0; i<2; i++)
    begin : lev_shifter_CLUSTER_PMB_pmbw_ack_i
      //UP shifting: Scan Out UpShifting L->H, or H->H
      pulp_level_shifter_in_clamp lev_shifter_CLUSTER_PMB_pmbw_ack_i ( .out_o(CLUSTER_PMB_pmbw_ack_o[i]), .in_i(CLUSTER_PMB_pmbw_ack_i[i]), .clamp_i(power_down_i) );
    end



   ulpsoc_axi_master_LSIN_wrap
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

   ulpsoc_axi_slave_LSIN_wrap
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

   ulpsoc_axi_slave_LSIN_wrap
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
