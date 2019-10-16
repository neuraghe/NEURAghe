include definitions.mk

VPATH = $(SRCS) ../3rdparty/gsl
INC_DIR = $(SRCS)

INC_PATH =\
$(INC_DIR) \
../3rdparty/gsl \
../3rdparty/libjpeg

LOAD_PATH =\
$(LIB_DIR) \
../3rdparty/gsl \
../3rdparty/libjpeg # is already in system...

INC = $(patsubst %,-I %,$(INC_PATH))
LOAD = $(patsubst %,-L %,$(LOAD_PATH))

# DUMP_F = paramIO
# DUMP_O = $(patsubst %,$(OBJ)/%.o,$(DUMP_F))

MODULES =\
relu\
sink\
source\
identity\
batch\
lrnorm\
maxpool\
maxpool_f32\
maxpool_fp16\
maxpool_fp8\
add\
avgpool\
linear\
linear_f32\
linear_fp16\
linear_fp8\
spatconv

MODULES_U =  $(shell echo $(MODULES) | tr '[:lower:]' '[:upper:]')
MODFLAGS = $(patsubst %,-D %_D,$(MODULES_U))

#MODNET_F =
#MODNET_O = $(patsubst %,$(OBJ)/%.so,$(MODNET_F))

ifeq ($(NEURAGHE),1)
SOC_F =\
heap_4\
neumem\
soc_drivers\
ConvLayer\
spatconv_hw
endif

ifeq ($(NEURAGHE8),1)
SOC_F =\
heap_4\
neumem\
soc_drivers\
ConvLayer\
spatconv_hw
endif

MAIN_F =\
$(SOC_F)\
imageUtils\
paramIO\
imagenet\
types\
channel\
neuconvnet\
$(MODULES)
MAIN_O = $(patsubst %,$(OBJ)/%.o,$(MAIN_F))

ifeq ($(SANITIZE),1)
	MAIN_SO = asan
endif
MAIN_SO += m pthread

ifeq ($(ARM),1)
MAIN_A = jpeg_arm gsl_arm
else
MAIN_A = jpeg gsl
endif

MAIN_LSO = $(patsubst %, -l%,$(MAIN_SO))
MAIN_LA = $(patsubst %, -l%,$(MAIN_A))

