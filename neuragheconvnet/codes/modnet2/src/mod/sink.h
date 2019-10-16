#ifndef SINK_H
#define SINK_H

#include "types.h"

RET sink_forward(DATA* input, SIZE in_s[3]);

RET sink_compare(DATA* input, DATA* compare, SIZE in_s[3]);

#endif
