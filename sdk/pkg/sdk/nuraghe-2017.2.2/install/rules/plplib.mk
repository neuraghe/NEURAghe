ifeq '$(pulpOmpVersion)' 'new'
PULP_APP_DEPS += plplib_newrt
ifneq '$(USE_CMSIS)' ''
PULP_APP_DEPS += cmsis_newrt
PULP_CFLAGS += -D__USE_CMSIS__ -I$(PULP_SDK_HOME)/install/CMSIS/DSP/Include -I$(PULP_SDK_HOME)/install/CMSIS/Core/Include
endif
include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
else
PULP_APP_DEPS += plplib
ifneq '$(USE_CMSIS)' ''
PULP_APP_DEPS += cmsis
PULP_CFLAGS += -D__USE_CMSIS__ -I$(PULP_SDK_HOME)/install/CMSIS/DSP/Include -I$(PULP_SDK_HOME)/install/CMSIS/Core/Include
endif
include $(PULP_SDK_HOME)/install/rules/pulp.mk
endif
