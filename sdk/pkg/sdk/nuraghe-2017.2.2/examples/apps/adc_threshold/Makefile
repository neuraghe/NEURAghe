PULP_APP = test
PULP_APP_SRCS = test.c

PULP_CFLAGS = -O2

override PLT_OPT := $(PLT_OPT) --adc=0:$(CURDIR)/stimuli/stimuli_cos_hex.asc --uart-file=uart.trace

include $(PULP_SDK_HOME)/install/rules/plplib.mk
