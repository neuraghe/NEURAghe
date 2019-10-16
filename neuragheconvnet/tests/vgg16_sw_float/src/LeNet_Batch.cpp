// This code is auto-generated. Do not edit.

#include "LeNet_Batch.h"

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

LINEAR fc6_param;



LINEAR fc7_param;



LINEAR fc8_param;




void init_platform(char* bitstream){
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
	conv1_1_param->maxog = 4;
	
	SIZE conv1_1_weights_dim = 64 * 3 * 3 * 3;
	static DATA conv1_1_weights_array[1728];
	sprintf(filename, "%s/conv1_1_weights_array_file", load_data_dir);
	load_float(filename,conv1_1_weights_dim,conv1_1_weights_array);
	
	conv1_1_param->kernel = conv1_1_weights_array;
	SIZE conv1_1_bias_dim = 64;
	static DATA conv1_1_bias_array[64];
	sprintf(filename, "%s/conv1_1_bias_array_file", load_data_dir);
	load_float(filename,conv1_1_bias_dim,conv1_1_bias_array);
	conv1_1_param->bias = conv1_1_bias_array;
	
	
	
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
	conv1_2_param->maxog = 4;
	
	SIZE conv1_2_weights_dim = 64 * 64 * 3 * 3;
	static DATA conv1_2_weights_array[36864];
	sprintf(filename, "%s/conv1_2_weights_array_file", load_data_dir);
	load_float(filename,conv1_2_weights_dim,conv1_2_weights_array);
	
	conv1_2_param->kernel = conv1_2_weights_array;
	SIZE conv1_2_bias_dim = 64;
	static DATA conv1_2_bias_array[64];
	sprintf(filename, "%s/conv1_2_bias_array_file", load_data_dir);
	load_float(filename,conv1_2_bias_dim,conv1_2_bias_array);
	conv1_2_param->bias = conv1_2_bias_array;
	
	
	
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
	conv2_1_param->maxog = 4;
	
	SIZE conv2_1_weights_dim = 128 * 64 * 3 * 3;
	static DATA conv2_1_weights_array[73728];
	sprintf(filename, "%s/conv2_1_weights_array_file", load_data_dir);
	load_float(filename,conv2_1_weights_dim,conv2_1_weights_array);
	
	conv2_1_param->kernel = conv2_1_weights_array;
	SIZE conv2_1_bias_dim = 128;
	static DATA conv2_1_bias_array[128];
	sprintf(filename, "%s/conv2_1_bias_array_file", load_data_dir);
	load_float(filename,conv2_1_bias_dim,conv2_1_bias_array);
	conv2_1_param->bias = conv2_1_bias_array;
	
	
	
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
	conv2_2_param->maxog = 4;
	
	SIZE conv2_2_weights_dim = 128 * 128 * 3 * 3;
	static DATA conv2_2_weights_array[147456];
	sprintf(filename, "%s/conv2_2_weights_array_file", load_data_dir);
	load_float(filename,conv2_2_weights_dim,conv2_2_weights_array);
	
	conv2_2_param->kernel = conv2_2_weights_array;
	SIZE conv2_2_bias_dim = 128;
	static DATA conv2_2_bias_array[128];
	sprintf(filename, "%s/conv2_2_bias_array_file", load_data_dir);
	load_float(filename,conv2_2_bias_dim,conv2_2_bias_array);
	conv2_2_param->bias = conv2_2_bias_array;
	
	
	
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
	conv3_1_param->maxog = 4;
	
	SIZE conv3_1_weights_dim = 256 * 128 * 3 * 3;
	static DATA conv3_1_weights_array[294912];
	sprintf(filename, "%s/conv3_1_weights_array_file", load_data_dir);
	load_float(filename,conv3_1_weights_dim,conv3_1_weights_array);
	
	conv3_1_param->kernel = conv3_1_weights_array;
	SIZE conv3_1_bias_dim = 256;
	static DATA conv3_1_bias_array[256];
	sprintf(filename, "%s/conv3_1_bias_array_file", load_data_dir);
	load_float(filename,conv3_1_bias_dim,conv3_1_bias_array);
	conv3_1_param->bias = conv3_1_bias_array;
	
	
	
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
	conv3_2_param->maxog = 4;
	
	SIZE conv3_2_weights_dim = 256 * 256 * 3 * 3;
	static DATA conv3_2_weights_array[589824];
	sprintf(filename, "%s/conv3_2_weights_array_file", load_data_dir);
	load_float(filename,conv3_2_weights_dim,conv3_2_weights_array);
	
	conv3_2_param->kernel = conv3_2_weights_array;
	SIZE conv3_2_bias_dim = 256;
	static DATA conv3_2_bias_array[256];
	sprintf(filename, "%s/conv3_2_bias_array_file", load_data_dir);
	load_float(filename,conv3_2_bias_dim,conv3_2_bias_array);
	conv3_2_param->bias = conv3_2_bias_array;
	
	
	
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
	conv3_3_param->maxog = 4;
	
	SIZE conv3_3_weights_dim = 256 * 256 * 3 * 3;
	static DATA conv3_3_weights_array[589824];
	sprintf(filename, "%s/conv3_3_weights_array_file", load_data_dir);
	load_float(filename,conv3_3_weights_dim,conv3_3_weights_array);
	
	conv3_3_param->kernel = conv3_3_weights_array;
	SIZE conv3_3_bias_dim = 256;
	static DATA conv3_3_bias_array[256];
	sprintf(filename, "%s/conv3_3_bias_array_file", load_data_dir);
	load_float(filename,conv3_3_bias_dim,conv3_3_bias_array);
	conv3_3_param->bias = conv3_3_bias_array;
	
	
	
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
	conv4_1_param->maxog = 4;
	
	SIZE conv4_1_weights_dim = 512 * 256 * 3 * 3;
	static DATA conv4_1_weights_array[1179648];
	sprintf(filename, "%s/conv4_1_weights_array_file", load_data_dir);
	load_float(filename,conv4_1_weights_dim,conv4_1_weights_array);
	
	conv4_1_param->kernel = conv4_1_weights_array;
	SIZE conv4_1_bias_dim = 512;
	static DATA conv4_1_bias_array[512];
	sprintf(filename, "%s/conv4_1_bias_array_file", load_data_dir);
	load_float(filename,conv4_1_bias_dim,conv4_1_bias_array);
	conv4_1_param->bias = conv4_1_bias_array;
	
	
	
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
	conv4_2_param->maxog = 4;
	
	SIZE conv4_2_weights_dim = 512 * 512 * 3 * 3;
	static DATA conv4_2_weights_array[2359296];
	sprintf(filename, "%s/conv4_2_weights_array_file", load_data_dir);
	load_float(filename,conv4_2_weights_dim,conv4_2_weights_array);
	
	conv4_2_param->kernel = conv4_2_weights_array;
	SIZE conv4_2_bias_dim = 512;
	static DATA conv4_2_bias_array[512];
	sprintf(filename, "%s/conv4_2_bias_array_file", load_data_dir);
	load_float(filename,conv4_2_bias_dim,conv4_2_bias_array);
	conv4_2_param->bias = conv4_2_bias_array;
	
	
	
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
	conv4_3_param->maxog = 4;
	
	SIZE conv4_3_weights_dim = 512 * 512 * 3 * 3;
	static DATA conv4_3_weights_array[2359296];
	sprintf(filename, "%s/conv4_3_weights_array_file", load_data_dir);
	load_float(filename,conv4_3_weights_dim,conv4_3_weights_array);
	
	conv4_3_param->kernel = conv4_3_weights_array;
	SIZE conv4_3_bias_dim = 512;
	static DATA conv4_3_bias_array[512];
	sprintf(filename, "%s/conv4_3_bias_array_file", load_data_dir);
	load_float(filename,conv4_3_bias_dim,conv4_3_bias_array);
	conv4_3_param->bias = conv4_3_bias_array;
	
	
	
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
	conv5_1_param->maxog = 4;
	
	SIZE conv5_1_weights_dim = 512 * 512 * 3 * 3;
	static DATA conv5_1_weights_array[2359296];
	sprintf(filename, "%s/conv5_1_weights_array_file", load_data_dir);
	load_float(filename,conv5_1_weights_dim,conv5_1_weights_array);
	
	conv5_1_param->kernel = conv5_1_weights_array;
	SIZE conv5_1_bias_dim = 512;
	static DATA conv5_1_bias_array[512];
	sprintf(filename, "%s/conv5_1_bias_array_file", load_data_dir);
	load_float(filename,conv5_1_bias_dim,conv5_1_bias_array);
	conv5_1_param->bias = conv5_1_bias_array;
	
	
	
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
	conv5_2_param->maxog = 4;
	
	SIZE conv5_2_weights_dim = 512 * 512 * 3 * 3;
	static DATA conv5_2_weights_array[2359296];
	sprintf(filename, "%s/conv5_2_weights_array_file", load_data_dir);
	load_float(filename,conv5_2_weights_dim,conv5_2_weights_array);
	
	conv5_2_param->kernel = conv5_2_weights_array;
	SIZE conv5_2_bias_dim = 512;
	static DATA conv5_2_bias_array[512];
	sprintf(filename, "%s/conv5_2_bias_array_file", load_data_dir);
	load_float(filename,conv5_2_bias_dim,conv5_2_bias_array);
	conv5_2_param->bias = conv5_2_bias_array;
	
	
	
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
	conv5_3_param->maxog = 4;
	
	SIZE conv5_3_weights_dim = 512 * 512 * 3 * 3;
	static DATA conv5_3_weights_array[2359296];
	sprintf(filename, "%s/conv5_3_weights_array_file", load_data_dir);
	load_float(filename,conv5_3_weights_dim,conv5_3_weights_array);
	
	conv5_3_param->kernel = conv5_3_weights_array;
	SIZE conv5_3_bias_dim = 512;
	static DATA conv5_3_bias_array[512];
	sprintf(filename, "%s/conv5_3_bias_array_file", load_data_dir);
	load_float(filename,conv5_3_bias_dim,conv5_3_bias_array);
	conv5_3_param->bias = conv5_3_bias_array;
	
	SIZE conv5_3_dim = 512 * 7 * 7;
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 4096
	 * W 4096 x 25088
	 * X 25088 x 1
	 */
	SIZE fc6_dim = 4096;
	fc6_param = linear_create();
	fc6_param->out_s = 4096;
	fc6_param->in_s = conv5_3_dim;
	static DATA fc6_weights_array[102760448];
	sprintf(filename, "%s/fc6_weights_array_file", load_data_dir);
	load_float(filename,102760448,fc6_weights_array);
	fc6_param->weights = fc6_weights_array;
	static DATA fc6_bias_array[4096];
	sprintf(filename, "%s/fc6_bias_array_file", load_data_dir);
	load_float(filename,4096,fc6_bias_array);
	fc6_param->bias = fc6_bias_array;
	
	
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 4096
	 * W 4096 x 4096
	 * X 4096 x 1
	 */
	SIZE fc7_dim = 4096;
	fc7_param = linear_create();
	fc7_param->out_s = 4096;
	fc7_param->in_s = fc6_dim;
	static DATA fc7_weights_array[16777216];
	sprintf(filename, "%s/fc7_weights_array_file", load_data_dir);
	load_float(filename,16777216,fc7_weights_array);
	fc7_param->weights = fc7_weights_array;
	static DATA fc7_bias_array[4096];
	sprintf(filename, "%s/fc7_bias_array_file", load_data_dir);
	load_float(filename,4096,fc7_bias_array);
	fc7_param->bias = fc7_bias_array;
	
	
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 4096
	 * X 4096 x 1
	 */
	SIZE fc8_dim = 1000;
	fc8_param = linear_create();
	fc8_param->out_s = 1000;
	fc8_param->in_s = fc7_dim;
	static DATA fc8_weights_array[4096000];
	sprintf(filename, "%s/fc8_weights_array_file", load_data_dir);
	load_float(filename,4096000,fc8_weights_array);
	fc8_param->weights = fc8_weights_array;
	static DATA fc8_bias_array[1000];
	sprintf(filename, "%s/fc8_bias_array_file", load_data_dir);
	load_float(filename,1000,fc8_bias_array);
	fc8_param->bias = fc8_bias_array;
	
	
	
}

void cnnMain(DATA* image, DATA* results)
{
	double time;
	SIZE input_size[] = { 3, 224, 224 };
	DATA* input_output = image;
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 224 x 224 --> OF = 64 x 224 x 224
	 * W 64 x 3 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv1_1_size[] = { 64, 224, 224 };
	static DATA conv1_1_output[3211264];
	SIZE conv1_1_stride[] = { 1, 1 };
	SIZE conv1_1_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv1_1_param, input_output, conv1_1_output, input_size, conv1_1_size, conv1_1_stride, conv1_1_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 224 x 224 --> OF = 64 x 112 x 112
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv1_2_size[] = { 64, 112, 112 };
	static DATA conv1_2_output[802816];
	SIZE conv1_2_stride[] = { 1, 1 };
	SIZE conv1_2_pad[] = { 1, 1 };
	
	SIZE conv1_2_pool_size[] = { 64, 224, 224 };
	SIZE conv1_2_pool_dim = 64 * 224 * 224;
	DATA* conv1_2_pool = (DATA *) calloc(conv1_2_pool_dim, sizeof(DATA));
	SIZE conv1_2_pool_filter[] = { 2, 2 };
	SIZE conv1_2_pool_stride[] = { 2, 2 };
	SIZE conv1_2_pool_pad[] = { 0, 0 };
	spatconv_forward_sw(conv1_2_param, conv1_1_output, conv1_2_pool, conv1_1_size, conv1_2_pool_size, conv1_2_stride, conv1_2_pad, true);
	maxpool_forward(conv1_2_pool, conv1_2_output, conv1_2_pool_size, conv1_2_size, conv1_2_pool_filter, conv1_2_pool_stride, conv1_2_pool_pad);
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 112 x 112 --> OF = 128 x 112 x 112
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv2_1_size[] = { 128, 112, 112 };
	static DATA conv2_1_output[1605632];
	SIZE conv2_1_stride[] = { 1, 1 };
	SIZE conv2_1_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv2_1_param, conv1_2_output, conv2_1_output, conv1_2_size, conv2_1_size, conv2_1_stride, conv2_1_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 112 x 112 --> OF = 128 x 56 x 56
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv2_2_size[] = { 128, 56, 56 };
	static DATA conv2_2_output[401408];
	SIZE conv2_2_stride[] = { 1, 1 };
	SIZE conv2_2_pad[] = { 1, 1 };
	
	SIZE conv2_2_pool_size[] = { 128, 112, 112 };
	SIZE conv2_2_pool_dim = 128 * 112 * 112;
	DATA* conv2_2_pool = (DATA *) calloc(conv2_2_pool_dim, sizeof(DATA));
	SIZE conv2_2_pool_filter[] = { 2, 2 };
	SIZE conv2_2_pool_stride[] = { 2, 2 };
	SIZE conv2_2_pool_pad[] = { 0, 0 };
	spatconv_forward_sw(conv2_2_param, conv2_1_output, conv2_2_pool, conv2_1_size, conv2_2_pool_size, conv2_2_stride, conv2_2_pad, true);
	maxpool_forward(conv2_2_pool, conv2_2_output, conv2_2_pool_size, conv2_2_size, conv2_2_pool_filter, conv2_2_pool_stride, conv2_2_pool_pad);
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 56 x 56 --> OF = 256 x 56 x 56
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv3_1_size[] = { 256, 56, 56 };
	static DATA conv3_1_output[802816];
	SIZE conv3_1_stride[] = { 1, 1 };
	SIZE conv3_1_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv3_1_param, conv2_2_output, conv3_1_output, conv2_2_size, conv3_1_size, conv3_1_stride, conv3_1_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 56 x 56 --> OF = 256 x 56 x 56
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv3_2_size[] = { 256, 56, 56 };
	static DATA conv3_2_output[802816];
	SIZE conv3_2_stride[] = { 1, 1 };
	SIZE conv3_2_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv3_2_param, conv3_1_output, conv3_2_output, conv3_1_size, conv3_2_size, conv3_2_stride, conv3_2_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 56 x 56 --> OF = 256 x 28 x 28
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv3_3_size[] = { 256, 28, 28 };
	static DATA conv3_3_output[200704];
	SIZE conv3_3_stride[] = { 1, 1 };
	SIZE conv3_3_pad[] = { 1, 1 };
	
	SIZE conv3_3_pool_size[] = { 256, 56, 56 };
	SIZE conv3_3_pool_dim = 256 * 56 * 56;
	DATA* conv3_3_pool = (DATA *) calloc(conv3_3_pool_dim, sizeof(DATA));
	SIZE conv3_3_pool_filter[] = { 2, 2 };
	SIZE conv3_3_pool_stride[] = { 2, 2 };
	SIZE conv3_3_pool_pad[] = { 0, 0 };
	spatconv_forward_sw(conv3_3_param, conv3_2_output, conv3_3_pool, conv3_2_size, conv3_3_pool_size, conv3_3_stride, conv3_3_pad, true);
	maxpool_forward(conv3_3_pool, conv3_3_output, conv3_3_pool_size, conv3_3_size, conv3_3_pool_filter, conv3_3_pool_stride, conv3_3_pool_pad);
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 28 x 28 --> OF = 512 x 28 x 28
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv4_1_size[] = { 512, 28, 28 };
	static DATA conv4_1_output[401408];
	SIZE conv4_1_stride[] = { 1, 1 };
	SIZE conv4_1_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv4_1_param, conv3_3_output, conv4_1_output, conv3_3_size, conv4_1_size, conv4_1_stride, conv4_1_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 28 x 28 --> OF = 512 x 28 x 28
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv4_2_size[] = { 512, 28, 28 };
	static DATA conv4_2_output[401408];
	SIZE conv4_2_stride[] = { 1, 1 };
	SIZE conv4_2_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv4_2_param, conv4_1_output, conv4_2_output, conv4_1_size, conv4_2_size, conv4_2_stride, conv4_2_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 28 x 28 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv4_3_size[] = { 512, 14, 14 };
	static DATA conv4_3_output[100352];
	SIZE conv4_3_stride[] = { 1, 1 };
	SIZE conv4_3_pad[] = { 1, 1 };
	
	SIZE conv4_3_pool_size[] = { 512, 28, 28 };
	SIZE conv4_3_pool_dim = 512 * 28 * 28;
	DATA* conv4_3_pool = (DATA *) calloc(conv4_3_pool_dim, sizeof(DATA));
	SIZE conv4_3_pool_filter[] = { 2, 2 };
	SIZE conv4_3_pool_stride[] = { 2, 2 };
	SIZE conv4_3_pool_pad[] = { 0, 0 };
	spatconv_forward_sw(conv4_3_param, conv4_2_output, conv4_3_pool, conv4_2_size, conv4_3_pool_size, conv4_3_stride, conv4_3_pad, true);
	maxpool_forward(conv4_3_pool, conv4_3_output, conv4_3_pool_size, conv4_3_size, conv4_3_pool_filter, conv4_3_pool_stride, conv4_3_pool_pad);
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv5_1_size[] = { 512, 14, 14 };
	static DATA conv5_1_output[100352];
	SIZE conv5_1_stride[] = { 1, 1 };
	SIZE conv5_1_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv5_1_param, conv4_3_output, conv5_1_output, conv4_3_size, conv5_1_size, conv5_1_stride, conv5_1_pad, true);
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 14 x 14 --> OF = 512 x 14 x 14
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE conv5_2_size[] = { 512, 14, 14 };
	static DATA conv5_2_output[100352];
	SIZE conv5_2_stride[] = { 1, 1 };
	SIZE conv5_2_pad[] = { 1, 1 };
	
	spatconv_forward_sw(conv5_2_param, conv5_1_output, conv5_2_output, conv5_1_size, conv5_2_size, conv5_2_stride, conv5_2_pad, true);
	
	
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
	static DATA conv5_3_output[25088];
	SIZE conv5_3_stride[] = { 1, 1 };
	SIZE conv5_3_pad[] = { 1, 1 };
	
	SIZE conv5_3_pool_size[] = { 512, 14, 14 };
	SIZE conv5_3_pool_dim = 512 * 14 * 14;
	DATA* conv5_3_pool = (DATA *) calloc(conv5_3_pool_dim, sizeof(DATA));
	SIZE conv5_3_pool_filter[] = { 2, 2 };
	SIZE conv5_3_pool_stride[] = { 2, 2 };
	SIZE conv5_3_pool_pad[] = { 0, 0 };
	spatconv_forward_sw(conv5_3_param, conv5_2_output, conv5_3_pool, conv5_2_size, conv5_3_pool_size, conv5_3_stride, conv5_3_pad, true);
	maxpool_forward(conv5_3_pool, conv5_3_output, conv5_3_pool_size, conv5_3_size, conv5_3_pool_filter, conv5_3_pool_stride, conv5_3_pool_pad);
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 4096
	 * W 4096 x 25088
	 * X 25088 x 1
	 */
	SIZE fc6_size[] = { 4096, 1, 1 };
	SIZE fc6_dim = 4096;
	static DATA fc6_output[4096];
	linear_forward(fc6_param, conv5_3_output, fc6_output, conv5_3_dim, fc6_dim);
	
	DATA* relu6_output = (DATA *) calloc(fc6_dim, sizeof(DATA));
	relu_forward(fc6_output, relu6_output, fc6_size);
	
	DATA* drop6_output = relu6_output;
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 4096
	 * W 4096 x 4096
	 * X 4096 x 1
	 */
	SIZE fc7_size[] = { 4096, 1, 1 };
	SIZE fc7_dim = 4096;
	static DATA fc7_output[4096];
	linear_forward(fc7_param, drop6_output, fc7_output, fc6_dim, fc7_dim);
	
	DATA* relu7_output = (DATA *) calloc(fc7_dim, sizeof(DATA));
	relu_forward(fc7_output, relu7_output, fc7_size);
	
	DATA* drop7_output = relu7_output;
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 4096
	 * X 4096 x 1
	 */
	SIZE fc8_size[] = { 1000, 1, 1 };
	SIZE fc8_dim = 1000;
	static DATA* fc8_output = results;
	linear_forward(fc8_param, drop7_output, results, fc7_dim, fc8_dim);
	
	// NO SOFTMAX
	for(unsigned int i = 0; i < fc8_dim; i++)
	{
		_rprintf_("%d: %f\n", i, fc8_output[i]);
	}
	
}

void free_platform(){
}

