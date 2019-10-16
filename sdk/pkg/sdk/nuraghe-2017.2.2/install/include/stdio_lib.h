#ifndef __STDIO_H__
#define __STDIO_H__

#include "pulp.h"
#include <stddef.h>

#define FILE int
#define EOF 0xFFFFFFFF

FILE *fopen(const char *filename, const char *mode);
int   fclose(FILE *stream);
size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);

int fprintf(FILE* stream, const char *format, ...);
int printf(const char *format, ...);

#endif
