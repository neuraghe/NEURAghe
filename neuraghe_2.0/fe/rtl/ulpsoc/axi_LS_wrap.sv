`include "ulpsoc_defines.sv"

module axi_slave_ls_wrap
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 10,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_STRB_WIDTH = 8,
    parameter BUFFER_WIDTH   = 8
)
(
    input  logic             power_down_i,
    AXI_BUS_ASYNC.Slave      slave_in,
    AXI_BUS_ASYNC.Master     master_out
);

   genvar i;

   generate

      //AW CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : aw_writetoken_LS
          pulp_level_shifter_in lev_shifter_aw_writetoken ( .out_o(master_out.aw_writetoken[i]), .in_i(slave_in.aw_writetoken[i]) );
      end

      for(i=0;i<AXI_ADDR_WIDTH;i++)
      begin : aw_addr_LS
          pulp_level_shifter_in lev_shifter_aw_addr ( .out_o(master_out.aw_addr[i]), .in_i(slave_in.aw_addr[i]) );
      end

      for(i=0;i<3;i++)
      begin : aw_prot_LS
          pulp_level_shifter_in lev_shifter_aw_prot ( .out_o(master_out.aw_prot[i]), .in_i(slave_in.aw_prot[i]) );
      end

      for(i=0;i<4;i++)
      begin : aw_region_LS
          pulp_level_shifter_in lev_shifter_aw_region ( .out_o(master_out.aw_region[i]), .in_i(slave_in.aw_region[i]) );
      end

      for(i=0;i<8;i++)
      begin : aw_len_LS
          pulp_level_shifter_in lev_shifter_aw_len ( .out_o(master_out.aw_len[i]), .in_i(slave_in.aw_len[i]) );
      end

      for(i=0;i<3;i++)
      begin : aw_size_LS
          pulp_level_shifter_in  lev_shifter_aw_size ( .out_o(master_out.aw_size[i]), .in_i(slave_in.aw_size[i]) );
      end

      for(i=0;i<2;i++)
      begin : aw_burst_LS
          pulp_level_shifter_in lev_shifter_aw_burst ( .out_o(master_out.aw_burst[i]), .in_i(slave_in.aw_burst[i]) );
      end

      pulp_level_shifter_in lev_shifter_aw_lock ( .out_o(master_out.aw_lock), .in_i(slave_in.aw_lock) );

      for(i=0;i<4;i++)
      begin : aw_cache_LS
          pulp_level_shifter_in  lev_shifter_aw_cache ( .out_o(master_out.aw_cache[i]), .in_i(slave_in.aw_cache[i]) );
      end

      for(i=0;i<4;i++)
      begin : aw_qos_LS
          pulp_level_shifter_in  lev_shifter_aw_qos ( .out_o(master_out.aw_qos[i]), .in_i(slave_in.aw_qos[i]) );
      end

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : aw_id_LS
          pulp_level_shifter_in lev_shifter_aw_id ( .out_o(master_out.aw_id[i]), .in_i(slave_in.aw_id[i]) );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : aw_user_LS
          pulp_level_shifter_in lev_shifter_aw_user ( .out_o(master_out.aw_user[i]),       .in_i(slave_in.aw_user[i])       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : aw_readpointer_LS
          pulp_level_shifter_clamp_out  lev_shifter_aw_readpointer      ( .out_o(slave_in.aw_readpointer[i]),       .in_i(master_out.aw_readpointer[i]), .clamp_i(power_down_i)       );
      end

      // AR CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : ar_writetoken_LS
          pulp_level_shifter_in lev_shifter_ar_writetoken       ( .out_o(master_out.ar_writetoken[i]),       .in_i(slave_in.ar_writetoken[i])       );
      end

      for(i=0;i<AXI_ADDR_WIDTH;i++)
      begin : ar_addr_LS
          pulp_level_shifter_in lev_shifter_ar_addr       ( .out_o(master_out.ar_addr[i]),       .in_i(slave_in.ar_addr[i])       );
      end

      for(i=0;i<3;i++)
      begin : ar_prot_LS
          pulp_level_shifter_in lev_shifter_ar_prot       ( .out_o(master_out.ar_prot[i]),       .in_i(slave_in.ar_prot[i])       );
      end

      for(i=0;i<4;i++)
      begin : ar_region_LS
          pulp_level_shifter_in lev_shifter_ar_region       ( .out_o(master_out.ar_region[i]),       .in_i(slave_in.ar_region[i])       );
      end

      for(i=0;i<8;i++)
      begin : ar_len_LS
          pulp_level_shifter_in lev_shifter_ar_len       ( .out_o(master_out.ar_len[i]),       .in_i(slave_in.ar_len[i])       );
      end

      for(i=0;i<3;i++)
      begin : ar_size_LS
          pulp_level_shifter_in lev_shifter_ar_size      ( .out_o(master_out.ar_size[i]),       .in_i(slave_in.ar_size[i])       );
      end

      for(i=0;i<2;i++)
      begin : ar_burst_LS
          pulp_level_shifter_in lev_shifter_ar_burst      ( .out_o(master_out.ar_burst[i]),       .in_i(slave_in.ar_burst[i])       );
      end

      pulp_level_shifter_in lev_shifter_ar_lock       ( .out_o(master_out.ar_lock),       .in_i(slave_in.ar_lock)       );

      for(i=0;i<4;i++)
      begin : ar_cache_LS
          pulp_level_shifter_in lev_shifter_ar_cache      ( .out_o(master_out.ar_cache[i]),       .in_i(slave_in.ar_cache[i])       );
      end

      for(i=0;i<4;i++)
      begin : ar_qos_LS
          pulp_level_shifter_in lev_shifter_ar_qos     ( .out_o(master_out.ar_qos[i]),       .in_i(slave_in.ar_qos[i])       );
      end

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : ar_id_LS
          pulp_level_shifter_in lev_shifter_ar_id     ( .out_o(master_out.ar_id[i]),       .in_i(slave_in.ar_id[i]) );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : ar_user_LS
          pulp_level_shifter_in lev_shifter_ar_user ( .out_o(master_out.ar_user[i]), .in_i(slave_in.ar_user[i]) );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : ar_readpointer_LS
          pulp_level_shifter_clamp_out  lev_shifter_aw_readpointer ( .out_o(slave_in.ar_readpointer[i]), .in_i(master_out.ar_readpointer[i]), .clamp_i(power_down_i));
      end

      //W CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : w_writetoken_LS
          pulp_level_shifter_in lev_shifter_w_writetoken ( .out_o(master_out.w_writetoken[i]), .in_i(slave_in.w_writetoken[i]) );
      end

      for(i=0;i<AXI_DATA_WIDTH;i++)
      begin : w_data_LS
          pulp_level_shifter_in lev_shifter_w_data ( .out_o(master_out.w_data[i]), .in_i(slave_in.w_data[i]) );
      end

      for(i=0;i<AXI_STRB_WIDTH;i++)
      begin : w_strb_LS
          pulp_level_shifter_in lev_shifter_w_strb ( .out_o(master_out.w_strb[i]), .in_i(slave_in.w_strb[i]) );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : w_user_LS
          pulp_level_shifter_in lev_shifter_w_user ( .out_o(master_out.w_user[i]), .in_i(slave_in.w_user[i]) );
      end

      pulp_level_shifter_in lev_shifter_w_last      ( .out_o(master_out.w_last),       .in_i(slave_in.w_last)       );


      for(i=0;i<BUFFER_WIDTH;i++)
      begin : w_readpointer_LS
          pulp_level_shifter_clamp_out  lev_shifter_w_readpointer   ( .out_o(slave_in.w_readpointer[i]),        .in_i(master_out.w_readpointer[i]), .clamp_i(power_down_i)       );
      end



      //B CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : b_writetoken_LS
          pulp_level_shifter_clamp_out  lev_shifter_b_writetoken    ( .out_o(slave_in.b_writetoken[i]),        .in_i(master_out.b_writetoken[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<2;i++)
      begin : b_resp_LS
          pulp_level_shifter_clamp_out  lev_shifter_b_resp    ( .out_o(slave_in.b_resp[i]),        .in_i(master_out.b_resp[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : b_id_LS
          pulp_level_shifter_clamp_out lev_shifter_b_id     ( .out_o(slave_in.b_id[i]),       .in_i(master_out.b_id[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : b_user_LS
          pulp_level_shifter_clamp_out lev_shifter_b_user    ( .out_o(slave_in.b_user[i]),       .in_i(master_out.b_user[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : b_readpointer_LS
          pulp_level_shifter_in lev_shifter_b_readpointer      ( .out_o(master_out.b_readpointer[i]),       .in_i(slave_in.b_readpointer[i])       );
      end

      // R CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : r_writetoken_LS
          pulp_level_shifter_clamp_out  lev_shifter_r_writetoken    ( .out_o(slave_in.r_writetoken[i]),        .in_i(master_out.r_writetoken[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_DATA_WIDTH;i++)
      begin : r_data_LS
          pulp_level_shifter_clamp_out  lev_shifter_r_data    ( .out_o(slave_in.r_data[i]),        .in_i(master_out.r_data[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<2;i++)
      begin : r_resp_LS
          pulp_level_shifter_clamp_out  lev_shifter_r_resp    ( .out_o(slave_in.r_resp[i]),        .in_i(master_out.r_resp[i]), .clamp_i(power_down_i)       );
      end

      pulp_level_shifter_clamp_out  lev_shifter_r_last    ( .out_o(slave_in.r_last),        .in_i(master_out.r_last), .clamp_i(power_down_i)       );

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : r_id_LS
          pulp_level_shifter_clamp_out lev_shifter_r_id     ( .out_o(slave_in.r_id[i]),       .in_i(master_out.r_id[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : r_user_LS
          pulp_level_shifter_clamp_out lev_shifter_r_user    ( .out_o(slave_in.r_user[i]),       .in_i(master_out.r_user[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : r_readpointer_LS
          pulp_level_shifter_in lev_shifter_r_readpointer      ( .out_o(master_out.r_readpointer[i]),       .in_i(slave_in.r_readpointer[i])       );
      end

   endgenerate

endmodule

module axi_master_ls_wrap
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 8,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_STRB_WIDTH = 8,
    parameter BUFFER_WIDTH   = 8
)
(
    input  logic             power_down_i,
    AXI_BUS_ASYNC.Slave      slave_in,
    AXI_BUS_ASYNC.Master     master_out
);

   genvar i;

   generate

      //AW CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : aw_writetoken_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_writetoken       ( .out_o(master_out.aw_writetoken[i]),       .in_i(slave_in.aw_writetoken[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_ADDR_WIDTH;i++)
      begin : aw_addr_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_addr       ( .out_o(master_out.aw_addr[i]),       .in_i(slave_in.aw_addr[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<3;i++)
      begin : aw_prot_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_prot       ( .out_o(master_out.aw_prot[i]),       .in_i(slave_in.aw_prot[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<4;i++)
      begin : aw_region_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_region       ( .out_o(master_out.aw_region[i]),       .in_i(slave_in.aw_region[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<8;i++)
      begin : aw_len_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_len       ( .out_o(master_out.aw_len[i]),       .in_i(slave_in.aw_len[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<3;i++)
      begin : aw_size_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_size      ( .out_o(master_out.aw_size[i]),       .in_i(slave_in.aw_size[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<2;i++)
      begin : aw_burst_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_burst      ( .out_o(master_out.aw_burst[i]),       .in_i(slave_in.aw_burst[i]), .clamp_i(power_down_i)       );
      end

      pulp_level_shifter_clamp_out lev_shifter_aw_lock       ( .out_o(master_out.aw_lock),       .in_i(slave_in.aw_lock), .clamp_i(power_down_i)       );

      for(i=0;i<4;i++)
      begin : aw_cache_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_cache      ( .out_o(master_out.aw_cache[i]),       .in_i(slave_in.aw_cache[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<4;i++)
      begin : aw_qos_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_qos     ( .out_o(master_out.aw_qos[i]),       .in_i(slave_in.aw_qos[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : aw_id_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_id     ( .out_o(master_out.aw_id[i]),       .in_i(slave_in.aw_id[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : aw_user_LS
          pulp_level_shifter_clamp_out lev_shifter_aw_user     ( .out_o(master_out.aw_user[i]),       .in_i(slave_in.aw_user[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : aw_readpointer_LS
          pulp_level_shifter_in  lev_shifter_aw_readpointer      ( .out_o(slave_in.aw_readpointer[i]),       .in_i(master_out.aw_readpointer[i])       );
      end



      //AR CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : ar_writetoken_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_writetoken       ( .out_o(master_out.ar_writetoken[i]),       .in_i(slave_in.ar_writetoken[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_ADDR_WIDTH;i++)
      begin : ar_addr_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_addr      ( .out_o(master_out.ar_addr[i]),       .in_i(slave_in.ar_addr[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<3;i++)
      begin : ar_prot_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_prot       ( .out_o(master_out.ar_prot[i]),       .in_i(slave_in.ar_prot[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<4;i++)
      begin : ar_region_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_region       ( .out_o(master_out.ar_region[i]),       .in_i(slave_in.ar_region[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<8;i++)
      begin : ar_len_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_len       ( .out_o(master_out.ar_len[i]),       .in_i(slave_in.ar_len[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<3;i++)
      begin : ar_size_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_size      ( .out_o(master_out.ar_size[i]),       .in_i(slave_in.ar_size[i]), .clamp_i(power_down_i)       );
      end


      for(i=0;i<2;i++)
      begin : ar_burst_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_burst      ( .out_o(master_out.ar_burst[i]),       .in_i(slave_in.ar_burst[i]), .clamp_i(power_down_i)       );
      end

      pulp_level_shifter_clamp_out lev_shifter_ar_lock       ( .out_o(master_out.ar_lock),       .in_i(slave_in.ar_lock), .clamp_i(power_down_i)       );

      for(i=0;i<4;i++)
      begin : ar_cache_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_cache      ( .out_o(master_out.ar_cache[i]),       .in_i(slave_in.ar_cache[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<4;i++)
      begin : ar_qos_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_qos     ( .out_o(master_out.ar_qos[i]),       .in_i(slave_in.ar_qos[i]), .clamp_i(power_down_i)       );
      end


      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : ar_id_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_id     ( .out_o(master_out.ar_id[i]),       .in_i(slave_in.ar_id[i]), .clamp_i(power_down_i)       );
      end


      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : ar_user_LS
          pulp_level_shifter_clamp_out lev_shifter_ar_user     ( .out_o(master_out.ar_user[i]),       .in_i(slave_in.ar_user[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : ar_readpointer_LS
          pulp_level_shifter_in  lev_shifter_ar_readpointer       ( .out_o(slave_in.ar_readpointer[i]),       .in_i(master_out.ar_readpointer[i])       );
      end




      //W CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : w_writetoken_LS
          pulp_level_shifter_clamp_out lev_shifter_w_writetoken    ( .out_o(master_out.w_writetoken[i]),      .in_i(slave_in.w_writetoken[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_DATA_WIDTH;i++)
      begin : w_data_LS
          pulp_level_shifter_clamp_out lev_shifter_w_data    ( .out_o(master_out.w_data[i]),    .in_i(slave_in.w_data[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_STRB_WIDTH;i++)
      begin : w_strb_LS
          pulp_level_shifter_clamp_out lev_shifter_w_strb    ( .out_o(master_out.w_strb[i]),    .in_i(slave_in.w_strb[i]), .clamp_i(power_down_i)       );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : w_user_LS
          pulp_level_shifter_clamp_out lev_shifter_w_user    ( .out_o(master_out.w_user[i]),    .in_i(slave_in.w_user[i]), .clamp_i(power_down_i)       );
      end

      pulp_level_shifter_clamp_out lev_shifter_w_last      ( .out_o(master_out.w_last),       .in_i(slave_in.w_last), .clamp_i(power_down_i)       );

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : w_readpointer_LS
          pulp_level_shifter_in  lev_shifter_w_readpointer   ( .out_o(slave_in.w_readpointer[i]),        .in_i(master_out.w_readpointer[i])       );
      end




      // B CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : b_writetoken_LS
          pulp_level_shifter_in  lev_shifter_b_writetoken    ( .out_o(slave_in.b_writetoken[i]),        .in_i(master_out.b_writetoken[i])       );
      end

      for(i=0;i<2;i++)
      begin : b_resp_LS
          pulp_level_shifter_in  lev_shifter_b_resp    ( .out_o(slave_in.b_resp[i]),        .in_i(master_out.b_resp[i])       );
      end

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : b_id_LS
          pulp_level_shifter_in lev_shifter_b_id     ( .out_o(slave_in.b_id[i]),       .in_i(master_out.b_id[i])       );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : b_user_LS
          pulp_level_shifter_in lev_shifter_b_user    ( .out_o(slave_in.b_user[i]),       .in_i(master_out.b_user[i])       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : b_readpointer_LS
          pulp_level_shifter_clamp_out lev_shifter_b_readpointer      ( .out_o(master_out.b_readpointer[i]),       .in_i(slave_in.b_readpointer[i]), .clamp_i(power_down_i)       );
      end




      // R CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : r_writetoken_LS
          pulp_level_shifter_in  lev_shifter_r_writetoken    ( .out_o(slave_in.r_writetoken[i]),        .in_i(master_out.r_writetoken[i])       );
      end

      for(i=0;i<AXI_DATA_WIDTH;i++)
      begin : r_data_LS
          pulp_level_shifter_in  lev_shifter_r_data    ( .out_o(slave_in.r_data[i]),        .in_i(master_out.r_data[i])       );
      end

      for(i=0;i<2;i++)
      begin : r_resp_LS
          pulp_level_shifter_in  lev_shifter_r_resp    ( .out_o(slave_in.r_resp[i]),        .in_i(master_out.r_resp[i])       );
      end

      pulp_level_shifter_in  lev_shifter_r_last    ( .out_o(slave_in.r_last),        .in_i(master_out.r_last)       );

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : r_id_LS
          pulp_level_shifter_in lev_shifter_r_id     ( .out_o(slave_in.r_id[i]),       .in_i(master_out.r_id[i])       );
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : r_user_LS
          pulp_level_shifter_in lev_shifter_r_user    ( .out_o(slave_in.r_user[i]),       .in_i(master_out.r_user[i])       );
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : r_readpointer_LS
          pulp_level_shifter_clamp_out lev_shifter_r_readpointer      ( .out_o(master_out.r_readpointer[i]),       .in_i(slave_in.r_readpointer[i]), .clamp_i(power_down_i)       );
      end

   endgenerate

endmodule
