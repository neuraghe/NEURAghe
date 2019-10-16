#include "channel.h"

struct Channel {
	DATA* channel;
	VARSIZE size[4];
	VARSIZE pad[2];
	VARSIZE weff;
};

CHANNEL chan_create(SIZE in_s[3], SIZE pad[2], SIZE weff) {
	SIZE nplanes = in_s[0];
	SIZE nchan = in_s[2] / weff;
	SIZE hchan = in_s[1];
	SIZE wchan = weff + 2 * pad[1];
	SIZE ndata = nplanes * nchan * hchan * wchan;

	CHANNEL ch = (CHANNEL) calloc(1, sizeof(struct Channel));
	ch->channel = (DATA*) calloc(ndata, sizeof(DATA));

	SIZE sz[] = { nchan, hchan, nplanes, wchan };
	assignSize(ch->size, sz, 4);
	assignSize(ch->pad, pad, 2);
	ch->weff = weff;

	return ch;
}

DATA* chan_getData(CHANNEL ch) {
	return ch->channel;
}

RET chan_clear(CHANNEL ch) {
	SIZE ndata = ch->size[0] * ch->size[1] * ch->size[2] * ch->size[3];
	SIZE memsize = ndata * sizeof(DATA);
	memset(ch->channel, 0, memsize);
	return OK;
}

RET chan_set(CHANNEL ch, DATA* bias) {

	//DATA (*chan)[ch->size[1]][ch->size[2]][ch->size[3]] =
	//		(DATA (*)[ch->size[1]][ch->size[2]][ch->size[3]]) &ch->channel[0];

	ITER plane = 0;
	ITER nchan = 0;
	ITER hchan = 0;
	ITER wchan = 0;
	for (nchan = 0; nchan < ch->size[0]; nchan++) {
		for (hchan = 0; hchan < ch->size[1]; hchan++) {
			for (plane = 0; plane < ch->size[2]; plane++) {
				for (wchan = 0; wchan < ch->size[3]; wchan++) {
					ch->channel[((nchan*ch->size[1] + hchan)*ch->size[2] + plane)*ch->size[3] + wchan] = bias[plane];
					//chan[nchan][hchan][plane][wchan] = bias[plane];
				}
			}
		}
	}
	return OK;
}

VARSIZE* chan_getSize(CHANNEL ch) {
	return ch->size;
}

RET chan_write(CHANNEL ch, DATA* input, SIZE in_s[3]) {
	ITER plane = 0;
	ITER nchan = 0;
	ITER hchan = 0;
	ITER wchan = 0;
	ITER hin = 0;
	ITER win = 0;
	SIZE semipad = (ch->weff + ch->pad[1]) * sizeof(DATA);
	SIZE fullpad = (ch->weff + 2 * ch->pad[1]) * sizeof(DATA);
	SIZE nopad = ch->weff * sizeof(DATA);

	//DATA (*chan)[ch->size[1]][ch->size[2]][ch->size[3]] =
	//		(DATA (*)[ch->size[1]][ch->size[2]][ch->size[3]]) &ch->channel[0];

	//DATA (*in)[in_s[1]][in_s[2]] = (DATA (*)[in_s[1]][in_s[2]]) &input[0];

	/* if only one channel */
	if (ch->size[0] == 1) {
		/* zero pad on left side, zero pad right side */
		wchan = ch->pad[1];
		for (plane = 0; plane < in_s[0]; plane++) {
			for (hin = 0; hin < in_s[1]; hin++) {
				hchan = hin;
				memcpy(&ch->channel[(hchan*ch->size[2] + plane)*ch->size[3] + wchan], &input[(plane*in_s[1] + hin)*in_s[2] + 0], nopad);
				//memcpy(&chan[0][hchan][plane][wchan], &in[plane][hin][0], nopad);
			}
		}
	} else {
		/* for all data on left side copy into channel 0 */
		/* zero pad on left side, data pad right side */
		wchan = ch->pad[1];
		for (plane = 0; plane < in_s[0]; plane++) {
			for (hin = 0; hin < in_s[1]; hin++) {
				hchan = hin;
				memcpy(&ch->channel[(hchan*ch->size[2] + plane)*ch->size[3] + wchan], &input[(plane*in_s[1] + hin)*in_s[2] + 0], semipad);
				//memcpy(&chan[0][hchan][plane][wchan], &in[plane][hin][0], semipad);
			}
		}

		/* for all data in center */
		/* data pad on both sides */
		for (plane = 0; plane < in_s[0]; plane++) {
			for (nchan = 1; nchan < ch->size[0] - 1; nchan++) {
				win = nchan * ch->weff - ch->pad[1];
				for (hin = 0; hin < in_s[1]; hin++) {
					hchan = hin;
					memcpy(&ch->channel[((nchan*ch->size[1] + hchan)*ch->size[2] + plane)*ch->size[3] + 0], &input[(plane*in_s[1] + hin)*in_s[2] + win], fullpad);
					//memcpy(&chan[nchan][hchan][plane][0], &in[plane][hin][win], fullpad);
				}
			}
		}

		/* for all data on right side copy into last channel */
		/* data pad on left side, zero pad right side */
		nchan = ch->size[0] - 1;
		win = nchan * ch->weff - ch->pad[1];
		for (plane = 0; plane < in_s[0]; plane++) {
			for (hin = 0; hin < in_s[1]; hin++) {
				hchan = hin;
				memcpy(&ch->channel[((nchan*ch->size[1] + hchan)*ch->size[2] + plane)*ch->size[3] + 0], &input[(plane*in_s[1] + hin)*in_s[2] + win], semipad);
				//memcpy(&chan[nchan][hchan][plane][0], &in[plane][hin][win], semipad);
			}
		}
	}

	return OK;
}

RET chan_read(CHANNEL ch, DATA* output, SIZE out_s[3], SIZE stride[2]) {
	ITER nchan = 0;
	ITER hchan = 0;
	ITER wchan = 0;
	ITER hout = 0;
	ITER wout = 0;
	ITER plane = 0;
	SIZE memsize = ch->weff * sizeof(DATA);

	//DATA (*chan)[ch->size[1]][ch->size[2]][ch->size[3]] =
	//		(DATA (*)[ch->size[1]][ch->size[2]][ch->size[3]]) &ch->channel[0];

	//DATA (*out)[out_s[1]][out_s[2]] = (DATA (*)[out_s[1]][out_s[2]]) &output[0];

	/* if not strided, every value is valid */
  SIZE sz[] = { 1, 1 };
	if (equalSize(stride, sz, 2)) {
		/* read from center zone only */
		wchan = ch->pad[1];
		for (plane = 0; plane < out_s[0]; plane++) {
			for (nchan = 0; nchan < ch->size[0]; nchan++) {
				wout = nchan * ch->weff;
				for (hout = 0; hout < out_s[1]; hout++) {
					hchan = hout;
					//
					memcpy(&output[(plane*out_s[1] + hout)*out_s[2] + wout], &ch->channel[((nchan*ch->size[1] + hchan)*ch->size[2] + plane)*ch->size[3] + wchan], memsize);
					//memcpy(&out[plane][hout][wout], &chan[nchan][hchan][plane][wchan], memsize);
				}
			}
		}
	} else { /* if strided, strip away all those invalid values */
		for (plane = 0; plane < out_s[0]; plane++) {
			for (nchan = 0; nchan < ch->size[0]; nchan++) {
				for (hchan = 0; hchan < ch->size[1]; hchan += stride[0]) {
					hout = hchan / stride[0];
					for (wchan = nchan % 2; wchan < ch->size[3]; wchan +=
							stride[1]) {
						wout = (nchan * ch->weff + wchan) / stride[1];
						output[(plane*out_s[1] + hout)*out_s[2] + wout] = ch->channel[((nchan*ch->size[1] + hchan)*ch->size[2] + plane)*ch->size[3] + wchan];
						//out[plane][hout][wout] = chan[nchan][hchan][plane][wchan];
					}
				}
			}
		}
	}
	return OK;
}

RET chan_destroy(CHANNEL ch) {
	free(ch->channel);
	free(ch);
	return OK;
}
