#ifndef SRC_APP_PARAMIO_H_
#define SRC_APP_PARAMIO_H_

#include <stdio.h>
#include <stdbool.h>
#include "xos.h"
#include "xassert.h"

#include "types.h"

int dump_float(const char* filename, size_t arraysize, float* array, bool verbose);
int dump_double(const char* filename, size_t arraysize, double* array, bool verbose);
int dump_data(const char* filename, size_t arraysize, DATA* array, int qf, bool verbose);
long long int checksum (DATA* data, int size);
long long int checksum_abs (DATA* data, int size);
float checksum_f32 (float* data, int size);
long long int checksum_fp16 (int16_t* data, int size);
RET load_float(const char* filename, size_t arraysize, float* array);
RET load_double(const char* filename, size_t arraysize, double* array);
RET load_double2float(const char* filename, size_t arraysize, float* array);
RET load_fixed(const char* filename, size_t arraysize, DATA* array);
RET load_fixed_16bit(const char* filename, size_t arraysize, short int* array);
#ifdef _HALFFLOAT_
RET load_double2halffloat(const char* filename, size_t arraysize, __fp16* array);
#endif

#endif /* SRC_APP_PARAMIO_H_ */
