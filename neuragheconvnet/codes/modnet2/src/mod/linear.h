#ifndef LINEAR_H
#define LINEAR_H

#include "types.h"

struct Linear {
	DATA* weights;
	DATA* bias;
	VARSIZE in_s;
	VARSIZE out_s;
	int qf;
};

typedef struct Linear* LINEAR;

LINEAR linear_create(void);

RET linear_init(LINEAR lin, NAME weightsFile, NAME biasFile, SIZE in_s,
		SIZE out_s);

RET linear_forward(LINEAR lin, DATA* input, DATA* output, SIZE in_s,
		SIZE out_s);

RET linear_destroy(LINEAR lin);

#endif
