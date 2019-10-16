#include "types.h"
#include "app/paramIO.h"
#include "math.h"
#include <time.h>
#include <sys/time.h>


int equalSize(SIZE* a, SIZE* b, SIZE nelements) {
	int res = 0;
	res = memcmp(a, b, nelements * sizeof(SIZE));
	return res == 0 ? 1 : 0;
}

RET assignSize(VARSIZE* target, SIZE* source, SIZE nelements) {
	memcpy(target, source, nelements * sizeof(SIZE));
	return OK;
}

RET loadData(const char* filename, size_t arraysize, DATA* array) {
#ifdef _HALFFLOAT_
	load_double2halffloat(filename, arraysize, array);
#else
	#ifdef _FIXED_
		load_fixed(filename, arraysize, array);
	#else
		load_double2float(filename, arraysize, array);
	#endif
#endif
	return OK;
}

RET load_f62tof32_from_file(float* array, const char* filename, size_t arraysize) {
	load_double2float(filename, arraysize, array);
	return OK;
}

RET load_f62tofp16_from_file(int16_t* array, const char* filename, size_t arraysize) {
	load_fixed_16bit(filename, arraysize, array);
	return OK;
}

RET load_f62tofp8_from_file(DATA* array, const char* filename, size_t arraysize) {
	load_fixed(filename, arraysize, array);
	return OK;
}
unsigned long get_wall_time(void) {
	struct timeval time;
	unsigned long ret;
	gettimeofday(&time, NULL);
	ret = (unsigned long) time.tv_sec * 1000000 + time.tv_usec;
	return ret;
}
