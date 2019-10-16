#!/bin/bash

wget https://ftp.gnu.org/gnu/gsl/gsl-2.3.tar.gz
tar xf gsl-2.3.tar.gz
mv gsl-2.3 gsl
cd gsl

# compile gsl for ARM
./configure --host=arm-linux-gnueabihf CC='arm-linux-gnueabihf-gcc' CFLAGS='-O3 -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -ftree-vectorize -mvectorize-with-neon-quad -fprefetch-loop-arrays' --enable-static
make -j8
cp .libs/libgsl.a libgsl_arm.a
make clean

# compile gsl for x86_64
./configure --enable-static
make -j8
cp .libs/libgsl.a libgsl.a
make clean

#create hyperlinks
cd gsl
make -j8
cd ..

cd ..
rm gsl-2.3.tar.gz
