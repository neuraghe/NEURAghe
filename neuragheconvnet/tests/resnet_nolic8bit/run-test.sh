#!/bin/bash
BITSTREAM="-b zynq/neuraghe-latest.bin"
./main -c weights -i Imgs -p 3 -h 224 -w 224 -o 1000  $BITSTREAM
