include definitions.mk

VPATH = $(SRCS) codes/3rdparty/gsl
INC_DIR = $(SRCS)

INC_PATH =\
$(INC_DIR) \
codes/3rdparty/gsl \
codes/3rdparty/libjpeg

LOAD_PATH =\
$(LIB_DIR) \
codes/3rdparty/gsl \
codes/3rdparty/libjpeg # is already in system...

INC = $(patsubst %,-I %,$(INC_PATH))
LOAD = $(patsubst %,-L %,$(LOAD_PATH))

ifeq ($(SANITIZE),1)
	MAIN_SO = asan
endif
MAIN_SO += m pthread

ifeq ($(ARM),1)
MAIN_A = neuconvnet-$(ARCH)$(TYPE)$(VERSION) jpeg_arm gsl_arm
else
MAIN_A = neuconvnet-$(ARCH)$(TYPE)$(VERSION) jpeg gsl
endif

MAIN_LSO = $(patsubst %, -l%,$(MAIN_SO))
MAIN_LA = $(patsubst %, -l%,$(MAIN_A))
