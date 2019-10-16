# Now include the proper makefile according to the options to get the build targets

ifeq '$(platform)' 'native'

include $(PULP_SDK_HOME)/install/rules/pulp_native.mk
$(info pulp_native)
else

ifeq '$(platform)' 'stm32'

include $(PULP_SDK_HOME)/install/rules/pulp_stm32.mk
$(info stm32)
else

ifeq '$(platform)' 'gdbsim'

include $(PULP_SDK_HOME)/install/rules/pulp_gdbsim.mk
$(info gdbsim)
else
$(info pulp_omp)
include $(PULP_SDK_HOME)/install/rules/pulp_omp.mk

endif

endif

endif
