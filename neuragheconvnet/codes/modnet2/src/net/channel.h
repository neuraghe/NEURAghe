#ifndef CHANNEL_H
#define CHANNEL_H

#include "types.h"

typedef struct Channel* CHANNEL;

CHANNEL chan_create(SIZE in_s[3], SIZE pad[2], SIZE weff);

DATA* chan_getData(CHANNEL ch);

RET chan_clear(CHANNEL ch);

RET chan_set(CHANNEL ch, DATA* data);

VARSIZE* chan_getSize(CHANNEL ch);

RET chan_write(CHANNEL ch, DATA* input, SIZE in_s[3]);

RET chan_read(CHANNEL ch, DATA* output, SIZE out_s[3], SIZE stride[2]);

RET chan_destroy(CHANNEL ch);

#endif
