FABRIC_BIN_NAME = fabric.exe
HOST_BIN_NAME = host

FABRIC_SRCS = src/fabric.c
HOST_SRCS = src/host.c

FABRIC_CFLAGS += -O3
FABRIC_LDFLAGS += -O3

include $(PULP_SDK_HOME)/rules/rt.mk

check:
	./testCheck 120 make run
