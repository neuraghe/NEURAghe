$(info PULP.MK)
include $(PULP_SDK_HOME)/install/rules/pulp_flags.mk
$(info pulp_flags_opt: $(PULP_FLAGS_OPT))
rtOmpVersion = $(shell $(PULP_SDK_HOME)/install/bin/pulp-flags $(PULP_FLAGS_OPT) --property=pulpOmpVersion)
$(info $(rtOmpVersion) )

ifeq '$(rtOmpVersion)' 'new'
compatMode=1
fetchAll=1
pulpNoFc=1
endif

-include $(PULP_SDK_HOME)/install/rules/pulp_defs.mk
-include $(PULP_SDK_HOME)/install/rules/pulp_rules.mk

$(info app build dir: $(APP_BUILD_DIR))
