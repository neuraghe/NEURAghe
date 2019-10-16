// This code is auto-generated. Do not edit.

#include "LeNet_Batch.h"



// global variables
SOCMAP soc;
DATA* wPointer;


SPATCONV conv1_param;

SPATCONV conv2_param;

LINEAR_FP16 xw_plus_b_MatMul_param;


LINEAR_FP16 xw_plus_b_1_MatMul_param;



void init_platform(char* bitstream){
	init_soc(&soc, &wPointer, _MAXMEM_, 0, bitstream);
}

void cnnMainInit(VARNAME load_data_dir)
{
	double time;
	VARNAME filename;
	
	
	/*
	 * Convolution layer
	 * IF = 1 x 28 x 28 --> OF = 20 x 12 x 12
	 * W 20 x 1 x 5 x 5
	 * Pad    0x0
	 * Stride 1x1
	 */
	conv1_param = spatconv_create();
	conv1_param->pout = 20;
	conv1_param->pin = 1;
	conv1_param->kern_s[0] = 20;
	conv1_param->kern_s[1] = 1;
	conv1_param->kern_s[2] = 5;
	conv1_param->kern_s[3] = 5;
	conv1_param->maxog = 4;
	
	// preprocessed weight dim = 2240
	// original weight shape = 20 x 1 x 5 x 5;
	sprintf(filename, "%s/conv1_weights_array_file", load_data_dir);
	load_fixed(filename,2240,wPointer);
	conv1_param->kernel = wPointer;
	wPointer = wPointer + 2240;
	
	SIZE conv1_bias_dim = 20;
	static DATA conv1_bias_array[20];
	sprintf(filename, "%s/conv1_bias_array_file", load_data_dir);
	load_fixed(filename,conv1_bias_dim,wPointer);
	conv1_param->bias = conv1_bias_array;
	
	SIZE conv1_dim = 20 * 12 * 12;
	
	
	/*
	 * Convolution layer
	 * IF = 20 x 12 x 12 --> OF = 50 x 4 x 4
	 * W 50 x 20 x 5 x 5
	 * Pad    0x0
	 * Stride 1x1
	 */
	conv2_param = spatconv_create();
	conv2_param->pout = 50;
	conv2_param->pin = 20;
	conv2_param->kern_s[0] = 50;
	conv2_param->kern_s[1] = 20;
	conv2_param->kern_s[2] = 5;
	conv2_param->kern_s[3] = 5;
	conv2_param->maxog = 4;
	
	// preprocessed weight dim = 29120
	// original weight shape = 50 x 20 x 5 x 5;
	sprintf(filename, "%s/conv2_weights_array_file", load_data_dir);
	load_fixed(filename,29120,wPointer);
	conv2_param->kernel = wPointer;
	wPointer = wPointer + 29120;
	
	SIZE conv2_bias_dim = 50;
	static DATA conv2_bias_array[50];
	sprintf(filename, "%s/conv2_bias_array_file", load_data_dir);
	load_fixed(filename,conv2_bias_dim,wPointer);
	conv2_param->bias = conv2_bias_array;
	
	SIZE conv2_dim = 50 * 4 * 4;
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 500
	 * W 500 x 800
	 * X 800 x 1
	 */
	SIZE xw_plus_b_MatMul_dim = 500;
	xw_plus_b_MatMul_param = linear_fp16_create();
	xw_plus_b_MatMul_param->out_s = 500;
	xw_plus_b_MatMul_param->in_s = conv2_dim;
	static DATA xw_plus_b_MatMul_weights_array[400000];
	sprintf(filename, "%s/xw_plus_b_MatMul_weights_array_file", load_data_dir);
	load_fixed(filename,400000,xw_plus_b_MatMul_weights_array);
	xw_plus_b_MatMul_param->weights = xw_plus_b_MatMul_weights_array;
	static DATA xw_plus_b_MatMul_bias_array[500];
	sprintf(filename, "%s/xw_plus_b_MatMul_bias_array_file", load_data_dir);
	load_fixed(filename,500,xw_plus_b_MatMul_bias_array);
	xw_plus_b_MatMul_param->bias = xw_plus_b_MatMul_bias_array;
	
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 10
	 * W 10 x 500
	 * X 500 x 1
	 */
	SIZE xw_plus_b_1_MatMul_dim = 10;
	xw_plus_b_1_MatMul_param = linear_fp16_create();
	xw_plus_b_1_MatMul_param->out_s = 10;
	xw_plus_b_1_MatMul_param->in_s = xw_plus_b_MatMul_dim;
	static DATA xw_plus_b_1_MatMul_weights_array[5000];
	sprintf(filename, "%s/xw_plus_b_1_MatMul_weights_array_file", load_data_dir);
	load_fixed(filename,5000,xw_plus_b_1_MatMul_weights_array);
	xw_plus_b_1_MatMul_param->weights = xw_plus_b_1_MatMul_weights_array;
	static DATA xw_plus_b_1_MatMul_bias_array[10];
	sprintf(filename, "%s/xw_plus_b_1_MatMul_bias_array_file", load_data_dir);
	load_fixed(filename,10,xw_plus_b_1_MatMul_bias_array);
	xw_plus_b_1_MatMul_param->bias = xw_plus_b_1_MatMul_bias_array;
	
	
	
}

void cnnMain(DATA* image, float* results)
{
	double time;
	SIZE Placeholder_size[] = { 1, 28, 28 };
	SIZE Placeholder_dim = 1 * 28 * 28;
	DATA* Placeholder_output = image;
	
	int job_id = 0;
	
	/*
	 * Convolution layer
	 * IF = 1 x 28 x 28 --> OF = 20 x 12 x 12
	 * W 20 x 1 x 5 x 5
	 * Pad    0x0
	 * Stride 1x1
	 */
	SIZE conv1_size[] = { 20, 12, 12 };
	SIZE conv1_dim = 20 * 12 * 12;
	// conv1_dim = 2880
	static DATA conv1_output[2880];
	SIZE conv1_stride[] = { 1, 1 };
	SIZE conv1_pad[] = { 0, 0 };
	
	interlace(soc->in, Placeholder_output, 5, Placeholder_size[0], Placeholder_size[1], Placeholder_size[2]);
	basicBlock_hw(conv1_param, soc->in, soc->out, soc, Placeholder_size, conv1_size, conv1_stride, conv1_pad, POOL_2x2, MAX_POOL, false);
	
	
	/*
	 * Convolution layer
	 * IF = 20 x 12 x 12 --> OF = 50 x 4 x 4
	 * W 50 x 20 x 5 x 5
	 * Pad    0x0
	 * Stride 1x1
	 */
	SIZE conv2_size[] = { 50, 4, 4 };
	SIZE conv2_dim = 50 * 4 * 4;
	// conv2_dim = 800
	static DATA conv2_output[800];
	SIZE conv2_stride[] = { 1, 1 };
	SIZE conv2_pad[] = { 0, 0 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = basicBlock_hw(conv2_param, soc->in, soc->out, soc, conv1_size, conv2_size, conv2_stride, conv2_pad, POOL_2x2, MAX_POOL, false);
	
	
	spatconv_wait(soc, job_id);

	/*
	 * Fully-connected layer
	 * num outputs = 500
	 * W 500 x 800
	 * X 800 x 1
	 */
	SIZE xw_plus_b_MatMul_conv2_output_dstride[] = { 1, 1 };
	deinterlace(conv2_output, soc->out, conv2_size[0], conv2_size[1], conv2_size[2], xw_plus_b_MatMul_conv2_output_dstride);
	SIZE xw_plus_b_MatMul_size[] = { 500, 1, 1 };
	SIZE xw_plus_b_MatMul_dim = 500;
	static DATA xw_plus_b_MatMul_output[500];
	linear_fp16_forward(xw_plus_b_MatMul_param, conv2_output, xw_plus_b_MatMul_output, conv2_dim, xw_plus_b_MatMul_dim);
	
	DATA* Relu_output = (DATA *) calloc(xw_plus_b_MatMul_dim, sizeof(DATA));
	relu_forward(xw_plus_b_MatMul_output, Relu_output, xw_plus_b_MatMul_size);
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 10
	 * W 10 x 500
	 * X 500 x 1
	 */
	SIZE xw_plus_b_1_MatMul_size[] = { 10, 1, 1 };
	SIZE xw_plus_b_1_MatMul_dim = 10;
	static DATA xw_plus_b_1_MatMul_output[xw_plus_b_1_MatMul_dim];
	linear_fp16_forward(xw_plus_b_1_MatMul_param, Relu_output, xw_plus_b_1_MatMul_output, xw_plus_b_MatMul_dim, xw_plus_b_1_MatMul_dim);
	
	// Convert output
	for(unsigned int i = 0; i < xw_plus_b_1_MatMul_dim; i++)
		results[i] = (float) FIXED2FLOAT(xw_plus_b_1_MatMul_output[i]);
	
}

void free_platform(){
	munmap_soc(soc);
	free(soc);
}

