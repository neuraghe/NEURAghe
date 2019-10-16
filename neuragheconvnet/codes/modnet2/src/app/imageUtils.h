#ifndef SRC_APP_IMAGEUTILS_H_
#define SRC_APP_IMAGEUTILS_H_

#define DATA_IM float

#include "types.h"

RET crop(float** input, float** output, VARSIZE insize[3], VARSIZE outsize[3],
		SIZE cropsize);

RET interpol_scale(float** source, float** target, VARSIZE insize[3],
		VARSIZE outsize[3], SIZE shortest_dim);

RET normalize(float** input, float** output, SIZE size[3]);

RET interpolate(double* source, double* target, SIZE insize[3], SIZE outsize[3]);

RET loadImage(NAME filename, VARSIZE size[3], float** bufferH);

RET loadImage2(NAME filename);

void print_data(DATA * data, int size, const char*filename);

#endif
