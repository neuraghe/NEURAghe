#!/bin/bash
h=".h"
for f in ./*.bin
do
  ./zynq_setup $f ${f/.bin/_l2.h}
done
