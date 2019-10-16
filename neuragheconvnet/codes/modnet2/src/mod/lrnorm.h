#ifndef LRNORM_H
#define LRNORM_H

#include "types.h"
#include "spatconv.h"

typedef struct Lrn* LRN;

LRN lrn_create(void);

RET lrn_forward(LRN ln, DATA* input, DATA* output, SIZE size[3]);

RET lrn_forward_sw_core(DATA* input, DATA* output, SIZE size[3],
		DATA window, DATA alpha, DATA beta, DATA bias, int qf);

RET lrn_destroy(LRN ln);

struct Lrn {
	DATA window;
	DATA alpha;
	DATA beta;
	DATA bias;
	VARSIZE pin;
	int qf;
};

#endif
