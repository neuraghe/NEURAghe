
#export NEU_ARCH="neuraghe_2.0"
export NEU_ARCH="neuraghe_1.9"

printf "target architecture: $NEU_ARCH\n"

printf "\n neuraghe environment configuration"
export neuraghe_path=$(pwd)
echo "neuraghe path : $neuraghe_path "

echo "building symlinks"
ln -sfn $neuraghe_path/$NEU_ARCH/fe/sim/tcl_files/ 	$neuraghe_path/sw/nuraghe_MW/build/or10n_nuraghe_0_gcc_bench_bare_libgomp/tcl_files
ln -sfn $neuraghe_path/$NEU_ARCH/fe/sim/modelsim.ini 	$neuraghe_path/sw/nuraghe_MW/build/or10n_nuraghe_0_gcc_bench_bare_libgomp/modelsim.ini
ln -sfn $neuraghe_path/$NEU_ARCH/fe/sim/waves/		$neuraghe_path/sw/nuraghe_MW/build/or10n_nuraghe_0_gcc_bench_bare_libgomp/waves
ln -sfn $neuraghe_path/$NEU_ARCH/fe/sim/boot/		$neuraghe_path/sw/nuraghe_MW/build/or10n_nuraghe_0_gcc_bench_bare_libgomp/boot
ln -sfn $neuraghe_path/$NEU_ARCH/fe/sim/work/		$neuraghe_path/sw/nuraghe_MW/build/or10n_nuraghe_0_gcc_bench_bare_libgomp/work
ln -sfn $neuraghe_path/$NEU_ARCH/fe/sim/ips_scripts/		$neuraghe_path/$NEU_ARCH/fe/ips/scripts

source $neuraghe_path/sdk/env/env-sdk-nuraghe-2017.2.2.sh
source $neuraghe_path/sdk/setup.sh
export VSIM_PATH=$neuraghe_path/$NEU_ARCH/fe/sim
export PT_PATH=$neuraghe_path/nur_post_training
export MW=$neuraghe_path/sw/nuraghe_MW
export CPATH=$MW:$CPATH


#change paths in order to reach the right folders according to your system
export SDK=/home/nur/Xilinx/SDK/2017.1/bin/
#export LD_PRELOAD=/usr/X11R6/lib64/libXpm.so.4
source /home/nur/Xilinx/Vivado/2017.1/settings64.sh
export VIVADO=/home/nur/Xilinx/Vivado/2017.1/bin
export PATH=$VIVADO:$SDK:$MW:$NEU_ARCH:$neuraghe_path:$PATH

#select the right destination address and folder for you board 
export NEURAGHE_BOARD_ADDR=gderiu@10.131.3.219
export NEURAGHE_INSTALL_DIR=neuraghe
