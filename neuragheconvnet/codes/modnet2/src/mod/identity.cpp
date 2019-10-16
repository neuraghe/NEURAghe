#include "identity.h"

RET identity_forward_sw(DATA* input, DATA* output, SIZE size[3]);

RET identity_forward(DATA* input, DATA* output, SIZE size[3]) {

	identity_forward_sw(input, output, size);

	return OK;
}

RET identity_forward_sw(DATA* input, DATA* output, SIZE size[3]) {

	ITER i = 0;
	SIZE memsize = size[0]*size[1]*size[2];
	for(i = 0; i < memsize; i++) {
		DATA v = input[i];
		output[i] = v;
	}

	return OK;
}
