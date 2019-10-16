#include "paramIO.h"

int dump_float(const char* filename, size_t arraysize, float* array,
bool verbose) {
	size_t i = 0;
	if (verbose) {
		for (i = 0; i < arraysize; i++) {
			if (i % 7 == 0) {
				printf("\n");
			}
			printf("%1.4e\t", array[i]);
		}
		printf("\n");
	}
	FILE* fh = fopen(filename, "wb+");
	fwrite(array, sizeof(float), arraysize, fh);
	fclose(fh);
	return 0;
}

int dump_double(const char* filename, size_t arraysize, double* array,
bool verbose) {
	size_t i = 0;
	if (verbose) {
		for (i = 0; i < arraysize; i++) {
			if (i % 7 == 0) {
				printf("\n");
			}
			printf("%1.4e\t", array[i]);
		}
		printf("\n");
	}
	FILE* fh = fopen(filename, "wb+");
	fwrite(array, sizeof(double), arraysize, fh);
	fclose(fh);
	return 0;
}

int dump_data(const char* filename, size_t arraysize, DATA* array, int qf,
bool verbose) {
	size_t i = 0;
	if (verbose) {
		for (i = 0; i < arraysize; i++) {
			if (i % 8 == 0) {
				printf("\n");
				printf("[%5d] ", i);
			}
			printf("%3.10f\t", (float)(FIXED2FLOAT(array[i], qf)));
		}
		printf("\n");
	}
	FILE* fh = fopen(filename, "wb+");
	fwrite(array, sizeof(DATA), arraysize, fh);
	fclose(fh);
	return 0;
}

long long int checksum (DATA* data, int size){
  long long int sum = 0;

  for(int i=0; i<size; i++){
        sum += data[i];
  }

  return sum;
}

long long int checksum_abs (DATA* data, int size){
  long long int sum = 0;

  for(int i=0; i<size; i++){
     if (data[i]>0)
        sum += data[i];
     else        
        sum -= data[i];
  }

  return sum;
}

float checksum_f32 (float* data, int size){
  float sum = 0;

  for(int i=0; i<size; i++){
        sum += data[i];
  }

  return sum;
}


long long int checksum_fp16 (int16_t* data, int size){
  long long int sum = 0;

  for(int i=0; i<size; i++){
        sum += data[i];
  }

  return sum;
}

RET load_float(const char* filename, size_t arraysize, float* array) {
	FILE* fh = NULL;
	size_t read = 0;

	fh = fopen(filename, "rb");
	ASSERT(fh, "file not found, filename = %s", filename);
	read = fread(array, sizeof(float), arraysize, fh);
	ASSERT(read == arraysize, "%s", "data input was not large enough");
	fclose(fh);
	return OK;
}

RET load_double(const char* filename, size_t arraysize, double* array) {
	FILE* fh = NULL;
	size_t read = 0;

	fh = fopen(filename, "rb");
	ASSERT(fh, "file not found, filename = %s", filename);
	read = fread(array, sizeof(double), arraysize, fh);
	ASSERT(read == arraysize, "%s", "data input was not large enough");
	fclose(fh);
	return OK;
}

RET load_double2float(const char* filename, size_t arraysize, float* array) {
	FILE* fh = NULL;
	unsigned int i = 0;
	size_t read = 0;
	double* buffer = (double *)calloc(arraysize, sizeof(double));

	fh = fopen(filename, "rb");
	ASSERT(fh, "file not found, filename = %s", filename);
	read = fread(buffer, sizeof(double), arraysize, fh);
	ASSERT(read == arraysize, "%s", "data input was not large enough");
	fclose(fh);

	for (i = 0; i < arraysize; i++) {
		array[i] = (float) buffer[i];
	}
	free(buffer);
	return OK;
}

RET load_fixed(const char* filename, size_t arraysize, DATA* array) {
	FILE* fh = NULL;
	//unsigned int i = 0;
	size_t read = 0;
	
	fh = fopen(filename, "rb");
	ASSERT(fh, "file not found, filename = %s", filename);
	read = fread(array, sizeof(DATA), arraysize, fh);
	ASSERT(read == arraysize, "%s %s %d %d", "data input was not large enough: ", filename, read, arraysize);
	fclose(fh);

	return OK;
}

RET load_fixed_16bit(const char* filename, size_t arraysize, short int* array) {
	FILE* fh = NULL;
	//unsigned int i = 0;
	size_t read = 0;
	
	fh = fopen(filename, "rb");
	ASSERT(fh, "file not found, filename = %s", filename);
	read = fread(array, sizeof(short int), arraysize, fh);
	ASSERT(read == arraysize, "%s %s %d %d", "data input was not large enough: ", filename, read, arraysize);
	fclose(fh);

	return OK;
}

#ifdef _HALFFLOAT_
RET load_double2halffloat(const char* filename, size_t arraysize, __fp16* array)
{
	FILE* fh = NULL;
	unsigned int i = 0;
	size_t read = 0;
	double* buffer = calloc(arraysize, sizeof(double));

	fh = fopen(filename, "rb");
	ASSERT(fh, "file not found, filename = %s", filename);
	read = fread(buffer, sizeof(double), arraysize, fh);
	ASSERT(read == arraysize, "%s", "data input was not large enough");
	fclose(fh);

	for(i = 0; i < arraysize; i ++)
	{
		array[i] = (__fp16) buffer[i];
	}

	free(buffer);
	return OK;
}
#endif

