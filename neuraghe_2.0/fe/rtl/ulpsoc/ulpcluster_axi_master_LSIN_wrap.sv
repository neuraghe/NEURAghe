`include "ulpsoc_defines.sv"

module ulpcluster_axi_master_LSIN_wrap
#(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 8,
    parameter AXI_USER_WIDTH = 6,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_STRB_WIDTH = 8,
    parameter BUFFER_WIDTH   = 8
)
(
    AXI_BUS_ASYNC.Slave      slave_in,
    AXI_BUS_ASYNC.Master     master_out
);

   genvar i;

   generate

      //AW CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : aw_writetoken_LS
          assign master_out.aw_writetoken[i] = slave_in.aw_writetoken[i];
      end

      for(i=0;i<AXI_ADDR_WIDTH;i++)
      begin : aw_addr_LS
          assign master_out.aw_addr[i] = slave_in.aw_addr[i];
      end

      for(i=0;i<3;i++)
      begin : aw_prot_LS
          assign master_out.aw_prot[i] = slave_in.aw_prot[i];
      end

      for(i=0;i<4;i++)
      begin : aw_region_LS
          assign master_out.aw_region[i] = slave_in.aw_region[i];
      end

      for(i=0;i<8;i++)
      begin : aw_len_LS
          assign master_out.aw_len[i] = slave_in.aw_len[i];
      end

      for(i=0;i<3;i++)
      begin : aw_size_LS
          assign master_out.aw_size[i] = slave_in.aw_size[i];
      end

      for(i=0;i<2;i++)
      begin : aw_burst_LS
          assign master_out.aw_burst[i] =  slave_in.aw_burst[i];
      end

      assign master_out.aw_lock = slave_in.aw_lock;

      for(i=0;i<4;i++)
      begin : aw_cache_LS
          assign master_out.aw_cache[i] = slave_in.aw_cache[i];
      end

      for(i=0;i<4;i++)
      begin : aw_qos_LS
          assign master_out.aw_qos[i] = slave_in.aw_qos[i];
      end

      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : aw_id_LS
          assign master_out.aw_id[i] = slave_in.aw_id[i];
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : aw_user_LS
          assign master_out.aw_user[i] = slave_in.aw_user[i];
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : aw_readpointer_LS
          pulp_level_shifter_in  lev_shifter_aw_readpointer      ( .out_o(slave_in.aw_readpointer[i]),       .in_i(master_out.aw_readpointer[i])       );
      end



      //AR CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : ar_writetoken_LS
          assign master_out.ar_writetoken[i] = slave_in.ar_writetoken[i];
      end

      for(i=0;i<AXI_ADDR_WIDTH;i++)
      begin : ar_addr_LS
          assign master_out.ar_addr[i] = slave_in.ar_addr[i];
      end

      for(i=0;i<3;i++)
      begin : ar_prot_LS
          assign master_out.ar_prot[i] = slave_in.ar_prot[i];
      end

      for(i=0;i<4;i++)
      begin : ar_region_LS
          assign master_out.ar_region[i] = slave_in.ar_region[i];
      end

      for(i=0;i<8;i++)
      begin : ar_len_LS
          assign master_out.ar_len[i] = slave_in.ar_len[i];
      end

      for(i=0;i<3;i++)
      begin : ar_size_LS
          assign master_out.ar_size[i] = slave_in.ar_size[i];
      end


      for(i=0;i<2;i++)
      begin : ar_burst_LS
          assign master_out.ar_burst[i] = slave_in.ar_burst[i];
      end

      assign master_out.ar_lock = slave_in.ar_lock;

      for(i=0;i<4;i++)
      begin : ar_cache_LS
          assign master_out.ar_cache[i] = slave_in.ar_cache[i];
      end

      for(i=0;i<4;i++)
      begin : ar_qos_LS
          assign master_out.ar_qos[i] = slave_in.ar_qos[i];
      end


      for(i=0;i<AXI_ID_WIDTH;i++)
      begin : ar_id_LS
          assign master_out.ar_id[i] = slave_in.ar_id[i];
      end


      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : ar_user_LS
          assign master_out.ar_user[i] = slave_in.ar_user[i];
      end

      for(i=0;i<BUFFER_WIDTH;i++)
      begin : ar_readpointer_LS
          pulp_level_shifter_in  lev_shifter_ar_readpointer       ( .out_o(slave_in.ar_readpointer[i]),       .in_i(master_out.ar_readpointer[i])       );
      end




      //W CHANNEL
      for(i=0;i<BUFFER_WIDTH;i++)
      begin : w_writetoken_LS
          assign master_out.w_writetoken[i] = slave_in.w_writetoken[i];
      end

      for(i=0;i<AXI_DATA_WIDTH;i++)
      begin : w_data_LS
          assign master_out.w_data[i] = slave_in.w_data[i];
      end

      for(i=0;i<AXI_STRB_WIDTH;i++)
      begin : w_strb_LS
          assign master_out.w_strb[i] = slave_in.w_strb[i];
      end

      for(i=0;i<AXI_USER_WIDTH;i++)
      begin : w_user_LS
          assign master_out.w_user[i] = slave_in.w_user[i];
      end

      assign master_out.w_last = slave_in.w_last;

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
          assign master_out.b_readpointer[i] = slave_in.b_readpointer[i];
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
          assign master_out.r_readpointer[i] = slave_in.r_readpointer[i];
      end

   endgenerate

endmodule
