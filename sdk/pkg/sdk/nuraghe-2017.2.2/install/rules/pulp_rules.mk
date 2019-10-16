$(info in PULP TOP)
-include $(PULP_SDK_HOME)/install/rules/pulp_top.mk

GROUPS ?= runtime

GROUPS_OPT = $(foreach group, $(GROUPS), --g $(group))
MODULES_OPT = $(foreach module, $(MODULES), --m $(module))

ifdef VERBOSE
plpbuildOpt += --stdout
endif

sdk.get:
	@echo "TODO"

sdk.deps:
	plpbuild --p sdk $(GROUPS_OPT) $(MODULES_OPT) --auto deps $(plpbuildOpt)
	@echo
	@echo "Dependencies might have changed, you should re-configure the SDK by sourcing the generated env script"

sdk.checkout:
	plpcheckout --p sdk $(GROUPS_OPT) --auto $(MODULES_OPT)

sdk.build:
	plpbuild $(GROUPS_OPT) $(MODULES_OPT) --auto build $(plpbuildOpt)

sdk: sdk.deps sdk.checkout sdk.build

rtl.checkout:
	plpcheckout --p rtl --auto
	
rtl.build:
	plpbuild --p rtl --auto build $(plpbuildOpt)

rtl: rtl.checkout rtl.build
