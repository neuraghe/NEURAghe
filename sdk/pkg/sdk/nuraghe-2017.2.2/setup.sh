#!/bin/bash

export WORKSTATION_PKG=$PULP_SDK_HOME/install/ws

echo "Configuring PULP SDK at: $PULP_SDK_HOME"

add_path() {
    export PATH=${PATH//":$1:"/:}
    export PATH=${PATH/%":$1"/}
    export PATH=${PATH/#"$1:"/}
    export PATH="$1${PATH:+":$PATH"}"
}

add_ld_path() {
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH//":$1:"/:}
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH/%":$1"/}
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH/#"$1:"/}
    export LD_LIBRARY_PATH="$1${LD_LIBRARY_PATH:+":$LD_LIBRARY_PATH"}"
}

add_PYTHONPATH() {
    export PYTHONPATH=${PYTHONPATH//":$1:"/:}
    export PYTHONPATH=${PYTHONPATH/%":$1"/}
    export PYTHONPATH=${PYTHONPATH/#"$1:"/}
    export PYTHONPATH="$1${PYTHONPATH:+":$PYTHONPATH"}"
}

add_path $PULP_SDK_HOME/install/bin
add_path $PULP_SDK_HOME/install/ws/bin
add_ld_path $PULP_SDK_HOME/install/lib
add_ld_path $PULP_SDK_HOME/install/ws/lib
add_ld_path $LD_LIBRARY_PATH
add_ld_path $PULP_SDK_HOME/install/posix/lib
add_PYTHONPATH $PULP_SDK_HOME/install/python
add_PYTHONPATH $PULP_SDK_HOME/install/ws/python

export GEPOP_HOME=$PULP_SDK_HOME/install
export PULP_OVX_KERNELS_BASE_PATH=$PULP_SDK_HOME/install/kernels
export PULP_VLFEAT_HOME=$PULP_SDK_HOME/install
export PULP_OVX_LIBS_BASE_PATH=$PULP_SDK_HOME/install
export PULP_OMP_HOME=$PULP_SDK_HOME

unset MANPATH
export MANPATH=$PULP_SDK_HOME/install/man:`manpath`

if [ -z "$OR1K_LLVM_TOOLCHAIN" ]; then
    echo "No OpenRISC LLVM toolset configured, configure OR1K_LLVM_TOOLCHAIN to the directory containing the toolset"
else
    if [ ! -d "$OR1K_LLVM_TOOLCHAIN" ]; then
	echo "WARNING: The configured OpenRISC toolset is empty: $OR1K_LLVM_TOOLCHAIN"
    fi
    echo "Configuring OpenRISC LLVM toolset at: $OR1K_LLVM_TOOLCHAIN"
    add_ld_path $OR1K_LLVM_TOOLCHAIN/lib
    add_path $OR1K_LLVM_TOOLCHAIN/bin
fi

if [ -n "$OMP_CLANG_HOME" ]; then
    if [ ! -d "$OMP_CLANG_HOME" ]; then
	echo "WARNING: The configured OMP Clang toolset is empty: $OMP_CLANG_HOME"
    fi
    echo "Configuring OMP Clang toolset at: $OMP_CLANG_HOME"
    add_path $OMP_CLANG_HOME/bin
fi

if [ -z "$OR1K_GCC_TOOLCHAIN" ]; then
    echo "No OpenRISC GCC toolset configured, configure OR1K_GCC_TOOLCHAIN to the directory containing the toolset"
else
    if [ ! -d "$OR1K_GCC_TOOLCHAIN" ]; then
	echo "WARNING: The configured OpenRISC toolset is empty: $OR1K_GCC_TOOLCHAIN"
    fi
    echo "Configuring OpenRISC GCC toolset at: $OR1K_GCC_TOOLCHAIN"
    add_ld_path $OR1K_GCC_TOOLCHAIN/lib
    add_path $OR1K_GCC_TOOLCHAIN/bin
fi

if [ -z "$OR10NV2_GCC_TOOLCHAIN" ]; then
    echo "No OR10NV2 GCC toolset configured, configure OR10NV2_GCC_TOOLCHAIN to the directory containing the toolset"
else
    if [ ! -d "$OR10NV2_GCC_TOOLCHAIN" ]; then
	echo "WARNING: The configured OR10NV2 toolset is empty: $OR10NV2_GCC_TOOLCHAIN"
    fi
    echo "Configuring OR10NV2 GCC toolset at: $OR10NV2_GCC_TOOLCHAIN"
    add_ld_path $OR10NV2_GCC_TOOLCHAIN/lib
    add_path $OR10NV2_GCC_TOOLCHAIN/bin
fi

if [ -z "$RISCV_GCC_TOOLCHAIN" ]; then
    echo "No RISCV GCC toolset configured, configure RISCV_GCC_TOOLCHAIN to the directory containing the toolset"
else
    if [ ! -d "$RISCV_GCC_TOOLCHAIN" ]; then
	echo "WARNING: The configured OpenRISC toolset is empty: $RISCV_GCC_TOOLCHAIN"
    fi
    echo "Configuring RISCV GCC toolset at: $RISCV_GCC_TOOLCHAIN"
    add_ld_path $RISCV_GCC_TOOLCHAIN/lib
    add_path $RISCV_GCC_TOOLCHAIN/bin
fi
