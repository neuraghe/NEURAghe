#ifndef IMAGENET_H
#define IMAGENET_H

#include "types.h"

RET printTopN(float* output, unsigned int* pos, SIZE length, SIZE n, bool class_name = true);

#endif
