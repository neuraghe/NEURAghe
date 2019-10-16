PULP_RTL_SW_HOME = $(PULP_SDK_HOME)/install/rtl/$(FABRIC_ARCHI_TAG)


ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
CC=or1kle-elf-clang
else
CC=or1kle-elf-gcc
endif

ifeq '$(OMP_RUNTIME)' 'ovx'

FABRIC_ARCHI?=mia
FABRIC_VERSION?=release

include $(PULP_SDK_HOME)/rules/rt.mk

INC_PATHS = -I$(PULP_SDK_HOME)/install/include -I$(PULP_RTL_SW_HOME)/include
LIB_PATHS = -L$(PULP_SDK_HOME)/install/or1k/lib -L$(PULP_RTL_SW_HOME)/lib/$(OR1K_TOOLCHAIN_TYPE)

ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
PULP_OMP_CFLAGS += $(INC_PATHS) -mcpu=pulp3 $(FABRIC_CFLAGS)
PULP_OMP_LDFLAGS += -mcpu=pulp3 $(LIB_PATHS) $(FABRIC_LDFLAGS)
else
PULP_OMP_CFLAGS += $(INC_PATHS) $(FABRIC_CFLAGS)
PULP_OMP_LDFLAGS += $(LIB_PATHS) $(FABRIC_LDFLAGS)
endif

PULP_OMP_CFLAGS += -D__OVX__
PULP_OMP_LDFLAGS += -lOclDev-$(FABRIC_ARCHI)-$(FABRIC_VERSION)

else

ifdef PULP_SDK_HOME
INC_PATHS = -I$(PULP_SDK_HOME)/install/include/omp -I$(PULP_RTL_SW_HOME)/include -D__LLVM__
LIB_PATHS = -L$(PULP_SDK_HOME)/install/or1k/lib -L$(PULP_RTL_SW_HOME)/lib/$(OR1K_TOOLCHAIN_TYPE)
else
INC_PATHS = -I$(PULP_RTL_SW_HOME)/include -D__GCC__
LIB_PATHS = -L$(PULP_RTL_SW_HOME)/lib /$(OR1K_TOOLCHAIN_TYPE)
endif

ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
PULP_OMP_CFLAGS += $(INC_PATHS) -mcpu=pulp3
PULP_OMP_LDFLAGS += -mcpu=pulp3 -T$(PULP_SDK_HOME)/install/rtl/$(FABRIC_ARCHI_TAG)/src/link.ld -nostartfiles -Wl,--gc-sections $(PULP_SDK_HOME)/install/rtl/$(FABRIC_ARCHI_TAG)/src/crt0.S $(LIB_PATHS) -lbench -lmalloc -lstdio -lstring -lsys -lmalloc
else
PULP_OMP_CFLAGS += $(INC_PATHS)
PULP_OMP_LDFLAGS += -T$(PULP_RTL_SW_HOME)/src/link.ld -nostartfiles -Wl,--gc-sections $(PULP_RTL_SW_HOME)/src/crt0.S $(LIB_PATHS) -lbench -lmalloc -lstdio -lstring -lsys -lmalloc
endif

endif

