vlib work_mmu

vlog -work work_mmu \
  +incdir+../rtl/includes \
  +libext+.sv \
  -y ../rtl/ulpcluster \
  ../tb/tb_mmu.sv

vsim \
  -novopt \
  -do "do do_files/MMU.do" \
  work_mmu.tb_mmu

