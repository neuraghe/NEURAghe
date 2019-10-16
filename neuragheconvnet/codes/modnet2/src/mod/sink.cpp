#pragma GCC diagnostic ignored "-Wformat"
#include "sink.h"

RET sink_forward(DATA* input, SIZE in_s[3]) {

	ITER i = 0;
	for(i = 0; i < in_s[2]*in_s[1]*in_s[0]; i++) {
		printf("%1.6f\t", input[i]); //in[pin][hin][win]);
	}

	_rprintf_("Tensor of size %lu %lu %lu\n", in_s[0], in_s[1], in_s[2]);

	return OK;
}

RET sink_compare(DATA* input, DATA* compare, SIZE in_s[3], int qf) {

	double err = 0;
	double max = 0;
	double err_sq = 0;
	double err_sum = 0;
	ITER pin = 0;
	ITER hin = 0;
	ITER win = 0;

	VARSIZE maxpos[3] = { 0, 0, 0 };

	for (pin = 0; pin < in_s[0]; pin++) {
		for (hin = 0; hin < in_s[1]; hin++) {
			for (win = 0; win < in_s[2]; win++) {

				float inD = (float)FIXED2FLOAT(input[(pin*in_s[1] + hin)*in_s[2] + win], qf);
				float comD = (float)FIXED2FLOAT(compare[(pin*in_s[1] + hin)*in_s[2] + win], qf);

				err = (double) inD - comD;
				err_sq = err * err;
				if (err_sq > max) {
					max = err_sq;
					maxpos[0] = pin;
					maxpos[1] = hin;
					maxpos[2] = win;
				}
				err_sum += err_sq;
			}
		}
	}

	_rprintf_("Tensor of size %lu %lu %lu\n", in_s[0], in_s[1], in_s[2]);
	_rprintf_("total squared distance %1.4f\n", err_sum);
	_rprintf_("average squared distance %1.6f\n",
			err_sum / (in_s[0] * in_s[1] * in_s[2]));
	_rprintf_("maximum squared distance %1.6f\n", max);
	_rprintf_("maximum error at %lu %lu %lu\n", maxpos[0], maxpos[1], maxpos[2]);
	return OK;
}
