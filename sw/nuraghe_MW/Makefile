PULP_APP = nuraghe_MW
PULP_APP_SRCS = nuraghe_MW.c

PULP_CFLAGS = -O3

build-rtl:
	cd $(VSIM_PATH) && tcsh scripts/vcompile_all_fpga.do && cd -
	
build-postsynth:
	cd $(VSIM_PATH) && tcsh scripts/vcompile_all_fpga_postsynth.do && cd -

ddr_2.0_16bit:
	cd ddr_emulation && \
	rm -rf *.s19 && \
	txt_to_s19.py w_0.txt w_0.s19 16 && \
	txt_to_s19.py w_1.txt w_1.s19 16 && \
	txt_to_s19.py w.txt w.s19 16 && \
	txt_to_s19.py x.txt x.s19	16 && cd -
	cd build/or10n_nuraghe_0_gcc_bench_bare_libgomp/slm_files && \
	rm -rf ddr_w_*.slm && \
	rm -rf ddr_x_*.slm && \
	s19_to_memcut.py ../../../ddr_emulation/w_0.s19 262144 'ddr_w0_' && \
	s19_to_memcut.py ../../../ddr_emulation/w_1.s19 262144 'ddr_w1_' && \
	s19_to_memcut.py ../../../ddr_emulation/x.s19 262144 'ddr_x_' && cd -

ddr_1.9_16bit:
	cd ddr_emulation && \
	rm -rf *.s19 && \
	txt_to_s19.py w.txt w.s19 16 && \
	txt_to_s19.py x.txt x.s19	16 && cd -
	cd build/or10n_nuraghe_0_gcc_bench_bare_libgomp/slm_files && \
	rm -rf ddr_w_*.slm && \
	rm -rf ddr_x_*.slm && \
	s19_to_memcut.py ../../../ddr_emulation/w.s19 262144 'ddr_w_' && \
	s19_to_memcut.py ../../../ddr_emulation/x.s19 262144 'ddr_x_' && cd -


ddr_8bit:
	cd ddr_emulation && \
	rm -rf *.s19 && \
	txt_to_s19.py w.txt w.s19 16 && \
	txt_to_s19.py x.txt x.s19	8 && cd -
	cd build/or10n_nuraghe_0_gcc_bench_bare_libgomp/slm_files && \
	rm -rf ddr_w_*.slm && \
	rm -rf ddr_x_*.slm && \
	s19_to_memcut.py ../../../ddr_emulation/w.s19 262144 'ddr_w_' && \
	s19_to_memcut.py ../../../ddr_emulation/x.s19 131072 'ddr_x_' && cd -

ddr_2.0_for_sim:
	cd  convoluzioni_SW/ &&  \
	gcc -o  convoluzione convoluzione.c  && ./convoluzione  && cd .. &&  \
	cd ddr_emulation && \
	python post_training_2.0.py  settings_2.0.txt
	
ddr_1.9_for_sim:
	cd  convoluzioni_SW/ &&  \
	gcc -o  convoluzione convoluzione.c  && ./convoluzione  && cd .. &&  \
	cd ddr_emulation && \
	python post_training_1.9.py  settings_1.9.txt

code:
	cd build/or10n_nuraghe_0_gcc_bench_bare_libgomp && or1kle-elf-objcopy -R .debug_frame -R .comment -R .stack -R .heapsram -R .heapscm -R .libgomp -R .heapl1 -O binary $(PULP_APP) $(PULP_APP).l2.bin && cd -
	$(neuraghe_path)/$(NEU_ARCH)/zynq/bin2header/zynq_setup build/or10n_nuraghe_0_gcc_bench_bare_libgomp/$(PULP_APP).l2.bin $(PULP_APP)_l2.h
	

include $(PULP_SDK_HOME)/install/rules/pulp.mk
