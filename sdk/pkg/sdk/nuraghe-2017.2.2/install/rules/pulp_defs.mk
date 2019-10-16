BUILD_DIR ?= $(CURDIR)/build
$(info in pulp_defs, current directtory: $(CURDIR))

ifdef PULP_OMP_APP
pulpRt = 'omp'
endif

ifdef pulpOmpversion
pulpRt = 'omp'
endif

include $(PULP_SDK_HOME)/install/rules/pulp_flags.mk

makefileDir := $(shell $(PULP_SDK_HOME)/install/bin/pulp-flags --make-path $(PULP_FLAGS_OPT))
$(info file_dir: $(makefileDir))

$(info Generating PULP flags ($(makefileDir)) with command: $(PULP_SDK_HOME)/install/bin/pulp-flags --make $(PULP_FLAGS_OPT))

ifeq '$(makefileDir)' ''
$(error Error occured while generating application flags)
endif

dummy := $(shell mkdir -p $(makefileDir))
makefileStatus := $(shell $(PULP_SDK_HOME)/install/bin/pulp-flags --make $(PULP_FLAGS_OPT) | tee $(makefileDir)/rules.mk)
$(info [file_status: printed in $(makefileDir)/rules.mk])

V ?= @

genPulpConfig:
	$(PULP_SDK_HOME)/install/bin/pulp-flags --config-file $(PULP_FLAGS_OPT) > $(makefileDir)/pulpConfig.h.new
	$(V)cmp -s $(makefileDir)/pulpConfig.h.new $(makefileDir)/pulpConfig.h || mv $(makefileDir)/pulpConfig.h.new $(makefileDir)/pulpConfig.h

include $(makefileDir)/rules.mk

