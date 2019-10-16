set TCDM_SIZE        0x8000
set TCDM_BASE        0x10000000
set N_TCDM_ISLANDS   4

set L2_SIZE          0x8000
set L2_BASE          0x1C000000
set N_L2_CUTS        4
set L2_CUT_SIZE      2048

#set tb  "tb_spi/i_dut/"
set tb  "tb/ulpsoc_wrap_i"
#set tb  "tb_jtag"

proc mem_read {addr} {
  global TCDM_SIZE
  global TCDM_BASE
  global L2_SIZE
  global L2_BASE

  if { $addr % 4 != 0 } {
    echo "Address is not byte aligned!"
  }

  if { $addr >= $TCDM_BASE && $addr < ($TCDM_BASE + $TCDM_SIZE) } {
    tcdm_read [expr ($addr - $TCDM_BASE)]
  } elseif { $addr >= $L2_BASE && $addr < ($L2_BASE + $L2_SIZE) } {
    l2_read   [expr ($addr - $L2_BASE)]
  } else {
    echo "This address range is not supported"
  }
}

proc tcdm_read {addr} {
  global tb
  global N_TCDM_ISLANDS
  global TCDM_SIZE

  # address: [1:0] 2 bits are byte address
  #          [2:2] are bank
  #          [4:3] are island
  #          [?:5] are address in island
 
  set bank      [expr ($addr / 4) % 2]
  set island    [expr ($addr / 4 / 2) % $N_TCDM_ISLANDS]
  set bank_addr [expr ($addr / 4 / 2 /  $N_TCDM_ISLANDS)]

  examine -radix hex "{sim:$tb/ulpsoc_i/cluster_i/tcdm_sram_island_$island/BANK\[$bank\]/tcdm_bank_i/cut/Mem\[$bank_addr\]}"
}

proc l2_read {addr} {
  global tb
  global N_L2_CUTS
  global L2_CUT_SIZE

  set addr      [expr ($addr >> 3)]

  set cut       [expr (($addr >> 11) & 0x3) ]
  set cut_addr  [expr ( ($addr & 0x7FF) % $L2_CUT_SIZE)]

  

  echo $addr
  echo $cut
  echo $cut_addr
  echo "L2 readout does not yet work correctly!"

  if { ($addr % 2) == 0 } {
    examine -radix hex "{sim:$tb/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[$cut\]/cut_lo/Mem\[$cut_addr\]}"
  } else {
    examine -radix hex "{sim:$tb/ulpsoc_i/l2_ram_i/l2_mem_i/rvt/cut\[$cut\]/cut_hi/Mem\[$cut_addr\]}"
  }
}
