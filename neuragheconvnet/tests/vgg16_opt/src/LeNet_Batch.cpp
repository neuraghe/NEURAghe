// This code is auto-generated. Do not edit.

#include "LeNet_Batch.h"

#if !(_RELEASE_)
	#define _rprintf_(...) printf(__VA_ARGS__)
	#define spatconv_forward_hw(...) spatconv_forward_hw_sync(__VA_ARGS__)
	#define basicBlock_hw(...) basicBlock_hw_sync(__VA_ARGS__)
	#ifdef _DEBUG_
		#define _dprintf_(...) printf(__VA_ARGS__)
		#define _dprint_data_(...) print_data(__VA_ARGS__)
		#define _ddeinterlace_(...) deinterlace(__VA_ARGS__)
	#else
		#define _dprintf_(...) ;
		#define _dprint_data_(...) ;
		#define _ddeinterlace_(...) ;
	#endif
#else
	#define _rprintf_(...) ;
	#define _dprintf_(...) ;
	#define _dprint_data_(...) ;
	#define _ddeinterlace_(...) ;
#endif

// global variables
SPATCONV conv1_1_param;
SPATCONV conv1_2_param;
SPATCONV conv2_1_param;
SPATCONV conv2_2_param;
SPATCONV conv3_1_param;
SPATCONV conv3_2_param;
SPATCONV conv3_3_param;
SPATCONV conv4_1_param;
SPATCONV conv4_2_param;
SPATCONV conv4_3_param;
SPATCONV conv5_1_param;
SPATCONV conv5_2_param;
SPATCONV conv5_3_param;
LINEAR_FP16 fc6_param;
LINEAR_FP16 fc7_param;
LINEAR_FP16 fc8_param;


SOCMAP soc;
DATA* wPointer;

DATA fc6_weights_array[102760448] __attribute__ ((aligned (16)));
DATA fc6_bias_array[4096] __attribute__ ((aligned (16)));
DATA fc7_weights_array[16777216] __attribute__ ((aligned (16)));
DATA fc7_bias_array[4096] __attribute__ ((aligned (16)));
DATA fc8_weights_array[4096000] __attribute__ ((aligned (16)));
DATA fc8_bias_array[1000] __attribute__ ((aligned (16)));
DATA conv5_3_output[25088] __attribute__ ((aligned (16)));
DATA fc_input[25088] __attribute__ ((aligned (16)));
DATA fc6_output[4096] __attribute__ ((aligned (16)));
DATA relu6_output[4096] __attribute__ ((aligned (16)));
DATA fc7_output[4096] __attribute__ ((aligned (16)));
DATA relu7_output[4096] __attribute__ ((aligned (16)));
DATA fc8_output[1000] __attribute__ ((aligned (16)));

void init_platform(char* bitstream){
	init_soc(&soc, &wPointer, _MAXMEM_, 0, bitstream);
}

void cnnMainInit(VARNAME load_data_dir)
{
	double time;
	VARNAME filename;
	
	/*
	 * Convolution layer
	 * IF = 3 x 224 x 224 --> OF = 64 x 224 x 224
	 * W 64 x 3 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv1_1_param = spatconv_create();
	conv1_1_param->pout = 64;
	conv1_1_param->pin = 3;
	conv1_1_param->kern_s[0] = 64;
	conv1_1_param->kern_s[1] = 3;
	conv1_1_param->kern_s[2] = 3;
	conv1_1_param->kern_s[3] = 3;
	conv1_1_param->maxog = 8;
	
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 3 x 3;
	sprintf(filename, "%s/conv1_1_weights_array_file", load_data_dir);
	load_fixed(filename,7168,wPointer);
	conv1_1_param->kernel = wPointer;
	wPointer = wPointer + 7168;
	
	SIZE conv1_1_bias_dim = 64;
	// static DATA conv1_1_bias_array[64];
	// sprintf(filename, "%s/conv1_1_bias_array_file", load_data_dir);
	// load_fixed(filename,conv1_1_bias_dim,wPointer);
	// conv1_1_param->bias = conv1_1_bias_array;
	
	SIZE conv1_1_dim = 64 * 224 * 224;
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 224 x 224 --> OF = 64 x 112 x 112
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv1_2_param = spatconv_create();
	conv1_2_param->pout = 64;
	conv1_2_param->pin = 64;
	conv1_2_param->kern_s[0] = 64;
	conv1_2_param->kern_s[1] = 64;
	conv1_2_param->kern_s[2] = 3;
	conv1_2_param->kern_s[3] = 3;
	conv1_2_param->maxog = 8;
	
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/conv1_2_weights_array_file", load_data_dir);
	load_fixed(filename,43008,wPointer);
	conv1_2_param->kernel = wPointer;
	wPointer = wPointer + 43008;
	
	SIZE conv1_2_bias_dim = 64;
	// static DATA conv1_2_bias_array[64];
	// sprintf(filename, "%s/conv1_2_bias_array_file", load_data_dir);
	// load_fixed(filename,conv1_2_bias_dim,wPointer);
	// conv1_2_param->bias = conv1_2_bias_array;
	
	SIZE conv1_2_dim = 64 * 112 * 112;
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 112 x 112 --> OF = 128 x 112 x 112
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv2_1_param = spatconv_create();
	conv2_1_param->pout = 128;
	conv2_1_param->pin = 64;
	conv2_1_param->kern_s[0] = 128;
	conv2_1_param->kern_s[1] = 64;
	conv2_1_param->kern_s[2] = 3;
	conv2_1_param->kern_s[3] = 3;
	conv2_1_param->maxog = 16;
	
	// preprocessed weight dim = 86016
	// original weight shape = 128 x 64 x 3 x 3;
	sprintf(filename, "%s/conv2_1_weights_array_file", load_data_dir);
	load_fixed(filename,86016,wPointer);
	conv2_1_param->kernel = wPointer;
	wPointer = wPointer + 86016;
	
	SIZE conv2_1_bias_dim = 128;
	// static DATA conv2_1_bias_array[128];
	// sprintf(filename, "%s/conv2_1_bias_array_file", load_data_dir);
	// load_fixed(filename,conv2_1_bias_dim,wPointer);
	// conv2_1_param->bias = conv2_1_bias_array;
	
	SIZE conv2_1_dim = 128 * 112 * 112;
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 112 x 112 --> OF = 128 x 56 x 56
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv2_2_param = spatconv_create();
	conv2_2_param->pout = 128;
	conv2_2_param->pin = 128;
	conv2_2_param->kern_s[0] = 128;
	conv2_2_param->kern_s[1] = 128;
	conv2_2_param->kern_s[2] = 3;
	conv2_2_param->kern_s[3] = 3;
	conv2_2_param->maxog = 16;
	
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/conv2_2_weights_array_file", load_data_dir);
	load_fixed(filename,157696,wPointer);
	conv2_2_param->kernel = wPointer;
	wPointer = wPointer + 157696;
	
	SIZE conv2_2_bias_dim = 128;
	// static DATA conv2_2_bias_array[128];
	// sprintf(filename, "%s/conv2_2_bias_array_file", load_data_dir);
	// load_fixed(filename,conv2_2_bias_dim,wPointer);
	// conv2_2_param->bias = conv2_2_bias_array;
	
	SIZE conv2_2_dim = 128 * 56 * 56;
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 56 x 56 --> OF = 256 x 56 x 56
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv3_1_param = spatconv_create();
	conv3_1_param->pout = 256;
	conv3_1_param->pin = 128;
	conv3_1_param->kern_s[0] = 256;
	conv3_1_param->kern_s[1] = 128;
	conv3_1_param->kern_s[2] = 3;
	conv3_1_param->kern_s[3] = 3;
	conv3_1_param->maxog = 16;
	
	// preprocessed weight dim = 315392
	// original weight shape = 256 x 128 x 3 x 3;
	sprintf(filename, "%s/conv3_1_weights_array_file", load_data_dir);
	load_fixed(filename,315392,wPointer);
	conv3_1_param->kernel = wPointer;
	wPointer = wPointer + 315392;
	
	SIZE conv3_1_bias_dim = 256;
	// static DATA conv3_1_bias_array[256];
	// sprintf(filename, "%s/conv3_1_bias_array_file", load_data_dir);
	// load_fixed(filename,conv3_1_bias_dim,wPointer);
	// conv3_1_param->bias = conv3_1_bias_array;
	
	SIZE conv3_1_dim = 256 * 56 * 56;
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 56 x 56 --> OF = 256 x 56 x 56
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv3_2_param = spatconv_create();
	conv3_2_param->pout = 256;
	conv3_2_param->pin = 256;
	conv3_2_param->kern_s[0] = 256;
	conv3_2_param->kern_s[1] = 256;
	conv3_2_param->kern_s[2] = 3;
	conv3_2_param->kern_s[3] = 3;
	conv3_2_param->maxog = 16;
	
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/conv3_2_weights_array_file", load_data_dir);
	load_fixed(filename,630784,wPointer);
	conv3_2_param->kernel = wPointer;
	wPointer = wPointer + 630784;
	
	// SIZE conv3_2_bias_dim = 256;
	// static DATA conv3_2_bias_array[256];
	// sprintf(filename, "%s/conv3_2_bias_array_file", load_data_dir);
	// load_fixed(filename,conv3_2_bias_dim,wPointer);
	// conv3_2_param->bias = conv3_2_bias_array;
	
	SIZE conv3_2_dim = 256 * 56 * 56;
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 56 x 56 --> OF = 256 x 28 x 28
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv3_3_param = spatconv_create();
	conv3_3_param->pout = 256;
	conv3_3_param->pin = 256;
	conv3_3_param->kern_s[0] = 256;
	conv3_3_param->kern_s[1] = 256;
	conv3_3_param->kern_s[2] = 3;
	conv3_3_param->kern_s[3] = 3;
	conv3_3_param->maxog = 16;
	
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/conv3_3_weights_array_file", load_data_dir);
	load_fixed(filename,630784,wPointer);
	conv3_3_param->kernel = wPointer;
	wPointer = wPointer + 630784;
	
	// SIZE conv3_3_bias_dim = 256;
	// static DATA conv3_3_bias_array[256];
	// sprintf(filename, "%s/conv3_3_bias_array_file", load_data_dir);
	// load_fixed(filename,conv3_3_bias_dim,wPointer);
	// conv3_3_param->bias = conv3_3_bias_array;
	
	SIZE conv3_3_dim = 256 * 28 * 28;
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 28 x 28 --> OF = 512 x 28 x 28
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv4_1_param = spatconv_create();
	conv4_1_param->pout = 512;
	conv4_1_param->pin = 256;
	conv4_1_param->kern_s[0] = 512;
	conv4_1_param->kern_s[1] = 256;
	conv4_1_param->kern_s[2] = 3;
	conv4_1_param->kern_s[3] = 3;
	conv4_1_param->maxog = 16;
	
	// preprocessed weight dim = 1261568
	// original weight shape = 512 x 256 x 3 x 3;
	sprintf(filename, "%s/conv4_1_weights_array_file", load_data_dir);
	load_fixed(filename,1261568,wPointer);
	conv4_1_param->kernel = wPointer;
	wPointer = wPointer + 1261568;
	
	// SIZE conv4_1_bias_dim = 512;
	// static DATA conv4_1_bias_array[512];
	// sprintf(filename, "%s/conv4_1_bias_array_file", load_data_dir);
	// load_fixed(filename,conv4_1_bias_dim,wPointer);
	// conv4_1_param->bias = conv4_1_bias_array;
	
	SIZE conv4_1_dim = 512 * 28 * 28;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 28 x 28 --> OF = 512 x 28 x 28
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv4_2_param = spatconv_create();
	conv4_2_param->pout = 512;
	conv4_2_param->pin = 512;
	conv4_2_param->kern_s[0] = 512;
	conv4_2_param->kern_s[1] = 512;
	conv4_2_param->kern_s[2] = 3;
	conv4_2_param->kern_s[3] = 3;
	conv4_2_param->maxog = 16;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/conv4_2_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	conv4_2_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	// SIZE conv4_2_bias_dim = 512;
	// static DATA conv4_2_bias_array[512];
	// sprintf(filename, "%s/conv4_2_bias_array_file", load_data_dir);
	// load_fixed(filename,conv4_2_bias_dim,wPointer);
	// conv4_2_param->bias = conv4_2_bias_array;
	
	SIZE conv4_2_dim = 512 * 28 * 28;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 28 x 28 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv4_3_param = spatconv_create();
	conv4_3_param->pout = 512;
	conv4_3_param->pin = 512;
	conv4_3_param->kern_s[0] = 512;
	conv4_3_param->kern_s[1] = 512;
	conv4_3_param->kern_s[2] = 3;
	conv4_3_param->kern_s[3] = 3;
	conv4_3_param->maxog = 16;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/conv4_3_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	conv4_3_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	// SIZE conv4_3_bias_dim = 512;
	// static DATA conv4_3_bias_array[512];
	// sprintf(filename, "%s/conv4_3_bias_array_file", load_data_dir);
	// load_fixed(filename,conv4_3_bias_dim,wPointer);
	// conv4_3_param->bias = conv4_3_bias_array;
	
	SIZE conv4_3_dim = 512 * 14 * 14;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv5_1_param = spatconv_create();
	conv5_1_param->pout = 512;
	conv5_1_param->pin = 512;
	conv5_1_param->kern_s[0] = 512;
	conv5_1_param->kern_s[1] = 512;
	conv5_1_param->kern_s[2] = 3;
	conv5_1_param->kern_s[3] = 3;
	conv5_1_param->maxog = 16;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/conv5_1_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	conv5_1_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	// SIZE conv5_1_bias_dim = 512;
	// static DATA conv5_1_bias_array[512];
	// sprintf(filename, "%s/conv5_1_bias_array_file", load_data_dir);
	// load_fixed(filename,conv5_1_bias_dim,wPointer);
	// conv5_1_param->bias = conv5_1_bias_array;
	
	SIZE conv5_1_dim = 512 * 14 * 14;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv5_2_param = spatconv_create();
	conv5_2_param->pout = 512;
	conv5_2_param->pin = 512;
	conv5_2_param->kern_s[0] = 512;
	conv5_2_param->kern_s[1] = 512;
	conv5_2_param->kern_s[2] = 3;
	conv5_2_param->kern_s[3] = 3;
	conv5_2_param->maxog = 16;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/conv5_2_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	conv5_2_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	// SIZE conv5_2_bias_dim = 512;
	// static DATA conv5_2_bias_array[512];
	// sprintf(filename, "%s/conv5_2_bias_array_file", load_data_dir);
	// load_fixed(filename,conv5_2_bias_dim,wPointer);
	// conv5_2_param->bias = conv5_2_bias_array;
	
	SIZE conv5_2_dim = 512 * 14 * 14;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	conv5_3_param = spatconv_create();
	conv5_3_param->pout = 512;
	conv5_3_param->pin = 512;
	conv5_3_param->kern_s[0] = 512;
	conv5_3_param->kern_s[1] = 512;
	conv5_3_param->kern_s[2] = 3;
	conv5_3_param->kern_s[3] = 3;
	conv5_3_param->maxog = 16;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/conv5_3_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	conv5_3_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	// SIZE conv5_3_bias_dim = 512;
	// static DATA conv5_3_bias_array[512];
	// sprintf(filename, "%s/conv5_3_bias_array_file", load_data_dir);
	// load_fixed(filename,conv5_3_bias_dim,wPointer);
	// conv5_3_param->bias = conv5_3_bias_array;
	
	SIZE conv5_3_dim = 512 * 7 * 7;
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 4096
	 * W 4096 x 25088
	 * X 25088 x 1
	 */
	SIZE fc6_dim = 4096;
	fc6_param = linear_fp16_create();
	fc6_param->out_s = 4096;
	fc6_param->in_s = conv5_3_dim;
	sprintf(filename, "%s/fc6_weights_array_file", load_data_dir);
	load_fixed(filename,102760448,fc6_weights_array);
	fc6_param->weights = fc6_weights_array;
	sprintf(filename, "%s/fc6_bias_array_file", load_data_dir);
	load_fixed(filename,4096,fc6_bias_array);
	fc6_param->bias = fc6_bias_array;
	
	
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 4096
	 * W 4096 x 4096
	 * X 4096 x 1
	 */
	SIZE fc7_dim = 4096;
	fc7_param = linear_fp16_create();
	fc7_param->out_s = 4096;
	fc7_param->in_s = fc6_dim;	
	sprintf(filename, "%s/fc7_weights_array_file", load_data_dir);
	load_fixed(filename,16777216,fc7_weights_array);
	fc7_param->weights = fc7_weights_array;
	sprintf(filename, "%s/fc7_bias_array_file", load_data_dir);
	load_fixed(filename,4096,fc7_bias_array);
	fc7_param->bias = fc7_bias_array;
	
	
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 4096
	 * X 4096 x 1
	 */
	SIZE fc8_dim = 1000;
	fc8_param = linear_fp16_create();
	fc8_param->out_s = 1000;
	fc8_param->in_s = fc7_dim;
	sprintf(filename, "%s/fc8_weights_array_file", load_data_dir);
	load_fixed(filename,4096000,fc8_weights_array);
	fc8_param->weights = fc8_weights_array;
	sprintf(filename, "%s/fc8_bias_array_file", load_data_dir);
	load_fixed(filename,1000,fc8_bias_array);
	fc8_param->bias = fc8_bias_array;
}

void cnnMain(DATA* image, float* results)
{
	double time;
	SIZE input_size[] = { 3, 224, 224 };
	SIZE input_dim = 3 * 224 * 224;
	DATA* input_output = image;
	//print_data(input_output, input_dim, "./output_neuraghe/resnet/0_input_output_FIXED");
	
	int job_id = 0;
	static int first = 1;
	/*
	 * Convolution layer
	 * IF = 3 x 224 x 224 --> OF = 64 x 224 x 224
	 * W 64 x 3 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv1_1_size[] = { 64, 224, 224 };
	SIZE conv1_1_dim = 64 * 224 * 224;
	// conv1_1_dim = 3211264
	// static DATA conv1_1_output[3211264];
	SIZE conv1_1_stride[] = { 1, 1 };
	SIZE conv1_1_pad[] = { 1, 1 };
	
	interlace(soc->in, input_output, 3, input_size[0], input_size[1], input_size[2]);

	_tcreate_(last_conv);

	job_id = spatconv_forward_hw(conv1_1_param, soc->in, soc->out, soc, input_size, conv1_1_size, conv1_1_stride, conv1_1_pad, true);
	SIZE conv1_1_output_conv1_1_output_dstride[] = { 1, 1 };
	//deinterlace(conv1_1_output, soc->out, conv1_1_size[0], conv1_1_size[1], conv1_1_size[2], conv1_1_output_conv1_1_output_dstride);
	// print_data(conv1_1_output, conv1_1_dim, "./output_neuraghe/resnet/1_conv1_1_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv1_1_dim));
	
	/*
	 * Convolution layer
	 * IF = 64 x 224 x 224 --> OF = 64 x 112 x 112
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv1_2_size[] = { 64, 112, 112 };
	SIZE conv1_2_dim = 64 * 112 * 112;
	// conv1_2_dim = 802816
	// static DATA conv1_2_output[802816];
	SIZE conv1_2_stride[] = { 1, 1 };
	SIZE conv1_2_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = basicBlock_hw(conv1_2_param, soc->in, soc->out, soc, conv1_1_size, conv1_2_size, conv1_2_stride, conv1_2_pad, POOL_2x2, MAX_POOL, true);
	SIZE conv1_2_output_conv1_2_output_dstride[] = { 1, 1 };
	//deinterlace(conv1_2_output, soc->out, conv1_2_size[0], conv1_2_size[1], conv1_2_size[2], conv1_2_output_conv1_2_output_dstride);
	// print_data(conv1_2_output, conv1_2_dim, "./output_neuraghe/resnet/2_conv1_2_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv1_2_dim));
	
	/*
	 * Convolution layer
	 * IF = 64 x 112 x 112 --> OF = 128 x 112 x 112
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv2_1_size[] = { 128, 112, 112 };
	SIZE conv2_1_dim = 128 * 112 * 112;
	// conv2_1_dim = 1605632
	// static DATA conv2_1_output[1605632];
	SIZE conv2_1_stride[] = { 1, 1 };
	SIZE conv2_1_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv2_1_param, soc->in, soc->out, soc, conv1_2_size, conv2_1_size, conv2_1_stride, conv2_1_pad, true);
	SIZE conv2_1_output_conv2_1_output_dstride[] = { 1, 1 };
	//deinterlace(conv2_1_output, soc->out, conv2_1_size[0], conv2_1_size[1], conv2_1_size[2], conv2_1_output_conv2_1_output_dstride);
	// print_data(conv2_1_output, conv2_1_dim, "./output_neuraghe/resnet/3_conv2_1_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv2_1_dim));
	
	/*
	 * Convolution layer
	 * IF = 128 x 112 x 112 --> OF = 128 x 56 x 56
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv2_2_size[] = { 128, 56, 56 };
	SIZE conv2_2_dim = 128 * 56 * 56;
	// conv2_2_dim = 401408
	// static DATA conv2_2_output[401408];
	SIZE conv2_2_stride[] = { 1, 1 };
	SIZE conv2_2_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = basicBlock_hw(conv2_2_param, soc->in, soc->out, soc, conv2_1_size, conv2_2_size, conv2_2_stride, conv2_2_pad, POOL_2x2, MAX_POOL, true);
	SIZE conv2_2_output_conv2_2_output_dstride[] = { 1, 1 };
	//deinterlace(conv2_2_output, soc->out, conv2_2_size[0], conv2_2_size[1], conv2_2_size[2], conv2_2_output_conv2_2_output_dstride);
	// print_data(conv2_2_output, conv2_2_dim, "./output_neuraghe/resnet/4_conv2_2_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv2_2_dim));
	
	/*
	 * Convolution layer
	 * IF = 128 x 56 x 56 --> OF = 256 x 56 x 56
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv3_1_size[] = { 256, 56, 56 };
	SIZE conv3_1_dim = 256 * 56 * 56;
	// conv3_1_dim = 802816
	// static DATA conv3_1_output[802816];
	SIZE conv3_1_stride[] = { 1, 1 };
	SIZE conv3_1_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv3_1_param, soc->in, soc->out, soc, conv2_2_size, conv3_1_size, conv3_1_stride, conv3_1_pad, true);
	SIZE conv3_1_output_conv3_1_output_dstride[] = { 1, 1 };
	//deinterlace(conv3_1_output, soc->out, conv3_1_size[0], conv3_1_size[1], conv3_1_size[2], conv3_1_output_conv3_1_output_dstride);
	// print_data(conv3_1_output, conv3_1_dim, "./output_neuraghe/resnet/5_conv3_1_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv3_1_dim));
	
	/*
	 * Convolution layer
	 * IF = 256 x 56 x 56 --> OF = 256 x 56 x 56
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv3_2_size[] = { 256, 56, 56 };
	SIZE conv3_2_dim = 256 * 56 * 56;
	// conv3_2_dim = 802816
	// static DATA conv3_2_output[802816];
	SIZE conv3_2_stride[] = { 1, 1 };
	SIZE conv3_2_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv3_2_param, soc->in, soc->out, soc, conv3_1_size, conv3_2_size, conv3_2_stride, conv3_2_pad, true);
	SIZE conv3_2_output_conv3_2_output_dstride[] = { 1, 1 };
	//deinterlace(conv3_2_output, soc->out, conv3_2_size[0], conv3_2_size[1], conv3_2_size[2], conv3_2_output_conv3_2_output_dstride);
	// print_data(conv3_2_output, conv3_2_dim, "./output_neuraghe/resnet/6_conv3_2_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv3_2_dim));
	
	/*
	 * Convolution layer
	 * IF = 256 x 56 x 56 --> OF = 256 x 28 x 28
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv3_3_size[] = { 256, 28, 28 };
	SIZE conv3_3_dim = 256 * 28 * 28;
	// conv3_3_dim = 200704
	// static DATA conv3_3_output[200704];
	SIZE conv3_3_stride[] = { 1, 1 };
	SIZE conv3_3_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = basicBlock_hw(conv3_3_param, soc->in, soc->out, soc, conv3_2_size, conv3_3_size, conv3_3_stride, conv3_3_pad, POOL_2x2, MAX_POOL, true);
	SIZE conv3_3_output_conv3_3_output_dstride[] = { 1, 1 };
	//deinterlace(conv3_3_output, soc->out, conv3_3_size[0], conv3_3_size[1], conv3_3_size[2], conv3_3_output_conv3_3_output_dstride);
	// print_data(conv3_3_output, conv3_3_dim, "./output_neuraghe/resnet/7_conv3_3_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv3_3_dim));
	
	/*
	 * Convolution layer
	 * IF = 256 x 28 x 28 --> OF = 512 x 28 x 28
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv4_1_size[] = { 512, 28, 28 };
	SIZE conv4_1_dim = 512 * 28 * 28;
	// conv4_1_dim = 401408
	// static DATA conv4_1_output[401408];
	SIZE conv4_1_stride[] = { 1, 1 };
	SIZE conv4_1_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv4_1_param, soc->in, soc->out, soc, conv3_3_size, conv4_1_size, conv4_1_stride, conv4_1_pad, true);
	SIZE conv4_1_output_conv4_1_output_dstride[] = { 1, 1 };
	//deinterlace(conv4_1_output, soc->out, conv4_1_size[0], conv4_1_size[1], conv4_1_size[2], conv4_1_output_conv4_1_output_dstride);
	// print_data(conv4_1_output, conv4_1_dim, "./output_neuraghe/resnet/8_conv4_1_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv4_1_dim));
	
	/*
	 * Convolution layer
	 * IF = 512 x 28 x 28 --> OF = 512 x 28 x 28
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv4_2_size[] = { 512, 28, 28 };
	SIZE conv4_2_dim = 512 * 28 * 28;
	// conv4_2_dim = 401408
	// static DATA conv4_2_output[401408];
	SIZE conv4_2_stride[] = { 1, 1 };
	SIZE conv4_2_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv4_2_param, soc->in, soc->out, soc, conv4_1_size, conv4_2_size, conv4_2_stride, conv4_2_pad, true);
	SIZE conv4_2_output_conv4_2_output_dstride[] = { 1, 1 };
	//deinterlace(conv4_2_output, soc->out, conv4_2_size[0], conv4_2_size[1], conv4_2_size[2], conv4_2_output_conv4_2_output_dstride);
	// print_data(conv4_2_output, conv4_2_dim, "./output_neuraghe/resnet/9_conv4_2_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv4_2_dim));
	
	/*
	 * Convolution layer
	 * IF = 512 x 28 x 28 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv4_3_size[] = { 512, 14, 14 };
	SIZE conv4_3_dim = 512 * 14 * 14;
	// conv4_3_dim = 100352
	// static DATA conv4_3_output[100352];
	SIZE conv4_3_stride[] = { 1, 1 };
	SIZE conv4_3_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = basicBlock_hw(conv4_3_param, soc->in, soc->out, soc, conv4_2_size, conv4_3_size, conv4_3_stride, conv4_3_pad, POOL_2x2, MAX_POOL, true);
	SIZE conv4_3_output_conv4_3_output_dstride[] = { 1, 1 };
	//deinterlace(conv4_3_output, soc->out, conv4_3_size[0], conv4_3_size[1], conv4_3_size[2], conv4_3_output_conv4_3_output_dstride);
	// print_data(conv4_3_output, conv4_3_dim, "./output_neuraghe/resnet/10_conv4_3_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv4_3_dim));
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv5_1_size[] = { 512, 14, 14 };
	SIZE conv5_1_dim = 512 * 14 * 14;
	// conv5_1_dim = 100352
	// static DATA conv5_1_output[100352];
	SIZE conv5_1_stride[] = { 1, 1 };
	SIZE conv5_1_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv5_1_param, soc->in, soc->out, soc, conv4_3_size, conv5_1_size, conv5_1_stride, conv5_1_pad, true);
	SIZE conv5_1_output_conv5_1_output_dstride[] = { 1, 1 };
	//deinterlace(conv5_1_output, soc->out, conv5_1_size[0], conv5_1_size[1], conv5_1_size[2], conv5_1_output_conv5_1_output_dstride);
	// print_data(conv5_1_output, conv5_1_dim, "./output_neuraghe/resnet/11_conv5_1_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv5_1_dim));
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv5_2_size[] = { 512, 14, 14 };
	SIZE conv5_2_dim = 512 * 14 * 14;
	// conv5_2_dim = 100352
	// static DATA conv5_2_output[100352];
	SIZE conv5_2_stride[] = { 1, 1 };
	SIZE conv5_2_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(conv5_2_param, soc->in, soc->out, soc, conv5_1_size, conv5_2_size, conv5_2_stride, conv5_2_pad, true);
	SIZE conv5_2_output_conv5_2_output_dstride[] = { 1, 1 };
	//deinterlace(conv5_2_output, soc->out, conv5_2_size[0], conv5_2_size[1], conv5_2_size[2], conv5_2_output_conv5_2_output_dstride);
	// print_data(conv5_2_output, conv5_2_dim, "./output_neuraghe/resnet/12_conv5_2_output_FIXED");
	
	//spatconv_wait(soc, job_id);
	//printf("CHECK: %lld \n", checksum(soc->out, conv5_2_dim));
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv5_3_size[] = { 512, 7, 7 };
	SIZE conv5_3_dim = 512 * 7 * 7;
	// conv5_3_dim = 25088
	SIZE conv5_3_stride[] = { 1, 1 };
	SIZE conv5_3_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = basicBlock_hw(conv5_3_param, soc->in, soc->out, soc, conv5_2_size, conv5_3_size, conv5_3_stride, conv5_3_pad, POOL_2x2, MAX_POOL, true);
	SIZE conv5_3_output_conv5_3_output_dstride[] = { 1, 1 };

	//spatconv_wait(soc, job_id);

	// print_data(conv5_3_output, conv5_3_dim, "./output_neuraghe/resnet/13_conv5_3_output_FIXED");

	if(!first) {
		/*
		 * Fully-connected layer
		 * num outputs = 4096
		 * W 4096 x 25088
		 * X 25088 x 1
		 */
		SIZE fc6_size[] = { 4096, 1, 1 };
		SIZE fc6_dim = 4096;
		linear_fp16_forward(fc6_param, fc_input, fc6_output, conv5_3_dim, fc6_dim);
		// print_data(fc6_output, fc6_dim, "./output_neuraghe/resnet/14_fc6_output_FIXED");
		relu_fp16_forward(fc6_output, relu6_output, fc6_size);
		// print_data(relu6_output, fc6_dim, "./output_neuraghe/resnet/15_relu6_output_FIXED");
		
		DATA* drop6_output = relu6_output;
		
		
		
		/*
		 * Fully-connected layer
		 * num outputs = 4096
		 * W 4096 x 4096
		 * X 4096 x 1
		 */
		SIZE fc7_size[] = { 4096, 1, 1 };
		SIZE fc7_dim = 4096;
		linear_fp16_forward(fc7_param, drop6_output, fc7_output, fc6_dim, fc7_dim);
		// print_data(fc7_output, fc7_dim, "./output_neuraghe/resnet/16_fc7_output_FIXED");
		relu_fp16_forward(fc7_output, relu7_output, fc7_size);
		// print_data(relu7_output, fc7_dim, "./output_neuraghe/resnet/17_relu7_output_FIXED");
		
		DATA* drop7_output = relu7_output;
		
		
		/*
		 * Fully-connected layer
		 * num outputs = 1000
		 * W 1000 x 4096
		 * X 4096 x 1
		 */
		SIZE fc8_size[] = { 1000, 1, 1 };
		SIZE fc8_dim = 1000;
		linear_fp16_forward(fc8_param, drop7_output, fc8_output, fc7_dim, fc8_dim);
		// print_data(fc8_output, fc8_dim, "./output_neuraghe/resnet/18_fc8_output_FIXED");
		
		// Convert output
		for(unsigned int i = 0; i < fc8_dim; i++)
			results[i] = (float) FIXED2FLOAT(fc8_output[i]);

	}

	spatconv_wait(soc, job_id);
	_tprintf_("\tWait last Conv: %5.3f ms\n", (get_wall_time()-last_conv)/1000);
	deinterlace(conv5_3_output, soc->out, conv5_3_size[0], conv5_3_size[1], conv5_3_size[2], conv5_3_output_conv5_3_output_dstride);
	memcpyNEON(fc_input, conv5_3_output, conv5_3_dim*sizeof(DATA));
	// _tprintf_("CHECKSUM: %lld \n", checksum(fc_input, conv5_3_dim));
	first = 0;

	return;
}

void free_platform(){
	munmap_soc(soc);
	free(soc);
}

