//`timescale 1ns/1ps

`define SPI_STD     2'b00
`define SPI_QUAD_TX 2'b01
`define SPI_QUAD_RX 2'b10

`define SPI_SEMIPERIOD      12500 // 40Mhz
`define REF_CLK_SEMIPERIOD  5000  //100Mhz

`define DELAY_BETWEEN_SPI   100000

`define TEST_RUN_SW 1
`define TEST_LOAD_L2_SPI 1


module tb_spi_regression #(parameter test_name = "test_generic");

  localparam NB_CORES = 4;

  logic s_rst_n;
  logic s_clk_ref;
  logic s_start;
  logic s_done;

  integer IOFILE;

  tri sspi_sio0;
  tri sspi_sio1;
  tri sspi_sio2;
  tri sspi_sio3;
  tri sspi_csn;
  tri sspi_sck;

  tri spi_master_sdio0;
  tri spi_master_sdio1;
  tri spi_master_sdio2;
  tri spi_master_sdio3;
  tri spi_master_csn0;
  tri spi_master_csn1;
  tri spi_master_csn3;
  tri spi_master_sck;

  tri s_i2c_scl;
  tri s_i2c_sda;

  string FILE_NAME;

  logic [1:0] padmode_spi_master;
  logic spi_csn;
  logic spi_sck;
  logic spi_sdi0;
  logic spi_sdi1;
  logic spi_sdi2;
  logic spi_sdi3;
  logic spi_sdo0;
  logic spi_sdo1;
  logic spi_sdo2;
  logic spi_sdo3;

  logic [31:0] mem_cut0_lo [1023:0];
  logic [31:0] mem_cut0_hi [1023:0];
  logic [31:0] mem_cut1_lo [1023:0];
  logic [31:0] mem_cut1_hi [1023:0];

  logic [63:0] data_rd;

  tri uart_rx;
  logic uart_rx_en;
  logic uart_rx_done;

  logic [95:0] stimuli  [10000:0];                // array for the stimulus vectors
  logic [95:0] expected [10000:0];                // array for the expected vectors
  int 		num_stim,num_exp,num_cycles,num_err = 0;   // counters for statistics

  logic       more_stim = 1;

  logic [63:0] spi_data;
  logic [31:0] spi_addr;
  logic [31:0] spi_addr_old;

  wire                 s_eoc;
  wire                 wire_rst_n;
  wire                 wire_clk_ref;
  wire                 wire_clk_ref_1;
  wire                 wire_mode_select;

  assign wire_rst_n   = s_rst_n;
  assign wire_clk_ref = s_clk_ref;
  assign wire_clk_ref_1 = 1'b0;
  assign wire_mode_select = 1'b0;

  assign s_tms = 1'b0;
  assign s_tck = 1'b0;
  assign s_tdi = 1'b0;
  assign s_trstn = 1'b0;

  //-------------------------------------------------------------------------------------------------------//
  //TRACING
  //-------------------------------------------------------------------------------------------------------//
  genvar                i;
  integer               IOFILE_TRACE[NB_CORES];
  string                FILENAME[NB_CORES];
  string                FILE_ID;
  int unsigned          index, j;

  logic                 is_Read[NB_CORES];

  initial
  begin
      for(index = 0; index < NB_CORES; index++)
      begin : _CREATE_IO_FILES_
          FILE_ID.itoa(index);
          FILENAME[index]       = { "TRACE/CORE_", FILE_ID, ".txt" };
          IOFILE_TRACE[index]   = $fopen(FILENAME[index],"w");
          is_Read[index]        = 0;
      end
   end

   generate
      for(i = 0; i < NB_CORES; i++)
      begin
                  always @(posedge tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.clk_i)
                  begin
                    if(is_Read[i])
                    begin
                            $fdisplay( IOFILE_TRACE[index] , "Read Data is %x" , tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.r_rdata );
                    end

                    if(tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.req & tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.gnt)
                    begin
                        if(tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.wen)
                        begin
                          $fdisplay( IOFILE_TRACE[index] , "Reading at address %x" , {tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.add[14:2],2'b00});
                          is_Read[i] <= 1'b1;
                        end
                        else
                        begin
                          $fdisplay( IOFILE_TRACE[index] , "Writing at address %x \t data=%x, benable = %x" , {tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.add[14:2],2'b00}, tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.wdata , tb_spi_regression.i_dut.ulpsoc_i.cluster_i.CORE[i].core_region_i.tcdm_data_master.be );
                          is_Read[i] <= 1'b0;
                        end
                    end
                    else
                    begin
                      is_Read[i] <= 1'b0;
                    end

                  end
      end
   endgenerate
  //-------------------------------------------------------------------------------------------------------//
  // End Tracing
  //-------------------------------------------------------------------------------------------------------//

  spi_master_padframe i_padframe
  (
                  .padmode_spi_master(padmode_spi_master),
                  .spi_master_csn (spi_csn),
                  .spi_master_sck (spi_sck),
                  .spi_master_sdi0(spi_sdi0),
                  .spi_master_sdi1(spi_sdi1),
                  .spi_master_sdi2(spi_sdi2),
                  .spi_master_sdi3(spi_sdi3),
                  .spi_master_sdo0(spi_sdo0),
                  .spi_master_sdo1(spi_sdo1),
                  .spi_master_sdo2(spi_sdo2),
                  .spi_master_sdo3(spi_sdo3),

                  .MSPI_SIO0_PAD(MSPI_SIO0_PAD),
                  .MSPI_SIO1_PAD(MSPI_SIO1_PAD),
                  .MSPI_SIO2_PAD(MSPI_SIO2_PAD),
                  .MSPI_SIO3_PAD(MSPI_SIO3_PAD),
                  .MSPI_CSN_PAD(MSPI_CSN_PAD),
                  .MSPI_SCK_PAD(MSPI_SCK_PAD)
  );
  // spansion spi flash
  s25fs256s i_spi_flash_csn0
  (
                  .SI(spi_master_sdio0),
                  .SO(spi_master_sdio1),
                  .SCK(spi_master_sck),
                  .CSNeg(spi_master_csn0),
                  .WPNeg(spi_master_sdio2),
                  .RESETNeg(spi_master_sdio3)
  );
  // fake spi flash
  spi_slave i_spi_flash_csn1
  (
                  .rstn(s_rst_n),
                  .SSPI_SIO0_PAD(spi_master_sdio0),
                  .SSPI_SIO1_PAD(spi_master_sdio1),
                  .SSPI_SIO2_PAD(spi_master_sdio2),
                  .SSPI_SIO3_PAD(spi_master_sdio3),
                  .SSPI_CSN_PAD(spi_master_csn1),
                  .SSPI_SCK_PAD(spi_master_sck)
  );

    M24FC1025 i_i2c_mem_0 (
            .A0(1'b0),
            .A1(1'b0),
            .A2(1'b1),
            .WP(1'b1),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .RESET(1'b0));

    M24FC1025 i_i2c_mem_1 (
            .A0(1'b1),
            .A1(1'b0),
            .A2(1'b1),
            .WP(1'b1),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .RESET(1'b0));

    M24FC1025 i_i2c_mem_2 (
            .A0(1'b0),
            .A1(1'b1),
            .A2(1'b1),
            .WP(1'b1),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .RESET(1'b0));

    M24FC1025 i_i2c_mem_3 (
            .A0(1'b1),
            .A1(1'b1),
            .A2(1'b1),
            .WP(1'b1),
            .SDA(s_i2c_sda),
            .SCL(s_i2c_scl),
            .RESET(1'b0));

        pulp_chip i_dut
        (
            .pad_sspi_sio0(MSPI_SIO0_PAD),
            .pad_sspi_sio1(MSPI_SIO1_PAD),
            .pad_sspi_sio2(MSPI_SIO2_PAD),
            .pad_sspi_sio3(MSPI_SIO3_PAD),
            .pad_sspi_csn(MSPI_CSN_PAD),
            .pad_sspi_sck(MSPI_SCK_PAD),
            .pad_mspi_sio0(spi_master_sdio0),
            .pad_mspi_sio1(spi_master_sdio1),
            .pad_mspi_sio2(spi_master_sdio2),
            .pad_mspi_sio3(spi_master_sdio3),
            .pad_mspi_csn0(spi_master_csn0),
            .pad_mspi_csn1(spi_master_csn1),
            .pad_mspi_csn2(spi_master_csn2),
            .pad_mspi_csn3(spi_master_csn3),
            .pad_mspi_sck(spi_master_sck),
            .pad_uart_tx(uart_rx),
            .pad_uart_rx(),
            .pad_uart_cts(),
            .pad_uart_rts(),
            .pad_i2c_sda(s_i2c_sda),
            .pad_i2c_scl(s_i2c_scl),
            .pad_audio_i2s_ws(),
            .pad_audio_i2s_sck(),
            .pad_audio_i2s_sdi0(),
            .pad_audio_i2s_sdi1(),
            .pad_audio_i2s_sdi2(),
            .pad_audio_i2s_sdi3(),
            .pad_audio_i2s_sdi4(),
            .pad_audio_i2s_sdi5(),
            .pad_audio_i2s_sdi6(),
            .pad_audio_i2s_sdi7(),
            .pad_cam_i2s_sck(),
            .pad_cam_i2s_ws(),
            .pad_cam_i2s_sdi0(),
            .pad_cam_i2s_sdi1(),
            .pad_power_down(s_eoc),
            .pad_jtag_tdi(s_tdi),
            .pad_jtag_tdo(s_tdo),
            .pad_jtag_tms(s_tms),
            .pad_jtag_trst(s_trstn),
            .pad_jtag_tck(s_tck),
            .pad_reset_n(wire_rst_n),
            .pad_ref_clk_0(wire_clk_ref),
            .pad_ref_clk_1(wire_clk_ref_1),
            .pad_mode_select(wire_mode_select)

        );

        uart_tb_rx
        #(
            .BAUD_RATE(1000000),
            .PARITY_EN(0)
        )
        rx_mod_i
        (
            .rx(uart_rx),
            .rx_en(uart_rx_en),
            .word_done(uart_rx_done)
        );

        initial
        begin
            FILE_NAME = { "spi_regression/LOGS/",test_name,".txt" };
            IOFILE = $fopen(FILE_NAME, "w"); // opening the file
            //IOFILE = $fopen("spi_regression/LOGS/regression_test_status.txt", "a+"); // opening the file
            $fdisplay(IOFILE, "\n\n\n\n\n\n\n\n//-------------------------------------------------------------------//");
            $fdisplay(IOFILE,                 "//---------------------TEST %s ----------------------------------//\n\n\n", test_name);
        end



        initial
        begin
                s_clk_ref = 1'b1;
                forever s_clk_ref = #(`REF_CLK_SEMIPERIOD) ~s_clk_ref; // 40Mhz clock
        end

        initial
        begin
		s_rst_n <= 1'b0;

		$readmemh("../sim/vectors/stim.txt", stimuli);  // read in the stimuli vectors  == address_value
		$readmemh("../sim/vectors/exp.txt", expected);  // read in the expected vectors == address_valuesim:/tb

		padmode_spi_master = `SPI_STD;
		spi_csn  = 1'b1;
		spi_sck  = 1'b0;
		spi_sdo0 = 1'b0;
		spi_sdo1 = 1'b0;
		spi_sdo2 = 1'b0;
		spi_sdo3 = 1'b0;

		#1000000; // 1uS reset pulse

		s_rst_n <= 1'b1;

		//#500000000; // after 500us start loading L2
		#5000000;   // after 5us start loading L2



		`ifdef TEST_RUN_SW
		//Sets QPI mode
		spi_csn  = 1'b0;
		#100  spi_write_reg(0,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		padmode_spi_master = `SPI_QUAD_TX;


    `ifdef TEST_LOAD_L2_SPI
		spi_addr        = stimuli[num_stim][95:64]; // assign address
		spi_data        = stimuli[num_stim][63:0];  // assign data

		$fdisplay(IOFILE, "Loading L2 in QPI mode");
		spi_csn  = 1'b0;
		#100  spi_send_cmd_addr(1,8'h2,spi_addr);

		spi_addr_old = spi_addr - 32'h8;

		while (more_stim)                        // loop until we have no more stimuli)
		begin
			spi_addr        = stimuli[num_stim][95:64]; // assign address
			spi_data        = stimuli[num_stim][63:0];  // assign data

			if (spi_addr != (spi_addr_old + 32'h8))
			begin
				$fdisplay(IOFILE, "Prev address %h current addr %h",spi_addr_old,spi_addr);
				#100 spi_csn  = 1'b1;
				#`DELAY_BETWEEN_SPI;
				spi_csn  = 1'b0;
				#100  spi_send_cmd_addr(1,8'h2,spi_addr);
			end
			spi_send_data(1,spi_data[63:32]);
			spi_send_data(1,spi_data[31:0]);

			num_stim     = num_stim + 1;             // increment stimuli
			spi_addr_old = spi_addr;
			if (num_stim > 9999 | stimuli[num_stim]===96'bx ) // make sure we have more stimuli
				more_stim = 0;                    // if not set variable to 0, will prevent additional stimuli to be applied
		end                                   // end while loop
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;
    `endif


		$fdisplay(IOFILE, "Triggering fetch enable");
		spi_csn  = 1'b0;
		#100  spi_send_cmd_addr(1,8'h2,32'h10200008); //select EOC unit
		spi_send_data(1,32'h0);
		spi_send_data(1,32'hF); // trigger fetch_enable
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		uart_rx_en = 1'b1; // enable uart rx in testbench





		$fdisplay(IOFILE, "Waiting for eoc");
		wait(s_eoc); //waits for eoc
		uart_rx_en = 1'b0; // disable uart rx in testbench

		spi_read_dword(1,8'hB,32'h10001000,8'h20,data_rd);
		$fdisplay(IOFILE, "Received status core0: 0x%h",data_rd);

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		spi_read_dword(1,8'hB,32'h10001008,8'h20,data_rd);
		$fdisplay(IOFILE, "Received status core1: 0x%h",data_rd);

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		spi_read_dword(1,8'hB,32'h10001010,8'h20,data_rd);
		$fdisplay(IOFILE, "Received status core2: 0x%h",data_rd);

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		spi_read_dword(1,8'hB,32'h10001018,8'h20,data_rd);
		$fdisplay(IOFILE, "Received status core3: 0x%h",data_rd);

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		//Dummy write to avoid spi_slave bug
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h1);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		//Clears QPI mode
		spi_csn  = 1'b0;
		#100  spi_write_reg(1,8'h1,8'h0);
		#100 spi_csn  = 1'b1;
		#`DELAY_BETWEEN_SPI;

		`endif

    // finish here because the SPI master was changed...
    $finish;
	end

	task spi_send_cmd_addr;
		input          use_qspi;
		input    [7:0] command;
		input   [31:0] addr;
		begin
			if (use_qspi)
			begin
				for (int i = 2; i > 0; i--)
				begin
					spi_sdo3 = command[4*i-1];
					spi_sdo2 = command[4*i-2];
					spi_sdo1 = command[4*i-3];
					spi_sdo0 = command[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 7; i >= 0; i--)
				begin
					spi_sdo0 = command[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end

			if (use_qspi)
			begin
				for (int i = 8; i > 0; i--)
				begin
					spi_sdo3 = addr[4*i-1];
					spi_sdo2 = addr[4*i-2];
					spi_sdo1 = addr[4*i-3];
					spi_sdo0 = addr[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 31; i >= 0; i--)
				begin
					spi_sdo0 = addr[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
		end
	endtask

	task spi_write_reg;
		input          use_qspi;
		input    [7:0] command;
		input    [7:0] reg_val;
		begin
			if (use_qspi)
			begin
				for (int i = 2; i > 0; i--)
				begin
					spi_sdo3 = command[4*i-1];
					spi_sdo2 = command[4*i-2];
					spi_sdo1 = command[4*i-3];
					spi_sdo0 = command[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 7; i >= 0; i--)
				begin
					spi_sdo0 = command[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end

			if (use_qspi)
			begin
				for (int i = 2; i > 0; i--)
				begin
					spi_sdo3 = reg_val[4*i-1];
					spi_sdo2 = reg_val[4*i-2];
					spi_sdo1 = reg_val[4*i-3];
					spi_sdo0 = reg_val[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 7; i >= 0; i--)
				begin
					spi_sdo0 = reg_val[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
		end
	endtask

	task spi_send_data;
		input          use_qspi;
		input   [31:0] data;
		begin
			if (use_qspi)
			begin
				for (int i = 8; i > 0; i--)
				begin
					spi_sdo3 = data[4*i-1];
					spi_sdo2 = data[4*i-2];
					spi_sdo1 = data[4*i-3];
					spi_sdo0 = data[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 31; i >= 0; i--)
				begin
					spi_sdo0 = data[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
		end
	endtask

	task send_data_to_L2;
		input          use_qspi;
		begin
			spi_csn  = 1'b0;
			#100  spi_send_cmd_addr(use_qspi,8'h2,32'h1C000000);
			for (int i=0; i<1024; i++)
			begin
				spi_send_data(use_qspi,mem_cut0_hi[i]);
				spi_send_data(use_qspi,mem_cut0_lo[i]);
				$fdisplay(IOFILE, "Sent word %d",i);
			end
			/*
		for (int i=0; i<1024; i++)
		begin
			spi_send_data(0,mem_cut1_hi[i]);
			spi_send_data(0,mem_cut1_lo[i]);
		end
			 */
			#100 spi_csn  = 1'b1;
		end
	endtask

	task fill_L2;
		input          use_qspi;
		input  integer num;
		begin
			spi_csn  = 1'b0;
			padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;
			#100  spi_send_cmd_addr(use_qspi,8'h2,32'h1C000000);
			for (int i=0; i<num; i++)
			begin
				spi_send_data(use_qspi,i);
				spi_send_data(use_qspi,i);
			end
			#100 spi_csn  = 1'b1;
			#`DELAY_BETWEEN_SPI;
		end
	endtask

	task read_L2;
		input          use_qspi;
		begin
			spi_csn  = 1'b0;
			#100  spi_send_cmd_addr(use_qspi,8'h2,32'h1C000000);
			for (int i=0; i<1024; i++)
			begin
				spi_send_data(use_qspi,i);
				spi_send_data(use_qspi,i);
				$fdisplay(IOFILE, "Sent word %d",i);
			end
			/*
		for (int i=0; i<1024; i++)
		begin
			spi_send_data(0,mem_cut1_hi[i]);
			spi_send_data(0,mem_cut1_lo[i]);
		end
			 */
			#100 spi_csn  = 1'b1;
		end
	endtask

	task spi_read_word;
		input    [7:0] command;
		input   [31:0] addr;
		input    [7:0] dummy_cycles;
		output  [31:0] data;
		begin
			spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			spi_csn = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			for (int i = 7; i >= 0; i--)
			begin
				spi_sdo0 = command[i];
				#`SPI_SEMIPERIOD spi_sck = 1;
				#`SPI_SEMIPERIOD spi_sck = 0;
			end
			for (int i = 31; i >= 0; i--)
			begin
				spi_sdo0 = addr[i];

				#`SPI_SEMIPERIOD spi_sck = 1;
				#`SPI_SEMIPERIOD spi_sck = 0;
			end
			for (int i = dummy_cycles; i >= 0; i--)
			begin
				#`SPI_SEMIPERIOD spi_sck = 1;
				#`SPI_SEMIPERIOD spi_sck = 0;
			end
			for (int i = 31; i >= 0; i--)
			begin
				#`SPI_SEMIPERIOD spi_sck = 1;
				data[i] = spi_sdi0 ;
				//$display("Get %h",spi_sdo0);
				#`SPI_SEMIPERIOD spi_sck = 0;
			end
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			spi_csn   = 1;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
		end
	endtask

	task spi_read_dword;
		input          use_qspi;
		input    [7:0] command;
		input   [31:0] addr;
		input    [7:0] dummy_cycles;
		output  [63:0] data;
		begin
			padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;
			spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			spi_csn = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			if (use_qspi)
			begin
				for (int i = 2; i > 0; i--)
				begin
					spi_sdo3 = command[4*i-1];
					spi_sdo2 = command[4*i-2];
					spi_sdo1 = command[4*i-3];
					spi_sdo0 = command[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 7; i >= 0; i--)
				begin
					spi_sdo0 = command[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			if (use_qspi)
			begin
				for (int i = 8; i > 0; i--)
				begin
					spi_sdo3 = addr[4*i-1];
					spi_sdo2 = addr[4*i-2];
					spi_sdo1 = addr[4*i-3];
					spi_sdo0 = addr[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 31; i >= 0; i--)
				begin
					spi_sdo0 = addr[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			padmode_spi_master = use_qspi ? `SPI_QUAD_RX : `SPI_STD;
			for (int i = 32; i >= 0; i--)
			begin
				#`SPI_SEMIPERIOD spi_sck = 1;
				#`SPI_SEMIPERIOD spi_sck = 0;
			end
			if (use_qspi)
			begin
				for (int i = 16; i > 0; i--)
				begin
					#`SPI_SEMIPERIOD spi_sck = 1;
					data[4*i-1] = spi_sdi3 ;
					data[4*i-2] = spi_sdi2 ;
					data[4*i-3] = spi_sdi1 ;
					data[4*i-4] = spi_sdi0 ;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 63; i >= 0; i--)
				begin
					#`SPI_SEMIPERIOD spi_sck = 1;
					data[i] = spi_sdi0 ;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			spi_csn   = 1;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;
		end
	endtask

		task spi_read_mem;
			input	use_qspi;
		input   [31:0] addr;
		input   integer dwordnum;
		logic  [63:0] data;
		logic   [7:0] command;
		begin
			spi_sck = 0;
			command = 8'hB;
			padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			spi_csn = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			if (use_qspi)
			begin
				for (int i = 2; i > 0; i--)
				begin
					spi_sdo3 = command[4*i-1];
					spi_sdo2 = command[4*i-2];
					spi_sdo1 = command[4*i-3];
					spi_sdo0 = command[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 7; i >= 0; i--)
				begin
					spi_sdo0 = command[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			if (use_qspi)
			begin
				for (int i = 8; i > 0; i--)
				begin
					spi_sdo3 = addr[4*i-1];
					spi_sdo2 = addr[4*i-2];
					spi_sdo1 = addr[4*i-3];
					spi_sdo0 = addr[4*i-4];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			else
			begin
				for (int i = 31; i >= 0; i--)
				begin
					spi_sdo0 = addr[i];
					#`SPI_SEMIPERIOD spi_sck = 1;
					#`SPI_SEMIPERIOD spi_sck = 0;
				end
			end
			padmode_spi_master = use_qspi ? `SPI_QUAD_RX : `SPI_STD;
			for (int i = 32; i >= 0; i--)
			begin
				#`SPI_SEMIPERIOD spi_sck = 1;
				#`SPI_SEMIPERIOD spi_sck = 0;
			end
			for (int j = dwordnum; j>=0; j--)
			begin
				if (use_qspi)
				begin
					for (int i = 16; i > 0; i--)
					begin
						#`SPI_SEMIPERIOD spi_sck = 1;
						data[4*i-1] = spi_sdi3 ;
						data[4*i-2] = spi_sdi2 ;
						data[4*i-3] = spi_sdi1 ;
						data[4*i-4] = spi_sdi0 ;
						#`SPI_SEMIPERIOD spi_sck = 0;
					end
				end
				else
				begin
					for (int i = 63; i >= 0; i--)
					begin
						#`SPI_SEMIPERIOD spi_sck = 1;
						data[i] = spi_sdi0 ;
						#`SPI_SEMIPERIOD spi_sck = 0;
					end
				end
				$fdisplay(IOFILE, "Received %h",data);
			end
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			spi_csn   = 1;
			#`SPI_SEMIPERIOD spi_sck = 0;
			#`SPI_SEMIPERIOD spi_sck = 0;
			padmode_spi_master = use_qspi ? `SPI_QUAD_TX : `SPI_STD;

		end
	endtask
endmodule
