#include "source.h"

#include "app/imageUtils.h"

#define MIN(a,b) (((a)<(b))?(a):(b))

RET source_forward(NAME filename, DATA* output, SIZE out_s[3], int qf) {

	SIZE ndata = out_s[0] * out_s[2] * out_s[2];
	ITER i = 0;

	float* a = NULL;
	float* b = NULL;
	VARSIZE a_size[3] = { 0 };
	VARSIZE b_size[3] = { 0 };

	_tcreate_(time);
	
	
	FILE* fp;
	int size;
	do {
	  fp = fopen( filename,"r" );
	  size=0;
	  if (NULL != fp) {
            fseek (fp, 0, SEEK_END);
            size = ftell(fp);

          }
          fclose(fp);
	} while (0 == size);
	
	
	
	loadImage(filename, a_size, &a);

	if(out_s[0] == 3) {
		interpol_scale(&a, &b, a_size, b_size, 256);

		normalize(&b, &a, b_size);

		assignSize(a_size, b_size, 3);

		crop(&a, &b, a_size, b_size, out_s[2]);
	}
	else
		b = a;

	if (sizeof(DATA) != sizeof(float)) {
		for (i = 0; i < ndata; i++) {
			output[i] = (DATA)(FLOAT2FIXED(b[i], qf));
//			printf("output[%d] --> %+3.10f --> fixed: %d  -->  %+3.10f\n", i, b[i], output[i], FIXED2FLOAT(output[i])); 
		}
	} else {
		memcpy(output, b, ndata * sizeof(float));
	}

	free(a);
	if(out_s[0] == 3)
		free(b);

	_tprintf_("\tsource_forward: %5.3f ms\n", (get_wall_time()-time)/1000);
	return OK;
}

