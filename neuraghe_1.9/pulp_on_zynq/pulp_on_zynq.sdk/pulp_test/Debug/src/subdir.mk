################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/helloworld.c \
../src/helloworld_stresstest.c \
../src/platform.c \
../src/soc_drivers.c 

OBJS += \
./src/helloworld.o \
./src/helloworld_stresstest.o \
./src/platform.o \
./src/soc_drivers.o 

C_DEPS += \
./src/helloworld.d \
./src/helloworld_stresstest.d \
./src/platform.d \
./src/soc_drivers.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../pulp_test_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


