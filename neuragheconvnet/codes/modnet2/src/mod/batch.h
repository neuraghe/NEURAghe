#ifndef BATCH_H
#define BATCH_H

#include "types.h"
#include "spatconv.h"

typedef struct Batch* BATCH;

BATCH batch_create(void);

RET batch_forward(BATCH bat, DATA* input, DATA* output, SIZE size[3]);

RET batch_init(BATCH bc, NAME weightsFile, NAME biasFile, NAME meanFile,
		NAME varFile, SIZE planes);

RET batch_destroy(BATCH bat);

struct Batch {
	DATA* weights;
	DATA* bias;
	DATA* mean;
	DATA* var;
	VARSIZE pin;
	int qf;
};

#endif
