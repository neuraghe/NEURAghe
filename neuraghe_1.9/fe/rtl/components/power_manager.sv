`define REQ_SW_RST       2'b00
`define REQ_POWER_DOWN   2'b01
`define REQ_BBGEN        2'b10

`define SEL_SOC_ONLY     2'b00
`define SEL_CLUSTER_ONLY 2'b01
`define SEL_SOC_CLUSTER  2'b10

`define WAIT_FOR_NONE    2'b00
`define WAIT_FOR_SOC     2'b01
`define WAIT_FOR_CLUSTER 2'b10

module power_manager 
(
    input  logic        clk_i,
    input  logic        rstn_i,

    input  logic        test_mode_i,

    input  logic [31:0] padframe_gpio_i,
    output logic        padframe_power_down_o,

    input  logic        jtag_bbgen_off_soc_i,
    input  logic        jtag_bbgen_off_cluster_i,
    input  logic        jtag_bbgen_bypass_i,
    input  logic  [1:0] jtag_bbgen_value_soc_i,
    input  logic  [1:0] jtag_bbgen_value_cluster_i,

    input  logic        socctrl_power_down_req_i,
    input  logic        socctrl_bbgen_req_i,
    input  logic  [2:0] socctrl_bbgen_sel_i,
    input  logic  [1:0] socctrl_bbgen_dat_i,
    input  logic        socctrl_cluster_rst_req_i,
    input  logic        socctrl_wakeup_polarity_i,
    input  logic  [4:0] socctrl_wakeup_select_i,
    input  logic  [7:0] socctrl_busy_cycle_i,
    input  logic  [7:0] socctrl_rst_cycle_i,
    input  logic        socctrl_valid_i,
    output logic        socctrl_ack_o,
    output logic        socctrl_power_down_o,

    input  logic        cluster_busy_i,
    output logic        fetch_en_o,

    output logic        clkgen_enable_soc_clk_o,
    output logic        clkgen_enable_cluster_clk_o,

    output logic        clkgen_cluster_rstn_o,
    output logic        clkgen_soc_rstn_o,

    output logic [1:0]  preset_select_cp1_o,
    output logic        preset_activate_cp1_o,
    input  logic        target_reached_cp1_i,
    output logic [1:0]  preset_select_cp2_o,
    output logic        preset_activate_cp2_o,
    input  logic        target_reached_cp2_i 
);

    enum logic [3:0] { RESET, WAIT_BBGEN_FIRST, WAIT_BBGEN_LAST, WAIT_BBGEN, WAIT_BBGEN_EVENT, IDLE, WAIT_NO_BUSY, DISABLE_CLK, OFF, ENABLE_CLK, FETCH_EN, CLUSTER_RST } state,state_next;

    logic [1:0] r_req_type;
    logic [1:0] s_req_type_next;
    logic s_cnt_busy_clear;
    logic s_cnt_rst_clear;
    logic s_cnt_busy_event;
    logic s_cnt_rst_event;

    logic busy_sync;
    logic busy_sync0;
    logic r_wakeup_event_sync;
    logic r_wakeup_event_sync0;
    logic s_clk_off;

    logic s_wakeup_event;
    logic s_wakeup_signal;
    logic s_wakeup_signal_re;
    logic s_wakeup_signal_fe;

    logic s_cfg_sample;

    logic        r_power_down_req;
    logic        r_cluster_rst_req;
    logic        r_wakeup_polarity;
    logic  [4:0] r_wakeup_select;
    logic  [7:0] r_busy_cycle;
    logic  [7:0] r_rst_cycle;
    logic        r_fetch_en;
    logic  [1:0] r_bbgen_dat;
    logic  [1:0] r_bbgen_dat_old;

    logic  [4:0] r_timeout_cnt;
    logic        r_timeout_start;

    logic        s_set_fetch;
    logic        s_clear_fetch;
    logic        s_preset_activate_cp2;
    logic        s_preset_activate_cp1;
    
    logic        s_bbgen_cluster_valid_fall;
    logic        s_bbgen_soc_valid_fall;
    logic        s_bbgen_cluster_valid_rise;
    logic        s_bbgen_soc_valid_rise;
    logic        s_bbgen_cluster_valid;
    logic        s_bbgen_soc_valid;

    logic        s_bbgen_cluster_valid_fall_int;
    logic        s_bbgen_soc_valid_fall_int;
    logic        s_bbgen_cluster_valid_rise_int;
    logic        s_bbgen_soc_valid_rise_int;
    logic        s_bbgen_cluster_valid_int;
    logic        s_bbgen_soc_valid_int;

    logic  [1:0] r_wait_for;
    logic  [1:0] s_wait_for_next;

    logic        s_is_reboot_next;
    logic        r_is_reboot;

    logic socctrl_ack_nodft;
    logic s_cfg_sample_nodft;

    assign preset_select_cp1_o    = jtag_bbgen_bypass_i ? jtag_bbgen_value_soc_i     : (s_is_reboot_next ? r_bbgen_dat_old : r_bbgen_dat);
    assign preset_select_cp2_o    = jtag_bbgen_bypass_i ? jtag_bbgen_value_cluster_i : (s_is_reboot_next ? r_bbgen_dat_old : r_bbgen_dat);

    assign s_wakeup_event = r_wakeup_polarity ? s_wakeup_signal_re : ~s_wakeup_signal_fe;
    
    always_ff @(posedge clk_i or negedge rstn_i)
    begin
      if(rstn_i == 1'b0)
      begin
        preset_activate_cp1_o <= 1'b0;
        preset_activate_cp2_o <= 1'b0;
        r_timeout_cnt         <=  'h0;
        r_timeout_start       <= 1'b0;
      end
      else
      begin

        if (s_preset_activate_cp1 || s_preset_activate_cp2)
          r_timeout_start <= 1'b1;
        else if (r_timeout_cnt == 5'h1F)
          r_timeout_start <= 1'b0;

        if (r_timeout_start)
        begin
          if (r_timeout_cnt == 5'h1F)
            r_timeout_cnt <=  'h0;
          else
            r_timeout_cnt <= r_timeout_cnt + 1;
        end

        if (s_preset_activate_cp1)
          preset_activate_cp1_o <= 1'b1;
        else if (s_bbgen_soc_valid_fall || (r_timeout_cnt == 5'h1F))
          preset_activate_cp1_o <= 1'b0;

        if (s_preset_activate_cp2)
          preset_activate_cp2_o <= 1'b1;
        else if (s_bbgen_cluster_valid_fall || (r_timeout_cnt == 5'h1F))
          preset_activate_cp2_o <= 1'b0;

      end
    end

    pulp_sync_wedge i_socctrl_sync
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .en_i(1'b1),
        .serial_i(socctrl_valid_i),
        .serial_o(socctrl_ack_nodft),
        .r_edge_o(s_cfg_sample_nodft),
        .f_edge_o()
    );

    assign socctrl_ack_o = test_mode_i ? 1'b0 : socctrl_ack_nodft;
    assign s_cfg_sample  = test_mode_i ? 1'b0 : s_cfg_sample_nodft;

    pulp_sync_wedge i_wakeup_sync
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .en_i(1'b1),
        .serial_i(s_wakeup_signal),
        .serial_o(),
        .r_edge_o(s_wakeup_signal_re),
        .f_edge_o(s_wakeup_signal_fe)
    );

    pulp_sync_wedge i_bbgen1_ready_sync
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .en_i(1'b1),
        .serial_i(target_reached_cp1_i),
        .serial_o(s_bbgen_soc_valid_int),
        .r_edge_o(s_bbgen_soc_valid_rise_int),
        .f_edge_o(s_bbgen_soc_valid_fall_int)
    );

    pulp_sync_wedge i_bbgen2_ready_sync
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .en_i(1'b1),
        .serial_i(target_reached_cp2_i),
        .serial_o(s_bbgen_cluster_valid_int),
        .r_edge_o(s_bbgen_cluster_valid_rise_int),
        .f_edge_o(s_bbgen_cluster_valid_fall_int)
    );

assign s_bbgen_soc_valid      = jtag_bbgen_off_soc_i ? 1'b1 : s_bbgen_soc_valid_int;
assign s_bbgen_soc_valid_rise = jtag_bbgen_off_soc_i ? 1'b1 : s_bbgen_soc_valid_rise_int;
assign s_bbgen_soc_valid_fall = jtag_bbgen_off_soc_i ? 1'b1 : s_bbgen_soc_valid_fall_int;

assign s_bbgen_cluster_valid      = jtag_bbgen_off_cluster_i ? 1'b1 : s_bbgen_cluster_valid_int;
assign s_bbgen_cluster_valid_rise = jtag_bbgen_off_cluster_i ? 1'b1 : s_bbgen_cluster_valid_rise_int;
assign s_bbgen_cluster_valid_fall = jtag_bbgen_off_cluster_i ? 1'b1 : s_bbgen_cluster_valid_fall_int;

    counter 
    #(
        .CNT_WIDTH(8),
        .CNT_INIT(15)
    ) 
    busy_counter 
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .cfg_i(r_busy_cycle),
        .clear_i(s_cnt_busy_clear),
        .event_o(s_cnt_busy_event)
    );

    counter
    #(
        .CNT_WIDTH(8),
        .CNT_INIT(15)
    ) 
    rst_counter 
    (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .cfg_i(r_rst_cycle),
        .clear_i(s_cnt_rst_clear),
        .event_o(s_cnt_rst_event)
    );

    //chose one signal to reactivate cluster
    always_comb
    begin
        s_wakeup_signal = 1'b0;
        for (int i=0;i<32;i++)
            if(i == r_wakeup_select)
                s_wakeup_signal = padframe_gpio_i[i];
    end

    always_ff @(posedge clk_i, negedge rstn_i)
    begin
        if(rstn_i == 1'b0)
        begin
            r_bbgen_dat       <=  'h0;
            r_bbgen_dat_old   <=  'h0;
            r_busy_cycle      <=  'hF;
            r_rst_cycle       <=  'hF;
            r_power_down_req  <= 1'b0;
            r_cluster_rst_req <= 1'b0;
            r_wakeup_polarity <= 1'b1;
            r_wakeup_select   <=  'h0;
            state             <= RESET;
            r_req_type        <=  'h0;
            r_fetch_en        <= 1'b0;
            r_wait_for        <= `WAIT_FOR_NONE;
            r_is_reboot       <= 1'b0;
        end
        else
        begin
            state <= state_next;
            r_wait_for  <= s_wait_for_next;
            r_is_reboot <= s_is_reboot_next;
            r_req_type  <= s_req_type_next; 
            if (s_cfg_sample)
            begin
                r_bbgen_dat       <= socctrl_bbgen_dat_i;
                r_bbgen_dat_old   <= r_bbgen_dat;
                r_busy_cycle      <= socctrl_busy_cycle_i;
                r_rst_cycle       <= socctrl_rst_cycle_i;
                r_power_down_req  <= socctrl_power_down_req_i;
                r_cluster_rst_req <= socctrl_cluster_rst_req_i;
                r_wakeup_polarity <= socctrl_wakeup_polarity_i;
                r_wakeup_select   <= socctrl_wakeup_select_i;
            end
            if (s_set_fetch)
              r_fetch_en <= 1'b1;
            else if (s_clear_fetch)
              r_fetch_en <= 1'b0;
        end
    end

    always_ff @(posedge clk_i, negedge rstn_i)
    begin
        if(rstn_i == 1'b0)
        begin
            busy_sync            <= 1'b1;
            busy_sync0           <= 1'b1;
            r_wakeup_event_sync  <= 1'b0;
            r_wakeup_event_sync0 <= 1'b0;
        end
        else
        begin
            busy_sync0           <= cluster_busy_i;
            busy_sync            <= busy_sync0;
            r_wakeup_event_sync0 <= s_wakeup_event;
            r_wakeup_event_sync  <= r_wakeup_event_sync0;
            end
    end


    always_comb 
    begin
          state_next       = state;
          s_wait_for_next  = r_wait_for;
          s_is_reboot_next = r_is_reboot;
          padframe_power_down_o   = 1'b0;
          s_preset_activate_cp2   = 1'b0;
          s_preset_activate_cp1   = 1'b0;
          clkgen_cluster_rstn_o   = 1'b1;
          clkgen_soc_rstn_o       = 1'b1;
          s_req_type_next  = r_req_type;
          s_cnt_busy_clear = 1'b1;
          s_cnt_rst_clear  = 1'b1;
          s_clk_off        = 1'b0;
          clkgen_enable_cluster_clk_o = 1'b1;
          clkgen_enable_soc_clk_o     = 1'b1;
          socctrl_power_down_o        = 1'b0;
          s_set_fetch     = 1'b0;
          s_clear_fetch   = 1'b0;

          case(state)
          RESET:
          begin
              clkgen_enable_cluster_clk_o = 1'b0;
              clkgen_enable_soc_clk_o     = 1'b0;
              clkgen_cluster_rstn_o  = 1'b0;
              clkgen_soc_rstn_o      = 1'b0;

              if (s_bbgen_soc_valid && s_bbgen_cluster_valid)
              begin
                if (jtag_bbgen_bypass_i)
                begin
                  s_preset_activate_cp1 = 1'b1;
                  s_preset_activate_cp2 = 1'b1;
                  state_next = WAIT_BBGEN_FIRST;
                end
                else
                  state_next = IDLE;
              end
          end
          WAIT_BBGEN_FIRST:
          begin
              clkgen_enable_cluster_clk_o = 1'b0;
              clkgen_enable_soc_clk_o     = 1'b0;
              clkgen_cluster_rstn_o  = 1'b0;
              clkgen_soc_rstn_o      = 1'b0;
              if (s_bbgen_soc_valid_rise || s_bbgen_cluster_valid_rise)
              begin
                if (s_bbgen_soc_valid_rise && s_bbgen_cluster_valid_rise)
                  state_next = IDLE;
                else
                  state_next = WAIT_BBGEN_LAST;
              end
          end
          WAIT_BBGEN_LAST:
          begin
              clkgen_enable_cluster_clk_o = 1'b0;
              clkgen_enable_soc_clk_o     = 1'b0;
              clkgen_cluster_rstn_o  = 1'b0;
              clkgen_soc_rstn_o      = 1'b0;
              if (s_bbgen_soc_valid_rise || s_bbgen_cluster_valid_rise)
                  state_next = IDLE;
          end
          IDLE:
          begin
              s_is_reboot_next = 1'b0;
              if (s_cfg_sample && (socctrl_power_down_req_i || socctrl_cluster_rst_req_i))
                  state_next = WAIT_NO_BUSY;
                else if (s_cfg_sample && socctrl_bbgen_req_i) //when a change in VBB is requested activate the proper bbgen,turn off the clocks and go to wait
                begin
                    state_next = WAIT_BBGEN;
                    if (socctrl_bbgen_sel_i[1:0] == `SEL_SOC_CLUSTER)
                    begin
                        clkgen_enable_cluster_clk_o = 1'b0;
                        clkgen_enable_soc_clk_o     = 1'b0;
                        s_wait_for_next = `WAIT_FOR_NONE;
                        s_preset_activate_cp1       = 1'b1;
                        s_preset_activate_cp2       = 1'b1;
                    end
                    else if (socctrl_bbgen_sel_i[1:0] == `SEL_CLUSTER_ONLY)
                    begin
                        clkgen_enable_cluster_clk_o = 1'b0;
                        s_wait_for_next = `WAIT_FOR_CLUSTER;
                        s_preset_activate_cp2    = 1'b1;
                    end
                    else
                    begin
                        clkgen_enable_soc_clk_o     = 1'b0;
                        s_wait_for_next = `WAIT_FOR_SOC;
                        s_preset_activate_cp1    = 1'b1;
                    end
                end

              if (socctrl_power_down_req_i)
                  s_req_type_next = `REQ_POWER_DOWN;
              else if (socctrl_cluster_rst_req_i)
                  s_req_type_next = `REQ_SW_RST;
              else
                  s_req_type_next = `REQ_BBGEN;
          end //~ IDLE

          WAIT_BBGEN:
          begin

            if (socctrl_bbgen_sel_i[1:0] == `SEL_SOC_CLUSTER)
            begin
                clkgen_enable_cluster_clk_o = 1'b0;
                clkgen_enable_soc_clk_o     = 1'b0;
            end
            else if (socctrl_bbgen_sel_i[1:0] == `SEL_CLUSTER_ONLY)
                clkgen_enable_cluster_clk_o = 1'b0;
            else
                clkgen_enable_soc_clk_o     = 1'b0;

            if(s_bbgen_soc_valid_rise && s_bbgen_cluster_valid_rise)
            begin
                if (socctrl_bbgen_sel_i[2] && !r_is_reboot)
                  state_next = WAIT_BBGEN_EVENT; //if rbb wait for external event
                else
                  state_next = IDLE;             //else go back to idle
            end
            else if (s_bbgen_soc_valid_rise)
            begin
                if (r_wait_for == `WAIT_FOR_SOC) //if get a soc bbgen event and we were waiting for it go on
                begin
                  s_wait_for_next = `WAIT_FOR_NONE;
                  if (socctrl_bbgen_sel_i[2] && !r_is_reboot)
                    state_next = WAIT_BBGEN_EVENT; //if rbb wait for external event
                  else
                    state_next = IDLE;             //else go back to idle
                end
                else 
                  s_wait_for_next = `WAIT_FOR_CLUSTER;
            end
            else if (s_bbgen_cluster_valid_rise)
            begin
                if (r_wait_for == `WAIT_FOR_CLUSTER) //if get a soc bbgen event and we were waiting for it go on
                begin
                  s_wait_for_next = `WAIT_FOR_NONE;
                  if (socctrl_bbgen_sel_i[2] && !r_is_reboot)
                    state_next = WAIT_BBGEN_EVENT; //if rbb wait for external event
                  else
                    state_next = IDLE;             //else go back to idle
                end
                else 
                  s_wait_for_next = `WAIT_FOR_SOC;
            end
          end

          WAIT_BBGEN_EVENT:
          begin
            if (socctrl_bbgen_sel_i[1:0] == `SEL_SOC_CLUSTER)
            begin
                clkgen_enable_cluster_clk_o = 1'b0;
                clkgen_enable_soc_clk_o     = 1'b0;
            end
            else if (socctrl_bbgen_sel_i[1:0] == `SEL_CLUSTER_ONLY)
                clkgen_enable_cluster_clk_o = 1'b0;
            else
                clkgen_enable_soc_clk_o     = 1'b0;

              s_is_reboot_next = 1'b1;
              if (r_wakeup_event_sync)
              begin
                  state_next = WAIT_BBGEN;
                  if (socctrl_bbgen_sel_i[1:0] == `SEL_SOC_CLUSTER)
                  begin
                      s_wait_for_next = `WAIT_FOR_NONE;
                      s_preset_activate_cp1       = 1'b1;
                      s_preset_activate_cp2       = 1'b1;
                  end
                  else if (socctrl_bbgen_sel_i[1:0] == `SEL_CLUSTER_ONLY)
                  begin
                      s_wait_for_next = `WAIT_FOR_CLUSTER;
                      s_preset_activate_cp2    = 1'b1;
                  end
                  else
                  begin
                      s_wait_for_next = `WAIT_FOR_SOC;
                      s_preset_activate_cp1    = 1'b1;
                  end                  
              end
          end

          WAIT_NO_BUSY: 
          begin
              if (!busy_sync)
              s_cnt_busy_clear = 1'b0;

              if (s_cnt_busy_event)
              begin
                state_next = DISABLE_CLK;
              end
          end //~ WAIT_NO_BUSY

          DISABLE_CLK:
          begin
              clkgen_enable_cluster_clk_o = 1'b0;
              clkgen_enable_soc_clk_o     = 1'b0;
              if (r_req_type == `REQ_POWER_DOWN)
                  socctrl_power_down_o        = 1'b1;

              s_cnt_busy_clear = 1'b0;

              if (s_cnt_busy_event)
              begin
                  s_clear_fetch   = 1'b1;
                  if (r_req_type == `REQ_POWER_DOWN)
                      state_next = OFF;
                  else
                      state_next = CLUSTER_RST;
              end
          end

          OFF: 
          begin	
              clkgen_cluster_rstn_o  = 1'b0;
              padframe_power_down_o = 1'b1;
              clkgen_enable_cluster_clk_o = 1'b0;
              clkgen_enable_soc_clk_o     = 1'b0;
              socctrl_power_down_o        = 1'b1;
              s_clk_off    = 1'b1;
              if (r_wakeup_event_sync)
                  state_next = CLUSTER_RST;
          end //~ OFF

          CLUSTER_RST: 
          begin	  
              clkgen_enable_cluster_clk_o = 1'b0;
              clkgen_enable_soc_clk_o     = 1'b0;
              socctrl_power_down_o   = 1'b1;
              clkgen_cluster_rstn_o  = 1'b0;

              s_cnt_rst_clear = 1'b0;
              if (s_cnt_rst_event)
              begin
                  state_next = ENABLE_CLK;
              end
          end //~ CLUSTER_RST

          ENABLE_CLK:
          begin
              clkgen_cluster_rstn_o  = 1'b0;      //keep cluster rst
              socctrl_power_down_o   = 1'b0;      //release clamp
              clkgen_enable_cluster_clk_o = 1'b0; //enable clock
              clkgen_enable_soc_clk_o     = 1'b0; //

              s_cnt_busy_clear       = 1'b0;
              if (s_cnt_busy_event)
              begin
                  clkgen_cluster_rstn_o  = 1'b1;  //release cluster rst
                  state_next = FETCH_EN;
              end
          end

          FETCH_EN:
          begin
              s_set_fetch = 1'b1;
              state_next  = IDLE;
          end

          default : begin

          end //~default
          endcase
    end

    assign fetch_en_o = r_fetch_en;
endmodule

 
