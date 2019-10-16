FABRIC_ARCHI ?= mia
OR1K_TOOLCHAIN_TYPE ?= gcc
platform ?= gvsoc

ifeq '$(FABRIC_ARCHI)' 'sthorm'
FABRIC_CORE ?= xp70emu
endif

ifeq '$(FABRIC_ARCHI)' 'pulp2'
FABRIC_CORE ?= or1k
endif

ifeq '$(FABRIC_ARCHI)' 'pulp3'
FABRIC_CORE ?= or1k
endif

ifeq '$(FABRIC_ARCHI)' 'pulpevo'
FABRIC_CORE ?= or1k
endif

ifeq '$(FABRIC_ARCHI)' 'mia'
FABRIC_CORE ?= or1k
endif


HOST_CORE ?= or1k
PLATFORM ?= gepop
FABRIC_VERSION ?= debug

ifdef ARCHI_CONFIG
FABRIC_ARCHI = $(shell pulp-parse-config --config=$(ARCHI_CONFIG) --name=fArchi)
FABRIC_CORE = $(shell pulp-parse-config --config=$(ARCHI_CONFIG) --name=fCore)
HOST_CORE = $(shell pulp-parse-config --config=$(ARCHI_CONFIG) --name=hCore)
PLATFORM = $(shell pulp-parse-config --config=$(ARCHI_CONFIG) --name=platform)
endif

BUILD_DIR=build/$(OR1K_TOOLCHAIN_TYPE)/HC-$(HOST_CORE)_FA-$(FABRIC_ARCHI)_FC-$(FABRIC_CORE)_FV-$(FABRIC_VERSION)

ifeq '$(HOST_CORE)' 'posix'
HOST_CC = gcc
endif

ifeq '$(HOST_CORE)' 'or1k'
ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
HOST_CC = or1kle-elf-clang -target or1kle-elf -mcpu=pulp3
else
HOST_CC = or1kle-elf-gcc
endif
endif

ifndef L1_SIZE
L1_SIZE=524288
endif

ifndef L2_SIZE
L2_SIZE=4048576
endif

ifeq '$(platform)' 'rtl'
PLATFORM=RT_SYS_CONF_PLATFORM_RTL
else
PLATFORM=RT_SYS_CONF_PLATFORM_OTHER
endif

ifeq '$(HOST_CORE)' 'posix'
HOST_CFLAGS += -m32
HOST_LDFLAGS += -L$(PULP_SDK_HOME)/install/lib -m32
endif
HOST_CFLAGS += -I$(PULP_SDK_HOME)/install/include -I$(PULP_SDK_HOME)/install/include/os
HOST_LDFLAGS += -L$(PULP_SDK_HOME)/install/$(HOST_CORE)/lib/$(OR1K_TOOLCHAIN_TYPE) -Wl,--whole-archive -lhd-pulp  -Wl,--no-whole-archive -leld_ext -T$(PULP_SDK_HOME)/install/src/or1k/host-or1k.ld -nostartfiles -Wl,-export-dynamic

FABRIC_CFLAGS += -I$(PULP_SDK_HOME)/install/include


ifeq '$(FABRIC_VERSION)' 'debug'
FABRIC_CFLAGS += -D__DEBUG__=1 -D__CHECKINGS__=1
else
ifeq '$(FABRIC_VERSION)' 'profile0'
FABRIC_CFLAGS += -D__PROFILE0__=1
else
ifeq '$(FABRIC_VERSION)' 'profile1'
FABRIC_CFLAGS += -D__PROFILE0__=1 -D__PROFILE1__=1
else
ifeq '$(FABRIC_VERSION)' 'bench'
FABRIC_CFLAGS += -D__BENCH__=1
else
ifeq '$(FABRIC_VERSION)' 'release'
endif
endif
endif
endif
endif



ifeq '$(FABRIC_ARCHI)' 'sthorm'
HOST_CFLAGS += -D__STHORM__
FABRIC_CFLAGS += -D__STHORM__
endif

ifeq '$(FABRIC_ARCHI)' 'pulp2'
HOST_CFLAGS += -D__PULP2__ -D__PULP__ -D__OR1K__ -I$(PULP_SDK_HOME)/install/include/archi/or10n3
FABRIC_CFLAGS += -D__PULP2__ -D__PULP__ -D__OR1K__ -I$(PULP_SDK_HOME)/install/include/archi/or10n3
endif

ifeq '$(FABRIC_ARCHI)' 'pulp3'
HOST_CFLAGS += -D__PULP3__ -D__PULP__ -D__OR1K__ -I$(PULP_SDK_HOME)/install/include/archi/or10n3
FABRIC_CFLAGS += -D__PULP3__ -D__PULP__ -D__OR1K__ -I$(PULP_SDK_HOME)/install/include/archi/or10n3
endif

ifeq '$(FABRIC_ARCHI)' 'pulpevo'
HOST_CFLAGS += -D__PULPEVO__ -D__PULP__ -D__OR1K__ -DOR10N4 -I$(PULP_SDK_HOME)/install/include/archi/or10n4
FABRIC_CFLAGS += -D__PULPEVO__ -D__PULP__ -D__OR1K__ -DOR10N4 -I$(PULP_SDK_HOME)/install/include/archi/or10n4
endif

ifeq '$(FABRIC_ARCHI)' 'mia'
HOST_CFLAGS += -D__MIA__ -D__PULP__ -D__OR1K__ -I$(PULP_SDK_HOME)/install/include/archi/or10n3
FABRIC_CFLAGS += -D__MIA__ -D__PULP__ -D__OR1K__ -I$(PULP_SDK_HOME)/install/include/archi/or10n3
endif



ifdef FABRIC_FPU
ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
PULP_OMP_LDFLAGS += -L${OR1K_LLVM_TOOLCHAIN}/or1kle-elf/lib/pulp3-pic-fpu -mhard-float
endif
PULP_OMP_CFLAGS += -mhard-float
PULP_OMP_LDFLAGS += -mhard-float
else
PULP_OMP_CFLAGS += -msoft-float
PULP_OMP_LDFLAGS += -msoft-float
endif


ifeq ($(FABRIC_CORE),or1k)
FABRIC_CFLAGS += -D__OR1K__ -mhard-mul -msoft-div
ifdef BARE
FABRIC_CFLAGS += -D__BARE__
HOST_CFLAGS += -D__BARE__
endif

ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
FABRIC_LDFLAGS += -L$(OR1K_LLVM_TOOLCHAIN)/lib/gcc/or1kle-elf/4.9.0
endif

FABRIC_LDFLAGS += -L$(PULP_SDK_HOME)/install/or1k/lib/$(OR1K_TOOLCHAIN_TYPE)
ifdef PULP_LLVM_BITCODE
FABRIC_LDFLAGS += $(PULP_SDK_HOME)/install/or1k/lib/$(OR1K_TOOLCHAIN_TYPE)/librtbc-$(FABRIC_ARCHI)-$(FABRIC_VERSION).bc -Wl,--whole-archive -lrtasmbc-$(FABRIC_ARCHI)-$(FABRIC_VERSION) -Wl,--no-whole-archive 
else
FABRIC_LDFLAGS += -Wl,--whole-archive -lrt-$(FABRIC_ARCHI)-$(FABRIC_VERSION) -Wl,--no-whole-archive 
endif
FABRIC_LDFLAGS += -DL1_SIZE=$(L1_SIZE) -DL2_SIZE=$(L2_SIZE) -DPLATFORM=$(PLATFORM) -T$(PULP_SDK_HOME)/install/src/pulp/$(FABRIC_ARCHI)/link.ld -nostdlib -mhard-mul -msoft-div -lor1k

ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
FABRIC_LDFLAGS += -lclang_rt.builtins
else
FABRIC_LDFLAGS += -lgcc
endif


ifeq '$(OR1K_TOOLCHAIN_TYPE)' 'llvm'
FABRIC_LD =     or1kle-elf-gcc
FABRIC_CC =     clang -target or1kle-elf -mcpu=pulp3 -D__LLVM__
FABRIC_AR =     or1kle-elf-ar
else
FABRIC_LD = or1kle-elf-gcc
FABRIC_CC = or1kle-elf-gcc -D__GCC__
FABRIC_AR = or1kle-elf-ar
endif
else
ifeq ($(FABRIC_CORE),xp70emu)
FABRIC_LD = gcc
FABRIC_CC = gcc
FABRIC_AR = ar
FABRIC_CFLAGS += -g -D__XP70EMU__ -m32 -fpic
FABRIC_LDFLAGS += -g -m32 -shared -L$(PULP_SDK_HOME)/install/xp70emu/lib -lrt-sthorm-$(FABRIC_VERSION)
else
FABRIC_LD = stxp70cc -mcore=stxp70v4
FABRIC_CC = stxp70cc -mcore=stxp70v4
FABRIC_AR = stxp70-ar -mcore=stxp70v4
FABRIC_CFLAGS += -mcore=stxp70v4 -Mextension=fpx -fshort-double -corecfg=0x8190391C -corecfg1=0x00020C00 -D__XP70__
FABRIC_LDFLAGS += -mcore=stxp70v4 -Mextension=fpx -fshort-double -corecfg=0x8190391C -corecfg1=0x00020C00 -Mnostartup -nostdlib -T$(PULP_SDK_HOME)/install/src/xp70/link.ld -L$(PULP_SDK_HOME)/install/xp70/lib -Wl,--whole-archive -lrt-sthorm-$(FABRIC_VERSION) -Wl,--no-whole-archive -lcfpi -larith
endif
endif

FABRIC_LDFLAGS +=  $(patsubst %,-l%,$(FABRIC_LIBS))

FABRIC_OBJS += $(patsubst src/%.S,$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.o,$(patsubst src/%.c,$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.o,$(FABRIC_SRCS)))
FABRIC_BCS += $(patsubst src/%.S,$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.bc,$(patsubst src/%.c,$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.bc,$(FABRIC_SRCS)))
FABRIC_DEPS += $(patsubst src/%.S,$(BUILD_DIR)/%.d,$(patsubst src/%.c,$(BUILD_DIR)/%.d,$(FABRIC_SRCS)))
ifdef PULP_LLVM_BITCODE
FABRIC_LIBS_DEPS += $(patsubst %,$(PULP_SDK_HOME)/install/$(FABRIC_CORE)/lib/$(OR1K_TOOLCHAIN_TYPE)/lib%.bc,$(FABRIC_LIBS))
else
FABRIC_LIBS_DEPS += $(patsubst %,$(PULP_SDK_HOME)/install/$(FABRIC_CORE)/lib/$(OR1K_TOOLCHAIN_TYPE)/lib%.a,$(FABRIC_LIBS))
endif

FABRIC_OBJS += $(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/rtConf.o
FABRIC_BCS += $(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/rtConf.bc

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(FABRIC_DEPS)),)
-include $(FABRIC_DEPS)
endif
endif

$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/rtConf.o: $(PULP_SDK_HOME)/install/src/pulp/$(FABRIC_ARCHI)/rtConf.c 
	@mkdir -p `dirname $@`
	$(FABRIC_CC) -DL1_SIZE=$(L1_SIZE) -DL2_SIZE=$(L2_SIZE) -DPLATFORM=$(PLATFORM) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" $(FABRIC_CFLAGS) -o $@ -c $<

$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/rtConf.bc: $(PULP_SDK_HOME)/install/src/pulp/$(FABRIC_ARCHI)/rtConf.c 
	@mkdir -p `dirname $@`
	$(FABRIC_CC) -emit-llvm -DL1_SIZE=$(L1_SIZE) -DL2_SIZE=$(L2_SIZE) -DPLATFORM=$(PLATFORM) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" $(FABRIC_CFLAGS) -o $@ -c $<

$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.o: src/%.c
	@mkdir -p `dirname $@`
	$(FABRIC_CC) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" $(FABRIC_CFLAGS) -o $@ -c $<

$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.bc: src/%.c
	@mkdir -p `dirname $@`
	$(FABRIC_CC) -emit-llvm -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" $(FABRIC_CFLAGS) -o $@ -c $<

$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/%.o: src/%.S
	@mkdir -p `dirname $@`
	$(FABRIC_CC) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" $(FABRIC_CFLAGS) -o $@ -c $<

ifdef FABRIC_LIB_NAME
FABRIC_LIB=$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/$(FABRIC_LIB_NAME)

$(FABRIC_LIB): $(FABRIC_OBJS)
	@mkdir -p `dirname $@`
	$(FABRIC_AR) cr $@ $^
endif

ifdef FABRIC_BCLIB_NAME
FABRIC_BCLIB=$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/$(FABRIC_BCLIB_NAME)

$(FABRIC_BCLIB): $(FABRIC_BCS)
	@mkdir -p `dirname $@`
	llvm-link -o $@ $^
endif

ifdef FABRIC_BIN_NAME

FABRIC_BIN=$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/$(FABRIC_BIN_NAME)
$(FABRIC_BIN): $(FABRIC_LIBS_DEPS) $(FABRIC_OBJS)
	@mkdir -p `dirname $@`
	$(FABRIC_CC) -o $@ $^ $(FABRIC_LDFLAGS)

endif

ifdef HOST_BIN_NAME
HOST_BIN = $(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE)/$(HOST_BIN_NAME)
$(HOST_BIN): $(HOST_SRCS)
	@mkdir -p `dirname $@`
	$(HOST_CC) $(HOST_CFLAGS) $< -o $@ $(HOST_LDFLAGS)
endif

all: $(HOST_BIN) $(FABRIC_BIN) $(FABRIC_LIB) $(FABRIC_BCLIB)

clean:
	rm -rf $(BUILD_DIR)

run:
	pulp-run --platform=$(platform) --fabric-archi=$(FABRIC_ARCHI) --dir=$(BUILD_DIR)/$(OR1K_TOOLCHAIN_TYPE) --load-binary=./$(HOST_BIN_NAME):0x80000000 --l2-size=4048576  --l3-size=536870912 --l1-size=524288 --soc=full
