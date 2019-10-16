################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cnn_layers/ConvLayer.c \
../src/cnn_layers/DebuggingFunctionSet.c \
../src/cnn_layers/FullLayer.c \
../src/cnn_layers/PoolLayer.c \
../src/cnn_layers/SoftmaxLayer.c \
../src/cnn_layers/types.c 

OBJS += \
./src/cnn_layers/ConvLayer.o \
./src/cnn_layers/DebuggingFunctionSet.o \
./src/cnn_layers/FullLayer.o \
./src/cnn_layers/PoolLayer.o \
./src/cnn_layers/SoftmaxLayer.o \
./src/cnn_layers/types.o 

C_DEPS += \
./src/cnn_layers/ConvLayer.d \
./src/cnn_layers/DebuggingFunctionSet.d \
./src/cnn_layers/FullLayer.d \
./src/cnn_layers/PoolLayer.d \
./src/cnn_layers/SoftmaxLayer.d \
./src/cnn_layers/types.d 


# Each subdirectory must supply rules for building sources it contributes
src/cnn_layers/%.o: ../src/cnn_layers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../nuraghe_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


