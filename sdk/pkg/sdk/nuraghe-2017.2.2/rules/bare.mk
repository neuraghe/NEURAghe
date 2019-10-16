BUILD_DIR = $(CURDIR)/build
compiler ?= gcc
archiTag ?= mia

OR1K_TOOLCHAIN_TYPE = $(compiler)
FABRIC_ARCHI_TAG = $(archiTag)

platform ?= $(shell pulp-config-parse --config=$(SYSTEM_CONFIG) --name=platform --default=gvsoc)
platformOptName ?= $(shell pulp-config-parse --config=$(SYSTEM_CONFIG) --name=platformOpt --default="")
OR1K_TOOLCHAIN_TYPE := $(shell pulp-config-parse --config=$(SYSTEM_CONFIG) --name=compiler --default=$(OR1K_TOOLCHAIN_TYPE))

ifneq '$(platformOptName)' ''
platformName="$(platform),$(platformOptName)"
else
platformName="$(platform)"
endif

ifeq '$(platformOptName)' 'gdbsim'
platformOpt="--prop=/:or1kiss:or1kgdbsim"
endif

include $(PULP_SDK_HOME)/rules/bare_defs.mk

export PATH := $(PULP_SDK_HOME)/install/rtl/$(archiTag)/bin/$(OR1K_TOOLCHAIN_TYPE):$(PATH)

$(BUILD_DIR)/$(APP): $(SRCS)
	mkdir -p $(BUILD_DIR)
	$(CC) $^ $(PULP_OMP_CFLAGS) -O3 -DNDEBUG -o $(BUILD_DIR)/$(APP) $(PULP_OMP_LDFLAGS)

TARGETS += $(BUILD_DIR)/$(APP)

all: $(TARGETS)

clean:
	rm -rf $(BUILD_DIR)

ifeq '$(platform)' 'gvsoc'
PLT_OPT += --fabric-archi=$(FABRIC_ARCHI)  --load-binary=$(APP):0xf --l1-size=262144 --l2-size=1000000 --pdb-no-break $(platformOpt)
else
PLT_OPT += --binary=$(APP) $(platformOpt)
endif

run:
	pulp-run --platform=$(platform) --dir=$(BUILD_DIR) $(PLT_OPT)
