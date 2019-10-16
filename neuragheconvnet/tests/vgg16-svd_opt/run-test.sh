#!/bin/bash
BITSTREAM="-b zynq/neuraghe-latest.bin"
if [ $1 -gt 0 ]; then
	BITSTREAM="-b zynq/neuraghe-ddma-latest.bin"
fi
./main -c weights -i Imgs -p 3 -h 224 -w 224 -o 1000  $BITSTREAM