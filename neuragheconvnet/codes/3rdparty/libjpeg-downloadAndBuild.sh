#!/bin/bash

wget http://www.ijg.org/files/jpegsrc.v9.tar.gz
tar xf jpegsrc.v9.tar.gz
rm jpegsrc.v9.tar.gz
mv jpeg-9 libjpeg
cd libjpeg

#sed -i 's/\r$//' configure

./configure --host=arm-linux-gnueabihf CC='arm-linux-gnueabihf-gcc' CFLAGS='-O3 -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -ftree-vectorize -mvectorize-with-neon-quad -fprefetch-loop-arrays' --enable-static 
#sed -i 's/LIBTOOL = .\/libtool/LIBTOOL = libtool/g' Makefile
make -j8
cp .libs/libjpeg.a libjpeg_arm.a
make clean


./configure --enable-static 
#sed -i 's/LIBTOOL = .\/libtool/LIBTOOL = libtool/g' Makefile
make -j8
cp .libs/libjpeg.a libjpeg.a
#make clean # otherwise libjpeg.a is deleted

cd ..
