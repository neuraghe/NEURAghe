#!/bin/csh

alias prepend_path \
  'set arg2="\!:2";  if ($?\!:1 == 0) setenv \!:1 "$arg2";  if ($?\!:1 && $\!:1 !~ {,*:}"$arg2"{:*,}) setenv \!:1 "$arg2":"$\!:1";'

alias append_path \
  'set arg2="\!:2";  if ($?\!:1 == 0) setenv \!:1 "$arg2";  if ($?\!:1 && $\!:1 !~ {,*:}"$arg2"{:*,}) setenv \!:1 "$\!:1":"$arg2";'

setenv WORKSTATION_PKG $PULP_SDK_HOME/install/ws

echo "Configuring PULP SDK at: $PULP_SDK_HOME"

prepend_path PATH $PULP_SDK_HOME/install/bin
prepend_path PATH $PULP_SDK_HOME/install/ws/bin
if ( $?LD_LIBRARY_PATH ) then
    prepend_path LD_LIBRARY_PATH $PULP_SDK_HOME/install/lib
    prepend_path LD_LIBRARY_PATH $PULP_SDK_HOME/install/ws/lib
else
    setenv LD_LIBRARY_PATH $PULP_SDK_HOME/install/lib:$PULP_SDK_HOME/install/ws/lib
endif
prepend_path LD_LIBRARY_PATH $PULP_SDK_HOME/install/posix/lib
setenv GEPOP_HOME $PULP_SDK_HOME/install
setenv PULP_OVX_KERNELS_BASE_PATH $PULP_SDK_HOME/install/kernels
setenv PULP_VLFEAT_HOME $PULP_SDK_HOME/install
setenv PULP_OVX_LIBS_BASE_PATH $PULP_SDK_HOME/install
setenv PULP_OMP_HOME $PULP_SDK_HOME
if ( $?PYTHONPATH ) then
    prepend_path PYTHONPATH $PULP_SDK_HOME/install/python
    prepend_path PYTHONPATH $PULP_SDK_HOME/install/ws/python
else
    setenv PYTHONPATH $PULP_SDK_HOME/install/python:$PULP_SDK_HOME/install/ws/python
endif

if ( $?MANPATH ) then
unsetenv MANPATH
setenv MANPATH $PULP_SDK_HOME/install/man:`manpath`
else
setenv MANPATH $PULP_SDK_HOME/install/man
endif

if ( $?OR1K_LLVM_TOOLCHAIN ) then
    if ( ! -d "$OR1K_LLVM_TOOLCHAIN" ) then
	echo "WARNING: The configured OpenRISC toolset is invalid: $OR1K_LLVM_TOOLCHAIN"
    endif
    echo "Configuring OpenRISC LLVM toolset at: $OR1K_LLVM_TOOLCHAIN"
    prepend_path LD_LIBRARY_PATH $OR1K_LLVM_TOOLCHAIN/lib
    prepend_path PATH $OR1K_LLVM_TOOLCHAIN/bin
else
    echo "No OpenRISC LLVM toolset configured, configure OR1K_LLVM_TOOLCHAIN to the directory containing the toolset"
endif

if ( $?OMP_CLANG_HOME ) then
    if ( ! -d "$OMP_CLANG_HOME" ) then
	echo "WARNING: The configured OMP Clang toolset is invalid: $OMP_CLANG_HOME"
    endif
    echo "Configuring OMP Clang toolset at: $OMP_CLANG_HOME"
    prepend_path PATH $OMP_CLANG_HOME/bin
endif

if ( $?OR1K_GCC_TOOLCHAIN ) then
    if ( ! -d "$OR1K_GCC_TOOLCHAIN" ) then
	echo "WARNING: The configured OpenRISC toolset is invalid: $OR1K_GCC_TOOLCHAIN"
    endif
    echo "Configuring OpenRISC GCC toolset at: $OR1K_GCC_TOOLCHAIN"
    prepend_path LD_LIBRARY_PATH $OR1K_GCC_TOOLCHAIN/lib
    prepend_path PATH $OR1K_GCC_TOOLCHAIN/bin
else
    echo "No OpenRISC GCC toolset configured, configure OR1K_GCC_TOOLCHAIN to the directory containing the toolset"
endif

if ( $?OR10NV2_GCC_TOOLCHAIN ) then
    if ( ! -d "$OR10NV2_GCC_TOOLCHAIN" ) then
	echo "WARNING: The configured OR10NV2 toolset is invalid: $OR10NV2_GCC_TOOLCHAIN"
    endif
    echo "Configuring OR10NV2 GCC toolset at: $OR10NV2_GCC_TOOLCHAIN"
    prepend_path LD_LIBRARY_PATH $OR10NV2_GCC_TOOLCHAIN/lib
    prepend_path PATH $OR10NV2_GCC_TOOLCHAIN/bin
else
    echo "No OR10NV2 GCC toolset configured, configure OR10NV2_GCC_TOOLCHAIN to the directory containing the toolset"
endif

if ( $?RISCV_GCC_TOOLCHAIN ) then
    if ( ! -d "$RISCV_GCC_TOOLCHAIN" ) then
	echo "WARNING: The configured OpenRISC toolset is invalid: $RISCV_GCC_TOOLCHAIN"
    endif
    echo "Configuring RISCV GCC toolset at: $RISCV_GCC_TOOLCHAIN"
    prepend_path LD_LIBRARY_PATH $RISCV_GCC_TOOLCHAIN/lib
    prepend_path PATH $RISCV_GCC_TOOLCHAIN/bin
else
    echo "No RISCV GCC toolset configured, configure RISCV_GCC_TOOLCHAIN to the directory containing the toolset"
endif
