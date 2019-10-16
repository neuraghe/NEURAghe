ROOT ?= .
SANITIZE?= 0
# PROFILE = 0
TIME?= 0
DEBUG?= 0
RELEASE?= 0
FIXED?= 0
NEURAGHE?= 0
NEURAGHE8?= 0
ARM?= 0
CI?= 0
NEURAGHE_DMA?=0
ZYNQ?=0
US?= 0

ARCH?=x86
TYPE?=-float
VERSION?=

ifeq ($(ZYNQ),zed)
	ACC_FLAGS += -DZYNQ=1
endif 

ifeq ($(ARM),1)
	ARCH=arm
	ACC_FLAGS += -D _ARM_
endif


ifeq ($(NEURAGHE),1)
	ARM=1
	ARCH=neuraghe-v$(NEURAGHE_DMA)
	TYPE=-fp16
endif

ifeq ($(NEURAGHE8),1)
	ARM=1
	ARCH=neuraghe-v$(NEURAGHE_DMA)
	TYPE=-fp16
endif

ifeq ($(FIXED),1)
	TYPE=-fp16
endif

ifeq ($(CI),1)
	VERSION=-ci
endif

ifndef CROSS_COMPILER_CPP
	ifeq ($(US),1)
		CROSS_COMPILER_CPP = aarch64-linux-gnu-g++
	else
		CROSS_COMPILER_CPP = arm-linux-gnueabihf-g++
	endif
endif

ifndef CROSS_COMPILER_CC
	ifeq ($(US),1)
		CROSS_COMPILER_CC = aarch64-linux-gnu-gcc
	else
		CROSS_COMPILER_CC = arm-linux-gnueabihf-gcc
	endif
endif

ifeq ($(ARM),1)
	ifeq ($(US),1)
		CC = $(CROSS_COMPILER_CC) -std=c99 -O3 -fopenmp   -ftree-vectorize  -fprefetch-loop-arrays -fpermissive
		CPP = $(CROSS_COMPILER_CPP) -std=c++11 -O3 -fopenmp  -ftree-vectorize  -fprefetch-loop-arrays -fpermissive
		AR = aarch64-linux-gnu-ar rvs
	else
		CC = $(CROSS_COMPILER_CC) -std=c99 -O3 -fopenmp -march=armv7-a -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -ftree-vectorize -mvectorize-with-neon-quad -fprefetch-loop-arrays
		CPP = $(CROSS_COMPILER_CPP) -std=c++11 -O3 -fopenmp -march=armv7-a -mtune=cortex-a9 -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -ftree-vectorize -mvectorize-with-neon-quad -fprefetch-loop-arrays
		AR = arm-linux-gnueabihf-ar rvs
	endif
	
else
	CC = gcc -m64 -std=c99 -O3 -fopenmp
	CPP = g++ -m64 -std=c++11 -O3 -fopenmp
	AR = ar rvs
endif

CFLAGS =\
-fPIC -Wall -Wextra -Wpedantic \
-Wpointer-arith -Wcast-qual \
-Wcast-align -Wparentheses \
-Wredundant-decls -Winline \
-Wno-unknown-pragmas -Wno-unused-label \
-Wstrict-prototypes -Wmissing-prototypes

CPPFLAGS =\
-fPIC -Wall -Wextra -Wpedantic \
-Wpointer-arith -Wcast-qual \
-Wcast-align -Wparentheses \
-Wredundant-decls -Winline \
-Wno-unknown-pragmas -Wno-unused-label

ifeq ($(RELEASE),1)
	RELEASE_FLAGS = -D _RELEASE_
else
	ifeq ($(SANITIZE),1)
		SAN_FLAGS = -fsanitize=address
	endif
	ifeq ($(DEBUG),1)
		DEBUG_FLAGS = -g -D _DEBUG_
	endif
endif

ifeq ($(TIME),1)
	RELEASE_FLAGS =
    PROF_FLAGS += -D _TIME_
endif

ifeq ($(CI),1)
	RELEASE_FLAGS = -D _RELEASE_
    PROF_FLAGS += -D __CI__
endif

ifeq ($(FIXED),1)
	TYPE_FLAGS = -D _FIXED_
endif

ifeq ($(NEURAGHE),1)
	ACC_FLAGS += -D _NEURAGHE_ -D _ARM_ -DNEURAGHE_DMA=$(NEURAGHE_DMA)
	TYPE_FLAGS = -D _FIXED_
endif

ifeq ($(NEURAGHE8),1)
	ACC_FLAGS += -D _NEURAGHE_ -D _ARM_ -DNEURAGHE_DMA=$(NEURAGHE_DMA)
	TYPE_FLAGS = -D _FIXED8_ -D _FIXED_
endif

RM = rm -rf
CP = cp

OBJ_DIR = $(ROOT)/obj
LIB_DIR = $(ROOT)/lib
SRC_DIR = $(ROOT)/src

OBJ = obj
BIN = bin
LIB = lib

HEADERS_DIR = $(ROOT)/include
NET_DIR = $(SRC_DIR)/net
MOD_DIR = $(SRC_DIR)/mod
APP_DIR = $(SRC_DIR)/app
SOC_DIR = $(SRC_DIR)/soc

SRCS +=\
$(SRC_DIR) \
$(HEADERS_DIR) \
$(NET_DIR) \
$(MOD_DIR) \
$(APP_DIR) \
$(SOC_DIR)

DEPFLAGS = -MT $@ -MMD -MP -MF $(OBJ_DIR)/$*.d
