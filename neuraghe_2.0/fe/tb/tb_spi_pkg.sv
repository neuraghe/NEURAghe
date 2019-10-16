
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
                  spi_csn  = 1'b0;
                  #100; 
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
                  #100 spi_csn  = 1'b1;
                  #`DELAY_BETWEEN_SPI;
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
                          for (int i = 8; i > 0; i--)
                          begin
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  data[4*i-1] = spi_sdi3 ;
                                  data[4*i-2] = spi_sdi2 ;
                                  data[4*i-3] = spi_sdi1 ;
                                  data[4*i-4] = spi_sdi0 ;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                          for (int i = 8; i > 0; i--)
                          begin
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  data[32+4*i-1] = spi_sdi3 ;
                                  data[32+4*i-2] = spi_sdi2 ;
                                  data[32+4*i-3] = spi_sdi1 ;
                                  data[32+4*i-4] = spi_sdi0 ;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                  end
                  else
                  begin
                          for (int i = 31; i >= 0; i--)
                          begin
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  data[i] = spi_sdi0 ;
                                  #`SPI_SEMIPERIOD spi_sck = 0;
                          end
                          for (int i = 31; i >= 0; i--)
                          begin
                                  #`SPI_SEMIPERIOD spi_sck = 1;
                                  data[32+i] = spi_sdi0 ;
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

  task spi_write_word;
          input          use_qspi;
          input   [31:0] addr;
          input   [63:0] data;
          begin
              spi_csn  = 1'b0;
              #100  spi_send_cmd_addr(use_qspi,8'h2,addr);
              spi_send_data(use_qspi,data);
              #100 spi_csn  = 1'b1;
              #`DELAY_BETWEEN_SPI;
          end
  endtask : spi_write_word

  task spi_load_L2;
                  spi_addr        = stimuli[num_stim][95:64]; // assign address
                  spi_data        = stimuli[num_stim][63:0];  // assign data

                  $display("[SPI] Loading L2 in QPI mode");
                  spi_csn  = 1'b0;
                  #100  spi_send_cmd_addr(1,8'h2,spi_addr);

                  spi_addr_old = spi_addr - 32'h8;

                  while (more_stim)                        // loop until we have no more stimuli)
                  begin
                          spi_addr        = stimuli[num_stim][95:64]; // assign address
                          spi_data        = stimuli[num_stim][63:0];  // assign data

                          if (spi_addr != (spi_addr_old + 32'h8))
                          begin
                                  $display("[SPI] Prev address %h current addr %h",spi_addr_old,spi_addr);
                                  #100 spi_csn  = 1'b1;
                                  #`DELAY_BETWEEN_SPI;
                                  spi_csn  = 1'b0;
                                  #100  spi_send_cmd_addr(1,8'h2,spi_addr);
                          end
                          spi_send_data(1,spi_data[31:0]);
                          spi_send_data(1,spi_data[63:32]);

                          num_stim     = num_stim + 1;             // increment stimuli
                          spi_addr_old = spi_addr;
                          if (num_stim > 9999 | stimuli[num_stim]===96'bx ) // make sure we have more stimuli
                                  more_stim = 0;                    // if not set variable to 0, will prevent additional stimuli to be applied
                  end                                   // end while loop
                  #100 spi_csn  = 1'b1;
                  #`DELAY_BETWEEN_SPI;

  endtask


  task spi_get_results;
          integer iofile;
          iofile = $fopen("core_state", "w");

          spi_write_reg(1,8'h20,8'h2);

          for(int index=0; index<NB_CORES; index++)
          begin
            spi_read_dword(1, 8'hB, 32'h10001000 + index*8, 8'h20, data_rd);
            $display("[SPI] Received status core %d: 0x%h",index, data_rd);
            $fwrite(iofile, "%d\t0x%h\n", index, data_rd);
          end
          // spi_read_dword(1,8'hB,32'h10001008,8'h20,data_rd);
          // $display("[SPI] Received status core 1: 0x%h",data_rd);
          // $fwrite(iofile, "1\t0x%h\n", data_rd);

          // spi_read_dword(1,8'hB,32'h10001010,8'h20,data_rd);
          // $display("[SPI] Received status core 2: 0x%h",data_rd);
          // $fwrite(iofile, "2\t0x%h\n", data_rd);

          // spi_read_dword(1,8'hB,32'h10001018,8'h20,data_rd);
          // $display("[SPI] Received status core 3: 0x%h",data_rd);
          // $fwrite(iofile, "3\t0x%h\n", data_rd);

          // clear QPI mode
          spi_csn  = 1'b0;
          #100  spi_write_reg(1,8'h1,8'h0);
          #100 spi_csn  = 1'b1;
          #`DELAY_BETWEEN_SPI;

          $fclose(iofile);
  endtask : spi_get_results

  task jtag_load_L2;
          spi_addr        = stimuli[num_stim][95:64]; // assign address
          jtag_data[0]    = stimuli[num_stim][63:0];  // assign data

          $display("[JTAG] Loading L2 with jtag interface");
          adv_dbg_if_soc.init();

          spi_addr_old = spi_addr - 32'h8;

          while (more_stim)                        // loop until we have no more stimuli)
          begin
            jtag_burst_len = 0;
            jtag_addr = stimuli[num_stim][95:64];

            for (int i=0;i<256;i++)
            begin
              spi_addr        = stimuli[num_stim][95:64]; // assign address
              jtag_data[i]    = stimuli[num_stim][63:0];  // assign data

              if (spi_addr != (spi_addr_old + 32'h8))
              begin
                spi_addr_old = spi_addr - 32'h8;
                break;
              end
              else
              begin
                jtag_burst_len = i + 1;
                num_stim     = num_stim + 1;             // increment stimuli
              end
              if (num_stim > 9999 | stimuli[num_stim]===96'bx ) // make sure we have more stimuli
              begin
                more_stim = 0;                    // if not set variable to 0, will prevent additional stimuli to be applied
                break;
              end
              spi_addr_old = spi_addr;
            end
            adv_dbg_if_soc.axi4_write64(jtag_addr,jtag_burst_len,jtag_data);
          end                                   // end while loop
  endtask : jtag_load_L2
