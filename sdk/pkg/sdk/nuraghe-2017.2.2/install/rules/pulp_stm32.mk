
###################################################

# Check for valid float argument
# NOTE that you have to run make clan after
# changing these as hardfloat and softfloat are not
# binary compatible
ifneq ($(FLOAT_TYPE), hard)
ifneq ($(FLOAT_TYPE), soft)
override FLOAT_TYPE = hard
#override FLOAT_TYPE = soft
endif
endif

###################################################

ifneq ($(COMP_TYPE), debug) #COMP_TYPE=release for -02 otherwise -O0 -Wall -g
ifneq ($(COMP_TYPE), release)
#override COMP_TYPE = release
override COMP_TYPE = debug
endif
endif

###################################################

ifneq ($(CPU_TYPE), cortex-m3) 
ifneq ($(CPU_TYPE), cortex-m4)
#override CPU_TYPE = cortex-m3
override CPU_TYPE = cortex-m4
endif
endif

###################################################

PULP_APP_SRCS += $(PULP_SDK_HOME)/install/stm32/src/startup_stm32f4xx.s $(PULP_SDK_HOME)/install/stm32/src/stm32f4xx_it.c $(PULP_SDK_HOME)/install/stm32/src/system_stm32f4xx.c $(PULP_SDK_HOME)/install/stm32/src/syscalls.c $(PULP_SDK_HOME)/install/stm32/src/usbd_usr.c $(PULP_SDK_HOME)/install/stm32/src/usbd_cdc_vcp.c $(PULP_SDK_HOME)/install/stm32/src/usbd_desc.c $(PULP_SDK_HOME)/install/stm32/src/usb_bsp.c


CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy
SIZE=arm-none-eabi-size

#ifeq ($(COMP_TYPE), debug)
#	PULP_CFLAGS += -O0 -Wall -g
#else
#	PULP_CFLAGS += -O2 -g
#endif

ifeq ($(CPU_TYPE), cortex-m3)
	PULP_CFLAGS += -march=armv7-m -mcpu=cortex-m3 -mtune=cortex-m3
	override FLOAT_TYPE = soft
else
	PULP_CFLAGS += -march=armv7e-m -mcpu=cortex-m4 -mtune=cortex-m4 
endif


PULP_CFLAGS += -std=gnu99 -T$(PULP_SDK_HOME)/install/stm32/src/stm32_flash.ld
PULP_CFLAGS += -mlittle-endian -mthumb -mthumb-interwork -nostartfiles -fdata-sections -ffunction-sections

#Suppress WARNINGS PULP_CFLAGS
PULP_CFLAGS += -Wno-unused-variable -Wno-pointer-sign -Wno-unknown-pragmas -Wno-unused-but-set-variable

ifeq ($(FLOAT_TYPE), hard)
PULP_CFLAGS += -fsingle-precision-constant -Wdouble-promotion
PULP_CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=hard
else
PULP_CFLAGS += -msoft-float
endif

PULP_CFLAGS += -I$(PULP_SDK_HOME)/install/stm32/include $(PULP_INC_PATHS) $(PULP_DEFS)


PULP_LDFLAGS += -L$(PULP_SDK_HOME)/install/stm32/lib/$(CPU_TYPE)-$(FLOAT_TYPE) -lm -lstdperiph -lusbdevcore -lusbdevcdc -lusbcore


clean:
	rm -f $(APP)

all:
	$(CC) $(PULP_CFLAGS) $(PULP_APP_SRCS) $(PULP_APP_OMP_SRCS) -o $(PULP_APP) $(PULP_LDFLAGS)

run:
	pulp-run --platform=stm32 --binary=$(PULP_APP)
