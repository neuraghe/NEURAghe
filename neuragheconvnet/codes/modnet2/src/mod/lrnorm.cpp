#include "lrnorm.h"

#include "xassert.h"
#include "math.h"

#define min(a,b) (a < b ? a : b)
#define max(a,b) (a > b ? a : b)

LRN lrn_create(void) {
	LRN ln = (LRN) calloc(1, sizeof(struct Lrn));
	return ln;
}

RET lrn_forward(LRN ln, DATA* input, DATA* output, SIZE size[3]) {
	ASSERT(size[0] == ln->pin, "%s", "input planes do not match");

	_tcreate_(time);	
	lrn_forward_sw_core(input, output, size, ln->window, ln->alpha,
			ln->beta, ln->bias, ln->qf);
	_tprintf_(YELLOW "LRN time: %5.3f ms\n" NC, (get_wall_time()-time)/1000);

	return OK;
}

RET lrn_forward_sw_core(DATA* input, DATA* output, SIZE size[3],
		DATA window, DATA alpha, DATA beta, DATA bias, int qf) {

	ITER N = size[0];
	ITER pin = 0;
	ITER hin = 0;
	ITER win = 0;
	ITER fin = 0;
	ITER jlow = 0;
	ITER jhigh = 0;

#ifdef _FIXED_
	long long int square_sum = 0; //, tmp = 0;
	float current = 0;
	float win_term = 0;
	//float base = 0;
	//float exp = 0;
#else
	DATA square_sum = 0;
	DATA current = 0;
	DATA win_term = 0;
#endif

	for (pin = 0; pin < N; pin++) {
		
		for (hin = 0; hin < size[1]; hin++) {
			for (win = 0; win < size[2]; win++) {

			#ifdef _FIXED_
				current = FIXED2FLOAT(input[(pin*size[1] + hin)*size[2] + win], qf);
			#else				
				current = input[(pin*size[1] + hin)*size[2] + win];
			#endif

			jlow = max(0, (signed int)pin-window/2);
			jhigh = min((signed int)N-1, (signed int)pin+window/2);

			for (fin = jlow; fin < jhigh+1; fin++){
				win_term = input[(fin*size[1] + hin)*size[2] + win]; 	
				square_sum += win_term * win_term; 
			}

			#ifdef _FIXED_
			//	tmp = (long long int)((bias << qf) + alpha * square_sum) >> qf;
			//	base = FIXED2FLOAT(tmp, qf);
			//	exp = FIXED2FLOAT(beta, qf);
				output[(pin*size[1] + hin)*size[2] + win] = FLOAT2FIXED(current / pow(bias + alpha * square_sum, beta), qf);
			#else
				output[(pin*size[1] + hin)*size[2] + win] = current / pow(bias + alpha * square_sum, beta);
			#endif
			}
		}
	}

	return OK;
}

RET lrn_destroy(LRN ln) {
	free(ln);
	return OK;
}
