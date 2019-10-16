SHELL=bash

distrib ?= $(shell lsb_release -i -s)_$(firstword $(subst ., ,$(shell lsb_release -r -s)))

ifneq '$(profile)' ''
profileName=$(profile)-
else
profile=default
endif

ARTEFACT_DIR=artefacts/$(profile)/$(distrib)

export PULP_SDK_SRC_PATH=$(CURDIR)/src/sdk/$(sdk)

help:

	@echo "Available make targets:"
	@echo "  list               Shows the available SDK versions."
	@echo "  profiles           Shows the available profiles."
	@echo "  get                Downloads the active SDK. See the options for specifying the active SDK."
	@echo "  src                Fetches the active SDK sources. See the options for specifying the active SDK."
	@echo "  build              Builds the active SDK from sources. See the options for specifying the active SDK."

	@echo
	@echo "Available make options (other configuration options are available, see make config):"
	@echo "  sdk=<version>      Specifies the active SDK version, which must match one of the SDK list"
	@echo "  distrib=<version>  Specifies Linux distribution for which the packages must be downloaded. If not specified, it is guessed from lsb_release"
	@echo "  profile=<profile>  Specifies the profile. The default one is the main one, supporting all targets (must not be used with this option). Other profiles are provided for specific targets or specific needs."

list:
	@for sdk in `ls $(ARTEFACT_DIR)`; do  \
		version=`echo $$sdk | sed s/get-sdk-// | sed s/-$(distrib).py//`; \
		echo $$version; \
	done

profiles:
	@for profile in `ls artefacts`; do  \
		echo $$profile; \
	done

ifndef sdk

get:
	@echo "The SDK version must be specified through sdk=<version>. Execute \"make list\" to see the available versions."
	@exit 1

src: get

build: get

else

src:	
	@echo "Getting sources for SDK $(sdk)"
	@echo
	@mkdir -p src/sdk
	@if [ -e src/sdk/$(sdk) ]; then cd src/sdk/$(sdk); git fetch -t; git checkout $(sdk); else git clone git@iis-git.ee.ethz.ch:pulp-sw/pulp_pipeline.git src/sdk/$(sdk); cd src/sdk/$(sdk); git checkout $(sdk); fi
	@./$(ARTEFACT_DIR)/get-sdk-$(sdk)-$(distrib).py env
	@source src/sdk/$(sdk)/init.sh && plpbuild --p sdk checkout

build:
	@echo "Building SDK $(sdk)"
	@echo
	@./$(ARTEFACT_DIR)/get-sdk-$(sdk)-$(distrib).py env
	@if [ ! -e src/pkg ]; then cd src; ln -s ../pkg pkg; fi
	@source src/init.sh && source env/env-sdk-$(sdk).sh && export PULP_SDK_VERSION=$(sdk) && unset profile && unset MAKEFLAGS && plpbuild --p sdk deps build --stdout


get:
	@echo "Downloading SDK $(sdk)"
	@echo
	@./$(ARTEFACT_DIR)/get-sdk-$(sdk)-$(distrib).py
	@mkdir -p doc
	@rm -f doc/$(sdk) && ln -s ../pkg/sdk/$(sdk)/doc/html doc/$(sdk)
	@echo 
	@echo "Done, this SDK can now be used by sourcing one of these files: env/env-sdk-$(sdk).sh or env/env-sdk-$(sdk).csh"
	@echo "The documentation can be found here: doc/$(sdk)/sdk/index.html"

endif

.PHONY: src build get list help
