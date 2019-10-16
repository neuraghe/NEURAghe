#include "imageUtils.h"
#include "gsl/gsl_interp2d.h"
#include "jpeglib.h"
#include "assert.h"

RET crop(float** input, float** output, VARSIZE insize[3], VARSIZE outsize[3],
		SIZE cropsize) {
	float* in = *input;
	float* out = *output;

	ITER pout = 0;
	ITER hout = 0;
	ITER wout = 0;

	outsize[0] = insize[0];
	outsize[1] = cropsize;
	outsize[2] = cropsize;

	SIZE cropped[2] = { (insize[1] - outsize[1] + 1) / 2, (insize[2] - outsize[2] + 1) / 2 };

	out = (float*) realloc(out, outsize[0]*outsize[1]*outsize[2]*sizeof(float));

	//float (*o)[outsize[1]][outsize[2]] = (float (*)[outsize[1]][outsize[2]]) out;
	//float (*i)[insize[1]][insize[2]] = (float (*)[insize[1]][insize[2]]) in;

	for (pout = 0; pout < outsize[0]; pout++) {
		for (hout = 0; hout < outsize[1]; hout++) {
			for (wout = 0; wout < outsize[2]; wout++) {
				out[(pout*outsize[1] + hout)*outsize[2] + wout] = 
					in[(pout*insize[1] + cropped[0]+hout)*insize[2] + cropped[1]+wout];
				//o[pout][hout][wout] = i[pout][cropped[0] + hout][cropped[1] + wout];
			}
		}
	}
	*output = out;
	return OK;
}


RET interpol_scale(float** source, float** target, VARSIZE insize[3],
		VARSIZE outsize[3], SIZE shortest_dim) {
	float* src = *source;
	float* trg = *target;
	double* in = NULL;
	double* out = NULL;

	ITER i = 0;

	double ratio = 0;

	outsize[0] = insize[0];
	if (insize[1] > insize[2]) {
		ratio = (double) shortest_dim / insize[2];
		outsize[1] = insize[1] * ratio;
		outsize[2] = shortest_dim;
	} else {
		ratio = (double) shortest_dim / insize[1];
		outsize[1] = shortest_dim;
		outsize[2] = insize[2] * ratio;
	}

	SIZE memsize = outsize[0] * outsize[1] * outsize[2] * sizeof(float);
	trg = (float*) realloc(trg, memsize);

	in = (double*) calloc(insize[0] * insize[1] * insize[2], sizeof(double));
	out = (double*) calloc(outsize[0] * outsize[1] * outsize[2],
			sizeof(double));

	for (i = 0; i < insize[0] * insize[1] * insize[2]; i++) {
		in[i] = (double) src[i];
	}

	interpolate(in, out, insize, outsize);

	for (i = 0; i < outsize[0] * outsize[1] * outsize[2]; i++) {
		trg[i] = (float) out[i];
	}

	free(in);
	free(out);

	*target = trg;
	return OK;
}


RET interpolate(double* source, double* target, SIZE insize[3], SIZE outsize[3]) {
	ITER nchan = 0;
	ITER width = 0;
	ITER height = 0;

	gsl_interp2d* interpol = NULL;

	SIZE nchans = insize[0];
	SIZE hsource = insize[1];
	SIZE wsource = insize[2];
	SIZE htarget = outsize[1];
	SIZE wtarget = outsize[2];

	gsl_interp_accel* wacc = NULL;
	gsl_interp_accel* hacc = NULL;

	//double (*src)[hsource][wsource] = (double (*)[hsource][wsource]) source;
	//double (*trg)[htarget][wtarget] = (double (*)[htarget][wtarget]) target;

	/* instantiate source grid */
	double* ws = (double*) calloc(wsource, sizeof(double));
	double* hs = (double*) calloc(hsource, sizeof(double));

	/* instantiate target grid */
	double* wt = (double*) calloc(wtarget, sizeof(double));
	double* ht = (double*) calloc(htarget, sizeof(double));

	/* initialize source grid [0, 1] */
	for (width = 0; width < wsource; width++) {
		ws[width] = (double) (width) / (wsource - 1);
	}
	for (height = 0; height < hsource; height++) {
		hs[height] = (double) (height) / (hsource - 1);
	}

	/* initialize target grid [0, 1] */
	for (width = 0; width < wtarget; width++) {
		wt[width] = (double) (width) / (wtarget - 1);
	}
	for (height = 0; height < htarget; height++) {
		ht[height] = (double) (height) / (htarget - 1);
	}

	/* instantiate interpolation module */
#if BICUBIC_INTERPOLATION
	interpol =                  //interpolation module
	gsl_interp2d_alloc(
			gsl_interp2d_bicubic,//bicubic interpolation
			wsource, hsource//source size
	);
#else
	interpol =                  //interpolation module
			gsl_interp2d_alloc(gsl_interp2d_bilinear, //use bilinear interpolation, way faster
					wsource, hsource        //source size
					);
#endif

	wacc = gsl_interp_accel_alloc();
	hacc = gsl_interp_accel_alloc();

	for (nchan = 0; nchan < nchans; nchan++) {

		/* initialize interpolation module */
//		gsl_interp2d_init(interpol, 	//interpolation module
//				ws, hs,             	//source grid
//				(double*) src[nchan],   //source data
//				wsource, hsource);   	//source size
		gsl_interp2d_init(interpol, 	//interpolation module
				ws, hs,             	//source grid
				(double*) &source[nchan*hsource*wsource],   //source data
				wsource, hsource);   	//source size

		for (height = 0; height < htarget; height++) {
			for (width = 0; width < wtarget; width++) {
				/*
				 * FIX: wt ht must be twisted
				 * with respect to height and width
				 */
//				gsl_interp2d_eval_e(interpol,  	//interpolation module
//						ws, hs,         		//source grid
//						(double*) src[nchan],  	//source data
//						wt[width], ht[height], 	//point in target grid
//						wacc, hacc,   			//accellerators
//						(double*) &trg[nchan][height][width]);
				gsl_interp2d_eval_e(interpol,  	//interpolation module
						ws, hs,         		//source grid
						(double*) &source[nchan*hsource*wsource],  	//source data
						wt[width], ht[height], 	//point in target grid
						wacc, hacc,   			//accellerators
						(double*) &target[(nchan*htarget + height)*wtarget + width]);
			}
		}
	}

	free(ws);
	free(hs);
	free(wt);
	free(ht);
	gsl_interp_accel_free(wacc);
	gsl_interp_accel_free(hacc);
	gsl_interp2d_free(interpol);
	return OK;
}


RET loadImage(NAME filename, VARSIZE size[3], float** bufferH) {
	float* buffer = *bufferH;

	VARSIZE ndata = 0;
	FILE* fh = NULL;

	ITER nchan = 0;
	ITER width = 0;
	ITER height = 0;
	ITER counter = 0;

	ITER jdata_pos = 0;
	ITER buffer_pos = 0;

	struct jpeg_decompress_struct cinfo; //for our jpeg info
	struct jpeg_error_mgr err;          //the error handler

	fh = fopen(filename, "rb");

	cinfo.err = jpeg_std_error(&err);
	jpeg_create_decompress(&cinfo);
	jpeg_stdio_src(&cinfo, fh);
	jpeg_read_header(&cinfo, TRUE);
	jpeg_start_decompress(&cinfo);

	/* number of channels RGB => 3 */
	size[0] = cinfo.num_components;
	/* height and width of picture in pixels */
	size[1] = cinfo.output_height;
	size[2] = cinfo.output_width;

	ndata = size[0] * size[1] * size[2];

	unsigned char* jdata = (unsigned char*) calloc(ndata,
			sizeof(unsigned char));
	unsigned char* linebuffer[1] = { NULL };
	linebuffer[0] = (unsigned char*) calloc(size[2] * size[0],
			sizeof(unsigned char));

	while (cinfo.output_scanline < cinfo.output_height) {
		jpeg_read_scanlines(&cinfo, linebuffer, 1);
		memcpy(&jdata[counter], linebuffer[0],
				size[2] * size[0] * sizeof(unsigned char));
		counter += size[2] * size[0];
	}

	free(linebuffer[0]);
	jpeg_finish_decompress(&cinfo);
	jpeg_destroy_decompress(&cinfo);
	fclose(fh);

	buffer = (float*) realloc(buffer, ndata * sizeof(float));

	/* reshape image and convert to float [0,1] */
	for (height = 0; height < size[1]; height++) {
		for (width = 0; width < size[2]; width++) {
			for (nchan = 0; nchan < size[0]; nchan++) {
				buffer_pos = nchan * (size[1] * size[2]) + height * size[2]
						+ width;
				jdata_pos = height * (size[0] * size[2]) + width * size[0]
						+ nchan;
				buffer[buffer_pos] = (float) 1 / 255 * (jdata[jdata_pos]);
			}
		}
	}
	free(jdata);

	*bufferH = buffer;
	return OK;
}

const float mean_val[3] = { 0.485, 0.456, 0.406 };
const float std_val[3] = { 0.229, 0.224, 0.225 };

RET normalize(float** input, float** output, SIZE size[3]) {
	float* in = *input;
	float* out = *output;
	SIZE ndata = size[0] * size[1] * size[2];
	out = (float*) realloc(out, ndata * sizeof(float));

	ITER pin = 0;
	ITER i = 0;

	for (i = 0; i < ndata; i++) {
		pin = i / (size[1] * size[2]);
		out[i] = (in[i] - mean_val[pin]) / (std_val[pin]);
	}

	*output = out;
	return OK;
}


void print_data(DATA * data, int size, const char*filename){
#ifndef __CI__
	FILE * f = fopen(filename, "w");
	assert(f!=NULL);
	#ifdef _FIXED_
		const char * format_string = "%d\n";
	#else
		const char * format_string = "%f\n";
	#endif
	printf("Writing to %s ...\n", filename);
	for(int i=0; i<size; i++){
		fprintf(f, format_string, data[i]);
	}
	fclose(f);
#endif
}