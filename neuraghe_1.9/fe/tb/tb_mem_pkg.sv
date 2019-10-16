
  task mem_preload;
    begin
`ifndef USE_TOP_NETLIST
      $display("Preloading L2 memory");
      #10;
      l2_preload();
`ifndef USE_CLUSTER_NETLIST
      $display("Preloading TCDM memory");
      tcdm_preload();
`endif
`endif
    end
  endtask

  //////////////////////////////////////////////////////////////////////////////
  // L2 Memory
  //////////////////////////////////////////////////////////////////////////////

  logic [31:0]     l2_mem[]; // this variable holds the whole memory content
  event            event_l2_load;

  task l2_preload;
    begin
      $display("[TB] L2 Memory Preloading...");

      l2_mem = new [tb.i_dut.ulpsoc_i.l2_ram_i.NB_BANKS * tb.i_dut.ulpsoc_i.l2_ram_i.BANK_SIZE * 2];

      $readmemh("slm_files/l2_stim.slm", l2_mem);

      -> event_l2_load;
    end
  endtask

  generate
    genvar l2_index;
    for(l2_index = 0; l2_index < tb.i_dut.ulpsoc_i.l2_ram_i.NB_BANKS; l2_index++)
    begin : l2_preload_gen
      initial
      begin
        integer addr;
        integer bank_size;

        bank_size = tb.i_dut.ulpsoc_i.l2_ram_i.BANK_SIZE;

        @ (event_l2_load);

        for(addr = 0; addr < bank_size; addr++) begin
          tb.i_dut.ulpsoc_i.l2_ram_i.banks_gen[l2_index].bank_gen.bank_i.cut_lo.Mem[addr][31:0] = l2_mem[(l2_index * bank_size * 2) + addr * 2];
          tb.i_dut.ulpsoc_i.l2_ram_i.banks_gen[l2_index].bank_gen.bank_i.cut_hi.Mem[addr][31:0] = l2_mem[(l2_index * bank_size * 2) + addr * 2 + 1];
        end

        $display("[TB] L2 Memory Preload Done for bank %d", l2_index);
      end
    end
  endgenerate


  //////////////////////////////////////////////////////////////////////////////
  // TCDM Memory
  //////////////////////////////////////////////////////////////////////////////

  logic [31:0]     tcdm_mem[]; // this variable holds the whole memory content
  event            event_tcdm_load;

  task tcdm_preload;
    begin
      $display("[TB] TCDM Memory Preloading...");

      tcdm_mem = new [tb.i_dut.ulpsoc_i.cluster_i.NB_TCDM_BANKS * tb.i_dut.ulpsoc_i.cluster_i.TCDM_BANK_SRAM_SIZE];

      $readmemh("slm_files/tcdm.slm", tcdm_mem);

      -> event_tcdm_load;
    end
  endtask

  generate
    genvar tcdm_index;
    for(tcdm_index = 0; tcdm_index < tb.i_dut.ulpsoc_i.cluster_i.NB_TCDM_BANKS; tcdm_index++)
    begin : tcdm_preload_gen
      initial
      begin
        integer addr;
        integer bank_size;
        integer n_banks;

        bank_size = tb.i_dut.ulpsoc_i.cluster_i.TCDM_BANK_SRAM_SIZE;
        n_banks   = tb.i_dut.ulpsoc_i.cluster_i.NB_TCDM_BANKS;

        @ (event_tcdm_load);

        for(addr = 0; addr < bank_size/2; addr++) begin
          tb.i_dut.ulpsoc_i.cluster_i.tcdm_sram_island.banks_gen[tcdm_index].sram_bank_gen.bank_gen.tcdm_bank_i.cut0.Mem[addr] = tcdm_mem[(addr +    0) * n_banks + tcdm_index];
          tb.i_dut.ulpsoc_i.cluster_i.tcdm_sram_island.banks_gen[tcdm_index].sram_bank_gen.bank_gen.tcdm_bank_i.cut1.Mem[addr] = tcdm_mem[(addr + 1024) * n_banks + tcdm_index];
        end

        $display("[TB] TCDM Memory Preload Done for bank %d", tcdm_index);
      end
    end
  endgenerate
