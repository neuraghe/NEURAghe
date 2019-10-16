NAMESPACE ?= .

swig := $(shell which swig3.0)
ifeq '$(swig)' ''
swig := $(shell which swig2.0)
ifeq '$(swig)' ''
swig := $(shell which swig)
ifeq '$(swig)' ''
$(error Didn't find proper SWIG install)
endif
endif
endif



DISTRIB = $(shell lsb_release -i -s)

COMP_CFLAGS=-MMD -MP -O2 -g -fpic -std=c++11 -I$(TARGET_PKG)/include -I$(WORKSTATION_PKG)/include -I$(WORKSTATION_PKG)/include
COMP_LDFLAGS=-O2 -g -shared -L$(WORKSTATION_PKG)/lib -lgvsoc

ifneq '$(DISTRIB)' 'CentOS'
COMP_CFLAGS += -Werror -Wall -Wfatal-errors
COMP_LDFLAGS += -Werror -Wall -Wfatal-errors
endif

CPP=g++


define declareComponent

$(eval $(1)_OBJS = $(patsubst %.cpp,$(BUILD_DIR)/$(1)/%.o,$($(1)_SRCS)))

-include $(BUILD_DIR)/_$(1).d

$(BUILD_DIR)/_$(1).so: $(BUILD_DIR)/$(1)_wrap.cpp $($(1)_SRCS)
	@mkdir -p `dirname $$@`
	$(CPP) `python3-config --includes` -include $(1).hpp -o $$@ $(BUILD_DIR)/$(1)_wrap.cpp $($(1)_SRCS) $($(1)_CFLAGS) $(COMP_CFLAGS) $($(1)_LDFLAGS) $(COMP_LDFLAGS) `python3-config --ldflags`

$(BUILD_DIR)/$(1)_wrap.cpp $(BUILD_DIR)/$(1).py: $(1).hpp
	@mkdir -p `dirname $$@`
	$(swig) -python -py3 -ignoremissing -D__SWIG__ -includeall -I$(WORKSTATION_PKG)/include -c++ $($(1)_CFLAGS) -module $(1) -o $(BUILD_DIR)/$(1)_wrap.cpp -outdir $(BUILD_DIR) $(1).hpp

BUILD_TARGETS += $(BUILD_DIR)/_$(1).so $(BUILD_DIR)/$(1).py

$(WORKSTATION_PKG)/python/$(NAMESPACE)/$(1).py: $(BUILD_DIR)/$(1).py
	@mkdir -p `dirname $$@`
	cp $$< $$@ 

$(WORKSTATION_PKG)/python/$(NAMESPACE)/_$(1).so: $(BUILD_DIR)/_$(1).so
	@mkdir -p `dirname $$@`
	cp $$< $$@ 

INSTALL_TARGETS += $(WORKSTATION_PKG)/python/$(NAMESPACE)/$(1).py $(WORKSTATION_PKG)/python/$(NAMESPACE)/_$(1).so

endef

define declareModule

$(WORKSTATION_PKG)/python/$(NAMESPACE)/$(1).py: $(1).py
	@mkdir -p `dirname $$@`
	cp $$< $$@ 

INSTALL_TARGETS += $(WORKSTATION_PKG)/python/$(NAMESPACE)/$(1).py

endef

$(foreach component, $(COMPONENTS), $(eval $(call declareComponent,$(component))))

$(foreach module, $(PY_MODULES), $(eval $(call declareModule,$(module))))

header:

build: $(BUILD_TARGETS)

install: $(INSTALL_TARGETS)
