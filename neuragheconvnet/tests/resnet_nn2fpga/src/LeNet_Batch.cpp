// This code is auto-generated. Do not edit.

#include "LeNet_Batch.h"

// global variables


SPATCONV scale1_conv2d_5x5_0_param;

SPATCONV scale1_conv2d_5x5_1_param;

SPATCONV scale1_conv2d_5x5_2_param;

SPATCONV scale1_conv2d_5x5_3_param;




SPATCONV scale2_block0_A_conv2d_param;

SPATCONV scale2_block0_B_conv2d_param;


SPATCONV scale2_block1_A_conv2d_param;

SPATCONV scale2_block1_B_conv2d_param;


SPATCONV scale3_block0_shortcut_conv2d_param;

SPATCONV scale3_block0_A_conv2d_param;

SPATCONV scale3_block0_B_conv2d_param;


SPATCONV scale3_block1_A_conv2d_param;

SPATCONV scale3_block1_B_conv2d_param;


SPATCONV scale4_block0_shortcut_conv2d_param;

SPATCONV scale4_block0_A_conv2d_param;

SPATCONV scale4_block0_B_conv2d_param;


SPATCONV scale4_block1_A_conv2d_param;

SPATCONV scale4_block1_B_conv2d_param;


SPATCONV scale5_block0_shortcut_conv2d_param;

SPATCONV scale5_block0_A_conv2d_param;

SPATCONV scale5_block0_B_conv2d_param;


SPATCONV scale5_block1_A_conv2d_param;

SPATCONV scale5_block1_B_conv2d_param;



LINEAR xw_plus_b_MatMul_param;


SOCMAP soc;
DATA* wPointer;


void init_platform(char* bitstream){
	init_soc(&soc, &wPointer, _MAXMEM_, 2473344, bitstream);
}

void cnnMainInit(VARNAME load_data_dir)
{
	double time;
	VARNAME filename;
	
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	scale1_conv2d_5x5_0_param = spatconv_create();
	scale1_conv2d_5x5_0_param->pout = 64;
	scale1_conv2d_5x5_0_param->pin = 3;
	scale1_conv2d_5x5_0_param->kern_s[0] = 64;
	scale1_conv2d_5x5_0_param->kern_s[1] = 3;
	scale1_conv2d_5x5_0_param->kern_s[2] = 5;
	scale1_conv2d_5x5_0_param->kern_s[3] = 5;
	scale1_conv2d_5x5_0_param->maxog = 4;
	
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_0_weights_array_file", load_data_dir);
	load_fixed(filename,7168,wPointer);
	scale1_conv2d_5x5_0_param->kernel = wPointer;
	wPointer = wPointer + 7168;
	
	SIZE scale1_conv2d_5x5_0_bias_dim = 64;
	static DATA scale1_conv2d_5x5_0_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_0_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_0_bias_dim,wPointer);
	scale1_conv2d_5x5_0_param->bias = scale1_conv2d_5x5_0_bias_array;
	
	SIZE scale1_conv2d_5x5_0_dim = 64 * 113 * 113;
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	scale1_conv2d_5x5_1_param = spatconv_create();
	scale1_conv2d_5x5_1_param->pout = 64;
	scale1_conv2d_5x5_1_param->pin = 3;
	scale1_conv2d_5x5_1_param->kern_s[0] = 64;
	scale1_conv2d_5x5_1_param->kern_s[1] = 3;
	scale1_conv2d_5x5_1_param->kern_s[2] = 5;
	scale1_conv2d_5x5_1_param->kern_s[3] = 5;
	scale1_conv2d_5x5_1_param->maxog = 4;
	
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_1_weights_array_file", load_data_dir);
	load_fixed(filename,7168,wPointer);
	scale1_conv2d_5x5_1_param->kernel = wPointer;
	wPointer = wPointer + 7168;
	
	SIZE scale1_conv2d_5x5_1_bias_dim = 64;
	static DATA scale1_conv2d_5x5_1_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_1_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_1_bias_dim,wPointer);
	scale1_conv2d_5x5_1_param->bias = scale1_conv2d_5x5_1_bias_array;
	
	SIZE scale1_conv2d_5x5_1_dim = 64 * 113 * 113;
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	scale1_conv2d_5x5_2_param = spatconv_create();
	scale1_conv2d_5x5_2_param->pout = 64;
	scale1_conv2d_5x5_2_param->pin = 3;
	scale1_conv2d_5x5_2_param->kern_s[0] = 64;
	scale1_conv2d_5x5_2_param->kern_s[1] = 3;
	scale1_conv2d_5x5_2_param->kern_s[2] = 5;
	scale1_conv2d_5x5_2_param->kern_s[3] = 5;
	scale1_conv2d_5x5_2_param->maxog = 4;
	
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_2_weights_array_file", load_data_dir);
	load_fixed(filename,7168,wPointer);
	scale1_conv2d_5x5_2_param->kernel = wPointer;
	wPointer = wPointer + 7168;
	
	SIZE scale1_conv2d_5x5_2_bias_dim = 64;
	static DATA scale1_conv2d_5x5_2_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_2_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_2_bias_dim,wPointer);
	scale1_conv2d_5x5_2_param->bias = scale1_conv2d_5x5_2_bias_array;
	
	SIZE scale1_conv2d_5x5_2_dim = 64 * 113 * 113;
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	scale1_conv2d_5x5_3_param = spatconv_create();
	scale1_conv2d_5x5_3_param->pout = 64;
	scale1_conv2d_5x5_3_param->pin = 3;
	scale1_conv2d_5x5_3_param->kern_s[0] = 64;
	scale1_conv2d_5x5_3_param->kern_s[1] = 3;
	scale1_conv2d_5x5_3_param->kern_s[2] = 5;
	scale1_conv2d_5x5_3_param->kern_s[3] = 5;
	scale1_conv2d_5x5_3_param->maxog = 4;
	
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_3_weights_array_file", load_data_dir);
	load_fixed(filename,7168,wPointer);
	scale1_conv2d_5x5_3_param->kernel = wPointer;
	wPointer = wPointer + 7168;
	
	SIZE scale1_conv2d_5x5_3_bias_dim = 64;
	static DATA scale1_conv2d_5x5_3_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_3_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_3_bias_dim,wPointer);
	scale1_conv2d_5x5_3_param->bias = scale1_conv2d_5x5_3_bias_array;
	
	SIZE scale1_conv2d_5x5_3_dim = 64 * 113 * 113;
	
	
	
	SIZE scale2_max_pool_dim = 64 * 56 * 56;
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale2_block0_A_conv2d_param = spatconv_create();
	scale2_block0_A_conv2d_param->pout = 64;
	scale2_block0_A_conv2d_param->pin = 64;
	scale2_block0_A_conv2d_param->kern_s[0] = 64;
	scale2_block0_A_conv2d_param->kern_s[1] = 64;
	scale2_block0_A_conv2d_param->kern_s[2] = 3;
	scale2_block0_A_conv2d_param->kern_s[3] = 3;
	scale2_block0_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,43008,wPointer);
	scale2_block0_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 43008;
	
	SIZE scale2_block0_A_conv2d_bias_dim = 64;
	static DATA scale2_block0_A_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_A_conv2d_bias_dim,wPointer);
	scale2_block0_A_conv2d_param->bias = scale2_block0_A_conv2d_bias_array;
	
	SIZE scale2_block0_A_conv2d_dim = 64 * 56 * 56;
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale2_block0_B_conv2d_param = spatconv_create();
	scale2_block0_B_conv2d_param->pout = 64;
	scale2_block0_B_conv2d_param->pin = 64;
	scale2_block0_B_conv2d_param->kern_s[0] = 64;
	scale2_block0_B_conv2d_param->kern_s[1] = 64;
	scale2_block0_B_conv2d_param->kern_s[2] = 3;
	scale2_block0_B_conv2d_param->kern_s[3] = 3;
	scale2_block0_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,43008,wPointer);
	scale2_block0_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 43008;
	
	SIZE scale2_block0_B_conv2d_bias_dim = 64;
	static DATA scale2_block0_B_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_B_conv2d_bias_dim,wPointer);
	scale2_block0_B_conv2d_param->bias = scale2_block0_B_conv2d_bias_array;
	
	SIZE scale2_block0_B_conv2d_dim = 64 * 56 * 56;
	
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale2_block1_A_conv2d_param = spatconv_create();
	scale2_block1_A_conv2d_param->pout = 64;
	scale2_block1_A_conv2d_param->pin = 64;
	scale2_block1_A_conv2d_param->kern_s[0] = 64;
	scale2_block1_A_conv2d_param->kern_s[1] = 64;
	scale2_block1_A_conv2d_param->kern_s[2] = 3;
	scale2_block1_A_conv2d_param->kern_s[3] = 3;
	scale2_block1_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,43008,wPointer);
	scale2_block1_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 43008;
	
	SIZE scale2_block1_A_conv2d_bias_dim = 64;
	static DATA scale2_block1_A_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_A_conv2d_bias_dim,wPointer);
	scale2_block1_A_conv2d_param->bias = scale2_block1_A_conv2d_bias_array;
	
	SIZE scale2_block1_A_conv2d_dim = 64 * 56 * 56;
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale2_block1_B_conv2d_param = spatconv_create();
	scale2_block1_B_conv2d_param->pout = 64;
	scale2_block1_B_conv2d_param->pin = 64;
	scale2_block1_B_conv2d_param->kern_s[0] = 64;
	scale2_block1_B_conv2d_param->kern_s[1] = 64;
	scale2_block1_B_conv2d_param->kern_s[2] = 3;
	scale2_block1_B_conv2d_param->kern_s[3] = 3;
	scale2_block1_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,43008,wPointer);
	scale2_block1_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 43008;
	
	SIZE scale2_block1_B_conv2d_bias_dim = 64;
	static DATA scale2_block1_B_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_B_conv2d_bias_dim,wPointer);
	scale2_block1_B_conv2d_param->bias = scale2_block1_B_conv2d_bias_array;
	
	SIZE scale2_block1_B_conv2d_dim = 64 * 56 * 56;
	
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 128 x 28 x 28
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	scale3_block0_shortcut_conv2d_param = spatconv_create();
	scale3_block0_shortcut_conv2d_param->pout = 128;
	scale3_block0_shortcut_conv2d_param->pin = 64;
	scale3_block0_shortcut_conv2d_param->kern_s[0] = 128;
	scale3_block0_shortcut_conv2d_param->kern_s[1] = 64;
	scale3_block0_shortcut_conv2d_param->kern_s[2] = 3;
	scale3_block0_shortcut_conv2d_param->kern_s[3] = 3;
	scale3_block0_shortcut_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 86016
	// original weight shape = 128 x 64 x 3 x 3;
	sprintf(filename, "%s/scale3_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,86016,wPointer);
	scale3_block0_shortcut_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 86016;
	
	SIZE scale3_block0_shortcut_conv2d_bias_dim = 128;
	static DATA scale3_block0_shortcut_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_shortcut_conv2d_bias_dim,wPointer);
	scale3_block0_shortcut_conv2d_param->bias = scale3_block0_shortcut_conv2d_bias_array;
	
	SIZE scale3_block0_shortcut_conv2d_dim = 128 * 28 * 28;
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 128 x 28 x 28
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	scale3_block0_A_conv2d_param = spatconv_create();
	scale3_block0_A_conv2d_param->pout = 128;
	scale3_block0_A_conv2d_param->pin = 64;
	scale3_block0_A_conv2d_param->kern_s[0] = 128;
	scale3_block0_A_conv2d_param->kern_s[1] = 64;
	scale3_block0_A_conv2d_param->kern_s[2] = 3;
	scale3_block0_A_conv2d_param->kern_s[3] = 3;
	scale3_block0_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 86016
	// original weight shape = 128 x 64 x 3 x 3;
	sprintf(filename, "%s/scale3_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,86016,wPointer);
	scale3_block0_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 86016;
	
	SIZE scale3_block0_A_conv2d_bias_dim = 128;
	static DATA scale3_block0_A_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_A_conv2d_bias_dim,wPointer);
	scale3_block0_A_conv2d_param->bias = scale3_block0_A_conv2d_bias_array;
	
	SIZE scale3_block0_A_conv2d_dim = 128 * 28 * 28;
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 128 x 28 x 28
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale3_block0_B_conv2d_param = spatconv_create();
	scale3_block0_B_conv2d_param->pout = 128;
	scale3_block0_B_conv2d_param->pin = 128;
	scale3_block0_B_conv2d_param->kern_s[0] = 128;
	scale3_block0_B_conv2d_param->kern_s[1] = 128;
	scale3_block0_B_conv2d_param->kern_s[2] = 3;
	scale3_block0_B_conv2d_param->kern_s[3] = 3;
	scale3_block0_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/scale3_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,157696,wPointer);
	scale3_block0_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 157696;
	
	SIZE scale3_block0_B_conv2d_bias_dim = 128;
	static DATA scale3_block0_B_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_B_conv2d_bias_dim,wPointer);
	scale3_block0_B_conv2d_param->bias = scale3_block0_B_conv2d_bias_array;
	
	SIZE scale3_block0_B_conv2d_dim = 128 * 28 * 28;
	
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 128 x 28 x 28
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale3_block1_A_conv2d_param = spatconv_create();
	scale3_block1_A_conv2d_param->pout = 128;
	scale3_block1_A_conv2d_param->pin = 128;
	scale3_block1_A_conv2d_param->kern_s[0] = 128;
	scale3_block1_A_conv2d_param->kern_s[1] = 128;
	scale3_block1_A_conv2d_param->kern_s[2] = 3;
	scale3_block1_A_conv2d_param->kern_s[3] = 3;
	scale3_block1_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/scale3_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,157696,wPointer);
	scale3_block1_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 157696;
	
	SIZE scale3_block1_A_conv2d_bias_dim = 128;
	static DATA scale3_block1_A_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_A_conv2d_bias_dim,wPointer);
	scale3_block1_A_conv2d_param->bias = scale3_block1_A_conv2d_bias_array;
	
	SIZE scale3_block1_A_conv2d_dim = 128 * 28 * 28;
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 128 x 28 x 28
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale3_block1_B_conv2d_param = spatconv_create();
	scale3_block1_B_conv2d_param->pout = 128;
	scale3_block1_B_conv2d_param->pin = 128;
	scale3_block1_B_conv2d_param->kern_s[0] = 128;
	scale3_block1_B_conv2d_param->kern_s[1] = 128;
	scale3_block1_B_conv2d_param->kern_s[2] = 3;
	scale3_block1_B_conv2d_param->kern_s[3] = 3;
	scale3_block1_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/scale3_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,157696,wPointer);
	scale3_block1_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 157696;
	
	SIZE scale3_block1_B_conv2d_bias_dim = 128;
	static DATA scale3_block1_B_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_B_conv2d_bias_dim,wPointer);
	scale3_block1_B_conv2d_param->bias = scale3_block1_B_conv2d_bias_array;
	
	SIZE scale3_block1_B_conv2d_dim = 128 * 28 * 28;
	
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 256 x 14 x 14
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	scale4_block0_shortcut_conv2d_param = spatconv_create();
	scale4_block0_shortcut_conv2d_param->pout = 256;
	scale4_block0_shortcut_conv2d_param->pin = 128;
	scale4_block0_shortcut_conv2d_param->kern_s[0] = 256;
	scale4_block0_shortcut_conv2d_param->kern_s[1] = 128;
	scale4_block0_shortcut_conv2d_param->kern_s[2] = 3;
	scale4_block0_shortcut_conv2d_param->kern_s[3] = 3;
	scale4_block0_shortcut_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 315392
	// original weight shape = 256 x 128 x 3 x 3;
	sprintf(filename, "%s/scale4_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,315392,wPointer);
	scale4_block0_shortcut_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 315392;
	
	SIZE scale4_block0_shortcut_conv2d_bias_dim = 256;
	static DATA scale4_block0_shortcut_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_shortcut_conv2d_bias_dim,wPointer);
	scale4_block0_shortcut_conv2d_param->bias = scale4_block0_shortcut_conv2d_bias_array;
	
	SIZE scale4_block0_shortcut_conv2d_dim = 256 * 14 * 14;
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 256 x 14 x 14
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	scale4_block0_A_conv2d_param = spatconv_create();
	scale4_block0_A_conv2d_param->pout = 256;
	scale4_block0_A_conv2d_param->pin = 128;
	scale4_block0_A_conv2d_param->kern_s[0] = 256;
	scale4_block0_A_conv2d_param->kern_s[1] = 128;
	scale4_block0_A_conv2d_param->kern_s[2] = 3;
	scale4_block0_A_conv2d_param->kern_s[3] = 3;
	scale4_block0_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 315392
	// original weight shape = 256 x 128 x 3 x 3;
	sprintf(filename, "%s/scale4_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,315392,wPointer);
	scale4_block0_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 315392;
	
	SIZE scale4_block0_A_conv2d_bias_dim = 256;
	static DATA scale4_block0_A_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_A_conv2d_bias_dim,wPointer);
	scale4_block0_A_conv2d_param->bias = scale4_block0_A_conv2d_bias_array;
	
	SIZE scale4_block0_A_conv2d_dim = 256 * 14 * 14;
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale4_block0_B_conv2d_param = spatconv_create();
	scale4_block0_B_conv2d_param->pout = 256;
	scale4_block0_B_conv2d_param->pin = 256;
	scale4_block0_B_conv2d_param->kern_s[0] = 256;
	scale4_block0_B_conv2d_param->kern_s[1] = 256;
	scale4_block0_B_conv2d_param->kern_s[2] = 3;
	scale4_block0_B_conv2d_param->kern_s[3] = 3;
	scale4_block0_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/scale4_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,630784,wPointer);
	scale4_block0_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 630784;
	
	SIZE scale4_block0_B_conv2d_bias_dim = 256;
	static DATA scale4_block0_B_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_B_conv2d_bias_dim,wPointer);
	scale4_block0_B_conv2d_param->bias = scale4_block0_B_conv2d_bias_array;
	
	SIZE scale4_block0_B_conv2d_dim = 256 * 14 * 14;
	
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale4_block1_A_conv2d_param = spatconv_create();
	scale4_block1_A_conv2d_param->pout = 256;
	scale4_block1_A_conv2d_param->pin = 256;
	scale4_block1_A_conv2d_param->kern_s[0] = 256;
	scale4_block1_A_conv2d_param->kern_s[1] = 256;
	scale4_block1_A_conv2d_param->kern_s[2] = 3;
	scale4_block1_A_conv2d_param->kern_s[3] = 3;
	scale4_block1_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/scale4_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,630784,wPointer);
	scale4_block1_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 630784;
	
	SIZE scale4_block1_A_conv2d_bias_dim = 256;
	static DATA scale4_block1_A_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_A_conv2d_bias_dim,wPointer);
	scale4_block1_A_conv2d_param->bias = scale4_block1_A_conv2d_bias_array;
	
	SIZE scale4_block1_A_conv2d_dim = 256 * 14 * 14;
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale4_block1_B_conv2d_param = spatconv_create();
	scale4_block1_B_conv2d_param->pout = 256;
	scale4_block1_B_conv2d_param->pin = 256;
	scale4_block1_B_conv2d_param->kern_s[0] = 256;
	scale4_block1_B_conv2d_param->kern_s[1] = 256;
	scale4_block1_B_conv2d_param->kern_s[2] = 3;
	scale4_block1_B_conv2d_param->kern_s[3] = 3;
	scale4_block1_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/scale4_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,630784,wPointer);
	scale4_block1_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 630784;
	
	SIZE scale4_block1_B_conv2d_bias_dim = 256;
	static DATA scale4_block1_B_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_B_conv2d_bias_dim,wPointer);
	scale4_block1_B_conv2d_param->bias = scale4_block1_B_conv2d_bias_array;
	
	SIZE scale4_block1_B_conv2d_dim = 256 * 14 * 14;
	
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	scale5_block0_shortcut_conv2d_param = spatconv_create();
	scale5_block0_shortcut_conv2d_param->pout = 512;
	scale5_block0_shortcut_conv2d_param->pin = 256;
	scale5_block0_shortcut_conv2d_param->kern_s[0] = 512;
	scale5_block0_shortcut_conv2d_param->kern_s[1] = 256;
	scale5_block0_shortcut_conv2d_param->kern_s[2] = 3;
	scale5_block0_shortcut_conv2d_param->kern_s[3] = 3;
	scale5_block0_shortcut_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 1261568
	// original weight shape = 512 x 256 x 3 x 3;
	sprintf(filename, "%s/scale5_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,1261568,wPointer);
	scale5_block0_shortcut_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 1261568;
	
	SIZE scale5_block0_shortcut_conv2d_bias_dim = 512;
	static DATA scale5_block0_shortcut_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_shortcut_conv2d_bias_dim,wPointer);
	scale5_block0_shortcut_conv2d_param->bias = scale5_block0_shortcut_conv2d_bias_array;
	
	SIZE scale5_block0_shortcut_conv2d_dim = 512 * 7 * 7;
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	scale5_block0_A_conv2d_param = spatconv_create();
	scale5_block0_A_conv2d_param->pout = 512;
	scale5_block0_A_conv2d_param->pin = 256;
	scale5_block0_A_conv2d_param->kern_s[0] = 512;
	scale5_block0_A_conv2d_param->kern_s[1] = 256;
	scale5_block0_A_conv2d_param->kern_s[2] = 3;
	scale5_block0_A_conv2d_param->kern_s[3] = 3;
	scale5_block0_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 1261568
	// original weight shape = 512 x 256 x 3 x 3;
	sprintf(filename, "%s/scale5_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,1261568,wPointer);
	scale5_block0_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 1261568;
	
	SIZE scale5_block0_A_conv2d_bias_dim = 512;
	static DATA scale5_block0_A_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_A_conv2d_bias_dim,wPointer);
	scale5_block0_A_conv2d_param->bias = scale5_block0_A_conv2d_bias_array;
	
	SIZE scale5_block0_A_conv2d_dim = 512 * 7 * 7;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale5_block0_B_conv2d_param = spatconv_create();
	scale5_block0_B_conv2d_param->pout = 512;
	scale5_block0_B_conv2d_param->pin = 512;
	scale5_block0_B_conv2d_param->kern_s[0] = 512;
	scale5_block0_B_conv2d_param->kern_s[1] = 512;
	scale5_block0_B_conv2d_param->kern_s[2] = 3;
	scale5_block0_B_conv2d_param->kern_s[3] = 3;
	scale5_block0_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/scale5_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	scale5_block0_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	SIZE scale5_block0_B_conv2d_bias_dim = 512;
	static DATA scale5_block0_B_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_B_conv2d_bias_dim,wPointer);
	scale5_block0_B_conv2d_param->bias = scale5_block0_B_conv2d_bias_array;
	
	SIZE scale5_block0_B_conv2d_dim = 512 * 7 * 7;
	
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale5_block1_A_conv2d_param = spatconv_create();
	scale5_block1_A_conv2d_param->pout = 512;
	scale5_block1_A_conv2d_param->pin = 512;
	scale5_block1_A_conv2d_param->kern_s[0] = 512;
	scale5_block1_A_conv2d_param->kern_s[1] = 512;
	scale5_block1_A_conv2d_param->kern_s[2] = 3;
	scale5_block1_A_conv2d_param->kern_s[3] = 3;
	scale5_block1_A_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/scale5_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	scale5_block1_A_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	SIZE scale5_block1_A_conv2d_bias_dim = 512;
	static DATA scale5_block1_A_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_A_conv2d_bias_dim,wPointer);
	scale5_block1_A_conv2d_param->bias = scale5_block1_A_conv2d_bias_array;
	
	SIZE scale5_block1_A_conv2d_dim = 512 * 7 * 7;
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	scale5_block1_B_conv2d_param = spatconv_create();
	scale5_block1_B_conv2d_param->pout = 512;
	scale5_block1_B_conv2d_param->pin = 512;
	scale5_block1_B_conv2d_param->kern_s[0] = 512;
	scale5_block1_B_conv2d_param->kern_s[1] = 512;
	scale5_block1_B_conv2d_param->kern_s[2] = 3;
	scale5_block1_B_conv2d_param->kern_s[3] = 3;
	scale5_block1_B_conv2d_param->maxog = 4;
	
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/scale5_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,2465792,wPointer);
	scale5_block1_B_conv2d_param->kernel = wPointer;
	wPointer = wPointer + 2465792;
	
	SIZE scale5_block1_B_conv2d_bias_dim = 512;
	static DATA scale5_block1_B_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_B_conv2d_bias_dim,wPointer);
	scale5_block1_B_conv2d_param->bias = scale5_block1_B_conv2d_bias_array;
	
	SIZE scale5_block1_B_conv2d_dim = 512 * 7 * 7;
	
	
	SIZE avg_pool_dim = 512 * 1 * 1;
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 512
	 * X 512 x 1
	 */
	SIZE xw_plus_b_MatMul_dim = 1000;
	xw_plus_b_MatMul_param = linear_create();
	xw_plus_b_MatMul_param->out_s = 1000;
	xw_plus_b_MatMul_param->in_s = avg_pool_dim;
	static DATA xw_plus_b_MatMul_weights_array[512000];
	sprintf(filename, "%s/xw_plus_b_MatMul_weights_array_file", load_data_dir);
	load_fixed(filename,512000,xw_plus_b_MatMul_weights_array);
	xw_plus_b_MatMul_param->weights = xw_plus_b_MatMul_weights_array;
	static DATA xw_plus_b_MatMul_bias_array[1000];
	sprintf(filename, "%s/xw_plus_b_MatMul_bias_array_file", load_data_dir);
	load_fixed(filename,1000,xw_plus_b_MatMul_bias_array);
	xw_plus_b_MatMul_param->bias = xw_plus_b_MatMul_bias_array;
	
	
	
}

void cnnMain(DATA* image, float* results)
{
	double time;
	SIZE batch_join_size[] = { 3, 224, 224 };
	SIZE batch_join_dim = 3 * 224 * 224;
	DATA* batch_join_output = image;
	print_data(batch_join_output, batch_join_dim, "./output_neuraghe/resnet/0_batch_join_output_FIXED");
	
	SIZE scale1_conv2d_padding_size[] = { 3, 226, 226 };
	SIZE scale1_conv2d_padding_dim = 3 * 226 * 226;
	static DATA scale1_conv2d_padding_output[scale1_conv2d_padding_dim];
	SIZE scale1_conv2d_padding_pad[] = { 1, 1 };
	
	zero_pad(batch_join_output, scale1_conv2d_padding_output, batch_join_size, scale1_conv2d_padding_pad);
	print_data(scale1_conv2d_padding_output, scale1_conv2d_padding_dim, "./output_neuraghe/resnet/1_scale1_conv2d_padding_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	SIZE scale1_conv2d_5x5_0_size[] = { 64, 113, 113 };
	SIZE scale1_conv2d_5x5_0_dim = 64 * 113 * 113;
	// scale1_conv2d_5x5_0_dim = 817216
	static DATA scale1_conv2d_5x5_0_output[817216];
	SIZE scale1_conv2d_5x5_0_stride[] = { 2, 2 };
	SIZE scale1_conv2d_5x5_0_pad[] = { 2, 2 };
	
	interlace(soc->in, scale1_conv2d_padding_output, 5, scale1_conv2d_padding_size[0], scale1_conv2d_padding_size[1], scale1_conv2d_padding_size[2]);
	spatconv_forward_hw_sync(scale1_conv2d_5x5_0_param, soc->in, soc->out, soc, scale1_conv2d_padding_size, scale1_conv2d_5x5_0_size, scale1_conv2d_5x5_0_stride, scale1_conv2d_5x5_0_pad);
	SIZE scale1_conv2d_5x5_0_output_scale1_conv2d_5x5_0_output_dstride[] = { 1, 1 };
	deinterlace(scale1_conv2d_5x5_0_output, soc->out, scale1_conv2d_5x5_0_size[0], scale1_conv2d_5x5_0_size[1], scale1_conv2d_5x5_0_size[2], scale1_conv2d_5x5_0_output_scale1_conv2d_5x5_0_output_dstride);
	print_data(scale1_conv2d_5x5_0_output, scale1_conv2d_5x5_0_dim, "./output_neuraghe/resnet/2_scale1_conv2d_5x5_0_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	SIZE scale1_conv2d_5x5_1_size[] = { 64, 113, 113 };
	SIZE scale1_conv2d_5x5_1_dim = 64 * 113 * 113;
	// scale1_conv2d_5x5_1_dim = 817216
	static DATA scale1_conv2d_5x5_1_output[817216];
	SIZE scale1_conv2d_5x5_1_stride[] = { 2, 2 };
	SIZE scale1_conv2d_5x5_1_pad[] = { 2, 2 };
	
	DATA* soc_swap_buffer_0 = soc->swap + 0;
	memcpyNEON(soc_swap_buffer_0, soc->out, 824448*sizeof(DATA));
	spatconv_forward_hw_sync(scale1_conv2d_5x5_1_param, soc->in, soc->out, soc, scale1_conv2d_padding_size, scale1_conv2d_5x5_1_size, scale1_conv2d_5x5_1_stride, scale1_conv2d_5x5_1_pad);
	SIZE scale1_conv2d_5x5_1_output_scale1_conv2d_5x5_1_output_dstride[] = { 1, 1 };
	deinterlace(scale1_conv2d_5x5_1_output, soc->out, scale1_conv2d_5x5_1_size[0], scale1_conv2d_5x5_1_size[1], scale1_conv2d_5x5_1_size[2], scale1_conv2d_5x5_1_output_scale1_conv2d_5x5_1_output_dstride);
	print_data(scale1_conv2d_5x5_1_output, scale1_conv2d_5x5_1_dim, "./output_neuraghe/resnet/3_scale1_conv2d_5x5_1_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	SIZE scale1_conv2d_5x5_2_size[] = { 64, 113, 113 };
	SIZE scale1_conv2d_5x5_2_dim = 64 * 113 * 113;
	// scale1_conv2d_5x5_2_dim = 817216
	static DATA scale1_conv2d_5x5_2_output[817216];
	SIZE scale1_conv2d_5x5_2_stride[] = { 2, 2 };
	SIZE scale1_conv2d_5x5_2_pad[] = { 2, 2 };
	
	DATA* soc_swap_buffer_1 = soc->swap + 824448;
	memcpyNEON(soc_swap_buffer_1, soc->out, 824448*sizeof(DATA));
	spatconv_forward_hw_sync(scale1_conv2d_5x5_2_param, soc->in, soc->out, soc, scale1_conv2d_padding_size, scale1_conv2d_5x5_2_size, scale1_conv2d_5x5_2_stride, scale1_conv2d_5x5_2_pad);
	SIZE scale1_conv2d_5x5_2_output_scale1_conv2d_5x5_2_output_dstride[] = { 1, 1 };
	deinterlace(scale1_conv2d_5x5_2_output, soc->out, scale1_conv2d_5x5_2_size[0], scale1_conv2d_5x5_2_size[1], scale1_conv2d_5x5_2_size[2], scale1_conv2d_5x5_2_output_scale1_conv2d_5x5_2_output_dstride);
	print_data(scale1_conv2d_5x5_2_output, scale1_conv2d_5x5_2_dim, "./output_neuraghe/resnet/4_scale1_conv2d_5x5_2_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 5 x 5
	 * Pad    2x2
	 * Stride 2x2
	 */
	SIZE scale1_conv2d_5x5_3_size[] = { 64, 113, 113 };
	SIZE scale1_conv2d_5x5_3_dim = 64 * 113 * 113;
	// scale1_conv2d_5x5_3_dim = 817216
	static DATA scale1_conv2d_5x5_3_output[817216];
	SIZE scale1_conv2d_5x5_3_stride[] = { 2, 2 };
	SIZE scale1_conv2d_5x5_3_pad[] = { 2, 2 };
	
	DATA* soc_swap_buffer_2 = soc->swap + 1648896;
	memcpyNEON(soc_swap_buffer_2, soc->out, 824448*sizeof(DATA));
	spatconv_forward_hw_sync(scale1_conv2d_5x5_3_param, soc->in, soc->out, soc, scale1_conv2d_padding_size, scale1_conv2d_5x5_3_size, scale1_conv2d_5x5_3_stride, scale1_conv2d_5x5_3_pad);
	SIZE scale1_conv2d_5x5_3_output_scale1_conv2d_5x5_3_output_dstride[] = { 1, 1 };
	deinterlace(scale1_conv2d_5x5_3_output, soc->out, scale1_conv2d_5x5_3_size[0], scale1_conv2d_5x5_3_size[1], scale1_conv2d_5x5_3_size[2], scale1_conv2d_5x5_3_output_scale1_conv2d_5x5_3_output_dstride);
	print_data(scale1_conv2d_5x5_3_output, scale1_conv2d_5x5_3_dim, "./output_neuraghe/resnet/5_scale1_conv2d_5x5_3_output_FIXED");
	
	DATA* scale1_conv2d_merge_inputs[4] = { scale1_conv2d_5x5_0_output, scale1_conv2d_5x5_1_output, scale1_conv2d_5x5_2_output, scale1_conv2d_5x5_3_output };
	SIZE scale1_conv2d_merge_size[] = { 64, 112, 112 };
	SIZE scale1_conv2d_merge_dim = 64 * 112 * 112;
	static DATA scale1_conv2d_merge_output[scale1_conv2d_merge_dim];
	SIZE scale1_conv2d_merge_stride[] = { 2, 2 };
	spatconv_merge(scale1_conv2d_merge_output, scale1_conv2d_merge_inputs, scale1_conv2d_merge_size, 5, scale1_conv2d_merge_stride, false);
	print_data(scale1_conv2d_merge_output, scale1_conv2d_merge_dim, "./output_neuraghe/resnet/6_scale1_conv2d_merge_output_FIXED");
	
	DATA* scale1_Relu_output = (DATA *) calloc(scale1_conv2d_merge_dim, sizeof(DATA));
	relu_forward(scale1_conv2d_merge_output, scale1_Relu_output, scale1_conv2d_merge_size);
	print_data(scale1_Relu_output, scale1_conv2d_merge_dim, "./output_neuraghe/resnet/7_scale1_Relu_output_FIXED");
	
	SIZE scale2_max_pool_size[] = { 64, 56, 56 };
	SIZE scale2_max_pool_dim = 64 * 56 * 56;
	DATA* scale2_max_pool_output = (DATA *) calloc(scale2_max_pool_dim, sizeof(DATA));
	SIZE scale2_max_pool_filter[] = { 3, 3 };
	SIZE scale2_max_pool_stride[] = { 2, 2 };
	SIZE scale2_max_pool_pad[] = { 1, 1 };
	maxpool_forward(scale1_Relu_output, scale2_max_pool_output, scale1_conv2d_merge_size, scale2_max_pool_size, scale2_max_pool_filter, scale2_max_pool_stride, scale2_max_pool_pad);
	print_data(scale2_max_pool_output, scale2_max_pool_dim, "./output_neuraghe/resnet/8_scale2_max_pool_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale2_block0_A_conv2d_size[] = { 64, 56, 56 };
	SIZE scale2_block0_A_conv2d_dim = 64 * 56 * 56;
	// scale2_block0_A_conv2d_dim = 200704
	static DATA scale2_block0_A_conv2d_output[200704];
	SIZE scale2_block0_A_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block0_A_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale2_max_pool_output, 3, scale2_max_pool_size[0], scale2_max_pool_size[1], scale2_max_pool_size[2]);
	spatconv_forward_hw_sync(scale2_block0_A_conv2d_param, soc->in, soc->out, soc, scale2_max_pool_size, scale2_block0_A_conv2d_size, scale2_block0_A_conv2d_stride, scale2_block0_A_conv2d_pad, true);
	SIZE scale2_block0_A_conv2d_output_scale2_block0_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale2_block0_A_conv2d_output, soc->out, scale2_block0_A_conv2d_size[0], scale2_block0_A_conv2d_size[1], scale2_block0_A_conv2d_size[2], scale2_block0_A_conv2d_output_scale2_block0_A_conv2d_output_dstride);
	print_data(scale2_block0_A_conv2d_output, scale2_block0_A_conv2d_dim, "./output_neuraghe/resnet/9_scale2_block0_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale2_block0_B_conv2d_size[] = { 64, 56, 56 };
	SIZE scale2_block0_B_conv2d_dim = 64 * 56 * 56;
	// scale2_block0_B_conv2d_dim = 200704
	static DATA scale2_block0_B_conv2d_output[200704];
	SIZE scale2_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc_swap_buffer_0 = soc->swap + 200704;
	soc_swap_buffer_1 = soc->swap + 200705;
	soc_swap_buffer_2 = soc->swap + 200706;
	memcpyNEON(soc_swap_buffer_0, soc->out, 200704*sizeof(DATA));
	spatconv_forward_hw_sync(scale2_block0_B_conv2d_param, soc->in, soc->out, soc, scale2_block0_A_conv2d_size, scale2_block0_B_conv2d_size, scale2_block0_B_conv2d_stride, scale2_block0_B_conv2d_pad);
	SIZE scale2_block0_B_conv2d_output_scale2_block0_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale2_block0_B_conv2d_output, soc->out, scale2_block0_B_conv2d_size[0], scale2_block0_B_conv2d_size[1], scale2_block0_B_conv2d_size[2], scale2_block0_B_conv2d_output_scale2_block0_B_conv2d_output_dstride);
	print_data(scale2_block0_B_conv2d_output, scale2_block0_B_conv2d_dim, "./output_neuraghe/resnet/10_scale2_block0_B_conv2d_output_FIXED");
	
	static DATA scale2_block0_Residual_Add_Add_output[scale2_max_pool_dim];
	SIZE scale2_block0_Residual_Add_Add_isize[] = { 200704, 1, 1 };
	add_forward_wR(soc_swap_buffer_0, soc->out, soc->out, scale2_block0_Residual_Add_Add_isize);
	SIZE scale2_block0_Residual_Add_Add_output_scale2_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale2_block0_Residual_Add_Add_output, soc->out, scale2_max_pool_size[0], scale2_max_pool_size[1], scale2_max_pool_size[2], scale2_block0_Residual_Add_Add_output_scale2_block0_Residual_Add_Add_output_dstride);
	print_data(scale2_block0_Residual_Add_Add_output, scale2_max_pool_dim, "./output_neuraghe/resnet/11_scale2_block0_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale2_block1_A_conv2d_size[] = { 64, 56, 56 };
	SIZE scale2_block1_A_conv2d_dim = 64 * 56 * 56;
	// scale2_block1_A_conv2d_dim = 200704
	static DATA scale2_block1_A_conv2d_output[200704];
	SIZE scale2_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block1_A_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale2_block0_Residual_Add_Add_output, 3, scale2_block0_B_conv2d_size[0], scale2_block0_B_conv2d_size[1], scale2_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale2_block1_A_conv2d_param, soc->in, soc->out, soc, scale2_block0_B_conv2d_size, scale2_block1_A_conv2d_size, scale2_block1_A_conv2d_stride, scale2_block1_A_conv2d_pad, true);
	SIZE scale2_block1_A_conv2d_output_scale2_block1_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale2_block1_A_conv2d_output, soc->out, scale2_block1_A_conv2d_size[0], scale2_block1_A_conv2d_size[1], scale2_block1_A_conv2d_size[2], scale2_block1_A_conv2d_output_scale2_block1_A_conv2d_output_dstride);
	print_data(scale2_block1_A_conv2d_output, scale2_block1_A_conv2d_dim, "./output_neuraghe/resnet/12_scale2_block1_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 64 x 56 x 56
	 * W 64 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale2_block1_B_conv2d_size[] = { 64, 56, 56 };
	SIZE scale2_block1_B_conv2d_dim = 64 * 56 * 56;
	// scale2_block1_B_conv2d_dim = 200704
	static DATA scale2_block1_B_conv2d_output[200704];
	SIZE scale2_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	memcpyNEON(soc_swap_buffer_0, soc->out, 200704*sizeof(DATA));
	spatconv_forward_hw_sync(scale2_block1_B_conv2d_param, soc->in, soc->out, soc, scale2_block1_A_conv2d_size, scale2_block1_B_conv2d_size, scale2_block1_B_conv2d_stride, scale2_block1_B_conv2d_pad);
	SIZE scale2_block1_B_conv2d_output_scale2_block1_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale2_block1_B_conv2d_output, soc->out, scale2_block1_B_conv2d_size[0], scale2_block1_B_conv2d_size[1], scale2_block1_B_conv2d_size[2], scale2_block1_B_conv2d_output_scale2_block1_B_conv2d_output_dstride);
	print_data(scale2_block1_B_conv2d_output, scale2_block1_B_conv2d_dim, "./output_neuraghe/resnet/13_scale2_block1_B_conv2d_output_FIXED");
	
	static DATA scale2_block1_Residual_Add_Add_output[scale2_block1_B_conv2d_dim];
	SIZE scale2_block1_Residual_Add_Add_isize[] = { 200704, 1, 1 };
	add_forward_wR(soc->out, soc_swap_buffer_0, soc->out, scale2_block1_Residual_Add_Add_isize);
	SIZE scale2_block1_Residual_Add_Add_output_scale2_block1_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale2_block1_Residual_Add_Add_output, soc->out, scale2_block1_B_conv2d_size[0], scale2_block1_B_conv2d_size[1], scale2_block1_B_conv2d_size[2], scale2_block1_Residual_Add_Add_output_scale2_block1_Residual_Add_Add_output_dstride);
	print_data(scale2_block1_Residual_Add_Add_output, scale2_block1_B_conv2d_dim, "./output_neuraghe/resnet/14_scale2_block1_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 128 x 28 x 28
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale3_block0_shortcut_conv2d_size[] = { 128, 28, 28 };
	SIZE scale3_block0_shortcut_conv2d_dim = 128 * 28 * 28;
	// scale3_block0_shortcut_conv2d_dim = 100352
	static DATA scale3_block0_shortcut_conv2d_output[100352];
	SIZE scale3_block0_shortcut_conv2d_stride[] = { 2, 2 };
	SIZE scale3_block0_shortcut_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale2_block1_Residual_Add_Add_output, 3, scale2_block0_B_conv2d_size[0], scale2_block0_B_conv2d_size[1], scale2_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale3_block0_shortcut_conv2d_param, soc->in, soc->out, soc, scale2_block0_B_conv2d_size, scale3_block0_shortcut_conv2d_size, scale3_block0_shortcut_conv2d_stride, scale3_block0_shortcut_conv2d_pad);
	SIZE scale3_block0_shortcut_conv2d_output_scale3_block0_shortcut_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block0_shortcut_conv2d_output, soc->out, scale3_block0_shortcut_conv2d_size[0], scale3_block0_shortcut_conv2d_size[1], scale3_block0_shortcut_conv2d_size[2], scale3_block0_shortcut_conv2d_output_scale3_block0_shortcut_conv2d_output_dstride);
	print_data(scale3_block0_shortcut_conv2d_output, scale3_block0_shortcut_conv2d_dim, "./output_neuraghe/resnet/15_scale3_block0_shortcut_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 128 x 28 x 28
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale3_block0_A_conv2d_size[] = { 128, 28, 28 };
	SIZE scale3_block0_A_conv2d_dim = 128 * 28 * 28;
	// scale3_block0_A_conv2d_dim = 100352
	static DATA scale3_block0_A_conv2d_output[100352];
	SIZE scale3_block0_A_conv2d_stride[] = { 2, 2 };
	SIZE scale3_block0_A_conv2d_pad[] = { 1, 1 };
	
	soc_swap_buffer_0 = soc->swap + 301056;
	soc_swap_buffer_1 = soc->swap + 301057;
	soc_swap_buffer_2 = soc->swap + 301058;
	memcpyNEON(soc_swap_buffer_0, soc->out, 100352*sizeof(DATA));
	spatconv_forward_hw_sync(scale3_block0_A_conv2d_param, soc->in, soc->out, soc, scale2_block0_B_conv2d_size, scale3_block0_A_conv2d_size, scale3_block0_A_conv2d_stride, scale3_block0_A_conv2d_pad, true);
	SIZE scale3_block0_A_conv2d_output_scale3_block0_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block0_A_conv2d_output, soc->out, scale3_block0_A_conv2d_size[0], scale3_block0_A_conv2d_size[1], scale3_block0_A_conv2d_size[2], scale3_block0_A_conv2d_output_scale3_block0_A_conv2d_output_dstride);
	print_data(scale3_block0_A_conv2d_output, scale3_block0_A_conv2d_dim, "./output_neuraghe/resnet/16_scale3_block0_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 128 x 28 x 28
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale3_block0_B_conv2d_size[] = { 128, 28, 28 };
	SIZE scale3_block0_B_conv2d_dim = 128 * 28 * 28;
	// scale3_block0_B_conv2d_dim = 100352
	static DATA scale3_block0_B_conv2d_output[100352];
	SIZE scale3_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	spatconv_forward_hw_sync(scale3_block0_B_conv2d_param, soc->in, soc->out, soc, scale3_block0_A_conv2d_size, scale3_block0_B_conv2d_size, scale3_block0_B_conv2d_stride, scale3_block0_B_conv2d_pad);
	SIZE scale3_block0_B_conv2d_output_scale3_block0_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block0_B_conv2d_output, soc->out, scale3_block0_B_conv2d_size[0], scale3_block0_B_conv2d_size[1], scale3_block0_B_conv2d_size[2], scale3_block0_B_conv2d_output_scale3_block0_B_conv2d_output_dstride);
	print_data(scale3_block0_B_conv2d_output, scale3_block0_B_conv2d_dim, "./output_neuraghe/resnet/17_scale3_block0_B_conv2d_output_FIXED");
	
	static DATA scale3_block0_Residual_Add_Add_output[scale3_block0_shortcut_conv2d_dim];
	SIZE scale3_block0_Residual_Add_Add_isize[] = { 100352, 1, 1 };
	add_forward_wR(soc_swap_buffer_0, soc->out, soc->out, scale3_block0_Residual_Add_Add_isize);
	SIZE scale3_block0_Residual_Add_Add_output_scale3_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block0_Residual_Add_Add_output, soc->out, scale3_block0_shortcut_conv2d_size[0], scale3_block0_shortcut_conv2d_size[1], scale3_block0_shortcut_conv2d_size[2], scale3_block0_Residual_Add_Add_output_scale3_block0_Residual_Add_Add_output_dstride);
	print_data(scale3_block0_Residual_Add_Add_output, scale3_block0_shortcut_conv2d_dim, "./output_neuraghe/resnet/18_scale3_block0_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 128 x 28 x 28
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale3_block1_A_conv2d_size[] = { 128, 28, 28 };
	SIZE scale3_block1_A_conv2d_dim = 128 * 28 * 28;
	// scale3_block1_A_conv2d_dim = 100352
	static DATA scale3_block1_A_conv2d_output[100352];
	SIZE scale3_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block1_A_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale3_block0_Residual_Add_Add_output, 3, scale3_block0_B_conv2d_size[0], scale3_block0_B_conv2d_size[1], scale3_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale3_block1_A_conv2d_param, soc->in, soc->out, soc, scale3_block0_B_conv2d_size, scale3_block1_A_conv2d_size, scale3_block1_A_conv2d_stride, scale3_block1_A_conv2d_pad, true);
	SIZE scale3_block1_A_conv2d_output_scale3_block1_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block1_A_conv2d_output, soc->out, scale3_block1_A_conv2d_size[0], scale3_block1_A_conv2d_size[1], scale3_block1_A_conv2d_size[2], scale3_block1_A_conv2d_output_scale3_block1_A_conv2d_output_dstride);
	print_data(scale3_block1_A_conv2d_output, scale3_block1_A_conv2d_dim, "./output_neuraghe/resnet/19_scale3_block1_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 128 x 28 x 28
	 * W 128 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale3_block1_B_conv2d_size[] = { 128, 28, 28 };
	SIZE scale3_block1_B_conv2d_dim = 128 * 28 * 28;
	// scale3_block1_B_conv2d_dim = 100352
	static DATA scale3_block1_B_conv2d_output[100352];
	SIZE scale3_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	memcpyNEON(soc_swap_buffer_0, soc->out, 100352*sizeof(DATA));
	spatconv_forward_hw_sync(scale3_block1_B_conv2d_param, soc->in, soc->out, soc, scale3_block1_A_conv2d_size, scale3_block1_B_conv2d_size, scale3_block1_B_conv2d_stride, scale3_block1_B_conv2d_pad);
	SIZE scale3_block1_B_conv2d_output_scale3_block1_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block1_B_conv2d_output, soc->out, scale3_block1_B_conv2d_size[0], scale3_block1_B_conv2d_size[1], scale3_block1_B_conv2d_size[2], scale3_block1_B_conv2d_output_scale3_block1_B_conv2d_output_dstride);
	print_data(scale3_block1_B_conv2d_output, scale3_block1_B_conv2d_dim, "./output_neuraghe/resnet/20_scale3_block1_B_conv2d_output_FIXED");
	
	static DATA scale3_block1_Residual_Add_Add_output[scale3_block1_B_conv2d_dim];
	SIZE scale3_block1_Residual_Add_Add_isize[] = { 100352, 1, 1 };
	add_forward_wR(soc->out, soc_swap_buffer_0, soc->out, scale3_block1_Residual_Add_Add_isize);
	SIZE scale3_block1_Residual_Add_Add_output_scale3_block1_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale3_block1_Residual_Add_Add_output, soc->out, scale3_block1_B_conv2d_size[0], scale3_block1_B_conv2d_size[1], scale3_block1_B_conv2d_size[2], scale3_block1_Residual_Add_Add_output_scale3_block1_Residual_Add_Add_output_dstride);
	print_data(scale3_block1_Residual_Add_Add_output, scale3_block1_B_conv2d_dim, "./output_neuraghe/resnet/21_scale3_block1_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 256 x 14 x 14
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale4_block0_shortcut_conv2d_size[] = { 256, 14, 14 };
	SIZE scale4_block0_shortcut_conv2d_dim = 256 * 14 * 14;
	// scale4_block0_shortcut_conv2d_dim = 50176
	static DATA scale4_block0_shortcut_conv2d_output[50176];
	SIZE scale4_block0_shortcut_conv2d_stride[] = { 2, 2 };
	SIZE scale4_block0_shortcut_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale3_block1_Residual_Add_Add_output, 3, scale3_block0_B_conv2d_size[0], scale3_block0_B_conv2d_size[1], scale3_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale4_block0_shortcut_conv2d_param, soc->in, soc->out, soc, scale3_block0_B_conv2d_size, scale4_block0_shortcut_conv2d_size, scale4_block0_shortcut_conv2d_stride, scale4_block0_shortcut_conv2d_pad);
	SIZE scale4_block0_shortcut_conv2d_output_scale4_block0_shortcut_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block0_shortcut_conv2d_output, soc->out, scale4_block0_shortcut_conv2d_size[0], scale4_block0_shortcut_conv2d_size[1], scale4_block0_shortcut_conv2d_size[2], scale4_block0_shortcut_conv2d_output_scale4_block0_shortcut_conv2d_output_dstride);
	print_data(scale4_block0_shortcut_conv2d_output, scale4_block0_shortcut_conv2d_dim, "./output_neuraghe/resnet/22_scale4_block0_shortcut_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 256 x 14 x 14
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale4_block0_A_conv2d_size[] = { 256, 14, 14 };
	SIZE scale4_block0_A_conv2d_dim = 256 * 14 * 14;
	// scale4_block0_A_conv2d_dim = 50176
	static DATA scale4_block0_A_conv2d_output[50176];
	SIZE scale4_block0_A_conv2d_stride[] = { 2, 2 };
	SIZE scale4_block0_A_conv2d_pad[] = { 1, 1 };
	
	soc_swap_buffer_0 = soc->swap + 351232;
	soc_swap_buffer_1 = soc->swap + 351233;
	soc_swap_buffer_2 = soc->swap + 351234;
	memcpyNEON(soc_swap_buffer_0, soc->out, 50176*sizeof(DATA));
	spatconv_forward_hw_sync(scale4_block0_A_conv2d_param, soc->in, soc->out, soc, scale3_block0_B_conv2d_size, scale4_block0_A_conv2d_size, scale4_block0_A_conv2d_stride, scale4_block0_A_conv2d_pad, true);
	SIZE scale4_block0_A_conv2d_output_scale4_block0_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block0_A_conv2d_output, soc->out, scale4_block0_A_conv2d_size[0], scale4_block0_A_conv2d_size[1], scale4_block0_A_conv2d_size[2], scale4_block0_A_conv2d_output_scale4_block0_A_conv2d_output_dstride);
	print_data(scale4_block0_A_conv2d_output, scale4_block0_A_conv2d_dim, "./output_neuraghe/resnet/23_scale4_block0_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale4_block0_B_conv2d_size[] = { 256, 14, 14 };
	SIZE scale4_block0_B_conv2d_dim = 256 * 14 * 14;
	// scale4_block0_B_conv2d_dim = 50176
	static DATA scale4_block0_B_conv2d_output[50176];
	SIZE scale4_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	spatconv_forward_hw_sync(scale4_block0_B_conv2d_param, soc->in, soc->out, soc, scale4_block0_A_conv2d_size, scale4_block0_B_conv2d_size, scale4_block0_B_conv2d_stride, scale4_block0_B_conv2d_pad);
	SIZE scale4_block0_B_conv2d_output_scale4_block0_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block0_B_conv2d_output, soc->out, scale4_block0_B_conv2d_size[0], scale4_block0_B_conv2d_size[1], scale4_block0_B_conv2d_size[2], scale4_block0_B_conv2d_output_scale4_block0_B_conv2d_output_dstride);
	print_data(scale4_block0_B_conv2d_output, scale4_block0_B_conv2d_dim, "./output_neuraghe/resnet/24_scale4_block0_B_conv2d_output_FIXED");
	
	static DATA scale4_block0_Residual_Add_Add_output[scale4_block0_shortcut_conv2d_dim];
	SIZE scale4_block0_Residual_Add_Add_isize[] = { 50176, 1, 1 };
	add_forward_wR(soc_swap_buffer_0, soc->out, soc->out, scale4_block0_Residual_Add_Add_isize);
	SIZE scale4_block0_Residual_Add_Add_output_scale4_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block0_Residual_Add_Add_output, soc->out, scale4_block0_shortcut_conv2d_size[0], scale4_block0_shortcut_conv2d_size[1], scale4_block0_shortcut_conv2d_size[2], scale4_block0_Residual_Add_Add_output_scale4_block0_Residual_Add_Add_output_dstride);
	print_data(scale4_block0_Residual_Add_Add_output, scale4_block0_shortcut_conv2d_dim, "./output_neuraghe/resnet/25_scale4_block0_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale4_block1_A_conv2d_size[] = { 256, 14, 14 };
	SIZE scale4_block1_A_conv2d_dim = 256 * 14 * 14;
	// scale4_block1_A_conv2d_dim = 50176
	static DATA scale4_block1_A_conv2d_output[50176];
	SIZE scale4_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block1_A_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale4_block0_Residual_Add_Add_output, 3, scale4_block0_B_conv2d_size[0], scale4_block0_B_conv2d_size[1], scale4_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale4_block1_A_conv2d_param, soc->in, soc->out, soc, scale4_block0_B_conv2d_size, scale4_block1_A_conv2d_size, scale4_block1_A_conv2d_stride, scale4_block1_A_conv2d_pad, true);
	SIZE scale4_block1_A_conv2d_output_scale4_block1_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block1_A_conv2d_output, soc->out, scale4_block1_A_conv2d_size[0], scale4_block1_A_conv2d_size[1], scale4_block1_A_conv2d_size[2], scale4_block1_A_conv2d_output_scale4_block1_A_conv2d_output_dstride);
	print_data(scale4_block1_A_conv2d_output, scale4_block1_A_conv2d_dim, "./output_neuraghe/resnet/26_scale4_block1_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale4_block1_B_conv2d_size[] = { 256, 14, 14 };
	SIZE scale4_block1_B_conv2d_dim = 256 * 14 * 14;
	// scale4_block1_B_conv2d_dim = 50176
	static DATA scale4_block1_B_conv2d_output[50176];
	SIZE scale4_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	memcpyNEON(soc_swap_buffer_0, soc->out, 50176*sizeof(DATA));
	spatconv_forward_hw_sync(scale4_block1_B_conv2d_param, soc->in, soc->out, soc, scale4_block1_A_conv2d_size, scale4_block1_B_conv2d_size, scale4_block1_B_conv2d_stride, scale4_block1_B_conv2d_pad);
	SIZE scale4_block1_B_conv2d_output_scale4_block1_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block1_B_conv2d_output, soc->out, scale4_block1_B_conv2d_size[0], scale4_block1_B_conv2d_size[1], scale4_block1_B_conv2d_size[2], scale4_block1_B_conv2d_output_scale4_block1_B_conv2d_output_dstride);
	print_data(scale4_block1_B_conv2d_output, scale4_block1_B_conv2d_dim, "./output_neuraghe/resnet/27_scale4_block1_B_conv2d_output_FIXED");
	
	static DATA scale4_block1_Residual_Add_Add_output[scale4_block1_B_conv2d_dim];
	SIZE scale4_block1_Residual_Add_Add_isize[] = { 50176, 1, 1 };
	add_forward_wR(soc->out, soc_swap_buffer_0, soc->out, scale4_block1_Residual_Add_Add_isize);
	SIZE scale4_block1_Residual_Add_Add_output_scale4_block1_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale4_block1_Residual_Add_Add_output, soc->out, scale4_block1_B_conv2d_size[0], scale4_block1_B_conv2d_size[1], scale4_block1_B_conv2d_size[2], scale4_block1_Residual_Add_Add_output_scale4_block1_Residual_Add_Add_output_dstride);
	print_data(scale4_block1_Residual_Add_Add_output, scale4_block1_B_conv2d_dim, "./output_neuraghe/resnet/28_scale4_block1_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale5_block0_shortcut_conv2d_size[] = { 512, 7, 7 };
	SIZE scale5_block0_shortcut_conv2d_dim = 512 * 7 * 7;
	// scale5_block0_shortcut_conv2d_dim = 25088
	static DATA scale5_block0_shortcut_conv2d_output[25088];
	SIZE scale5_block0_shortcut_conv2d_stride[] = { 2, 2 };
	SIZE scale5_block0_shortcut_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale4_block1_Residual_Add_Add_output, 3, scale4_block0_B_conv2d_size[0], scale4_block0_B_conv2d_size[1], scale4_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale5_block0_shortcut_conv2d_param, soc->in, soc->out, soc, scale4_block0_B_conv2d_size, scale5_block0_shortcut_conv2d_size, scale5_block0_shortcut_conv2d_stride, scale5_block0_shortcut_conv2d_pad);
	SIZE scale5_block0_shortcut_conv2d_output_scale5_block0_shortcut_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block0_shortcut_conv2d_output, soc->out, scale5_block0_shortcut_conv2d_size[0], scale5_block0_shortcut_conv2d_size[1], scale5_block0_shortcut_conv2d_size[2], scale5_block0_shortcut_conv2d_output_scale5_block0_shortcut_conv2d_output_dstride);
	print_data(scale5_block0_shortcut_conv2d_output, scale5_block0_shortcut_conv2d_dim, "./output_neuraghe/resnet/29_scale5_block0_shortcut_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale5_block0_A_conv2d_size[] = { 512, 7, 7 };
	SIZE scale5_block0_A_conv2d_dim = 512 * 7 * 7;
	// scale5_block0_A_conv2d_dim = 25088
	static DATA scale5_block0_A_conv2d_output[25088];
	SIZE scale5_block0_A_conv2d_stride[] = { 2, 2 };
	SIZE scale5_block0_A_conv2d_pad[] = { 1, 1 };
	
	soc_swap_buffer_0 = soc->swap + 379904;
	soc_swap_buffer_1 = soc->swap + 379905;
	soc_swap_buffer_2 = soc->swap + 379906;
	memcpyNEON(soc_swap_buffer_0, soc->out, 28672*sizeof(DATA));
	spatconv_forward_hw_sync(scale5_block0_A_conv2d_param, soc->in, soc->out, soc, scale4_block0_B_conv2d_size, scale5_block0_A_conv2d_size, scale5_block0_A_conv2d_stride, scale5_block0_A_conv2d_pad, true);
	SIZE scale5_block0_A_conv2d_output_scale5_block0_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block0_A_conv2d_output, soc->out, scale5_block0_A_conv2d_size[0], scale5_block0_A_conv2d_size[1], scale5_block0_A_conv2d_size[2], scale5_block0_A_conv2d_output_scale5_block0_A_conv2d_output_dstride);
	print_data(scale5_block0_A_conv2d_output, scale5_block0_A_conv2d_dim, "./output_neuraghe/resnet/30_scale5_block0_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale5_block0_B_conv2d_size[] = { 512, 7, 7 };
	SIZE scale5_block0_B_conv2d_dim = 512 * 7 * 7;
	// scale5_block0_B_conv2d_dim = 25088
	static DATA scale5_block0_B_conv2d_output[25088];
	SIZE scale5_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	spatconv_forward_hw_sync(scale5_block0_B_conv2d_param, soc->in, soc->out, soc, scale5_block0_A_conv2d_size, scale5_block0_B_conv2d_size, scale5_block0_B_conv2d_stride, scale5_block0_B_conv2d_pad);
	place_zeros((uint32_t*)soc->out, scale5_block0_B_conv2d_size);
	SIZE scale5_block0_B_conv2d_output_scale5_block0_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block0_B_conv2d_output, soc->out, scale5_block0_B_conv2d_size[0], scale5_block0_B_conv2d_size[1], scale5_block0_B_conv2d_size[2], scale5_block0_B_conv2d_output_scale5_block0_B_conv2d_output_dstride);
	print_data(scale5_block0_B_conv2d_output, scale5_block0_B_conv2d_dim, "./output_neuraghe/resnet/31_scale5_block0_B_conv2d_output_FIXED");
	
	static DATA scale5_block0_Residual_Add_Add_output[scale5_block0_shortcut_conv2d_dim];
	SIZE scale5_block0_Residual_Add_Add_isize[] = { 28672, 1, 1 };
	add_forward_wR(soc_swap_buffer_0, soc->out, soc->out, scale5_block0_Residual_Add_Add_isize);
	SIZE scale5_block0_Residual_Add_Add_output_scale5_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block0_Residual_Add_Add_output, soc->out, scale5_block0_shortcut_conv2d_size[0], scale5_block0_shortcut_conv2d_size[1], scale5_block0_shortcut_conv2d_size[2], scale5_block0_Residual_Add_Add_output_scale5_block0_Residual_Add_Add_output_dstride);
	print_data(scale5_block0_Residual_Add_Add_output, scale5_block0_shortcut_conv2d_dim, "./output_neuraghe/resnet/32_scale5_block0_Residual_Add_Add_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale5_block1_A_conv2d_size[] = { 512, 7, 7 };
	SIZE scale5_block1_A_conv2d_dim = 512 * 7 * 7;
	// scale5_block1_A_conv2d_dim = 25088
	static DATA scale5_block1_A_conv2d_output[25088];
	SIZE scale5_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block1_A_conv2d_pad[] = { 1, 1 };
	
	interlace(soc->in, scale5_block0_Residual_Add_Add_output, 3, scale5_block0_B_conv2d_size[0], scale5_block0_B_conv2d_size[1], scale5_block0_B_conv2d_size[2]);
	spatconv_forward_hw_sync(scale5_block1_A_conv2d_param, soc->in, soc->out, soc, scale5_block0_B_conv2d_size, scale5_block1_A_conv2d_size, scale5_block1_A_conv2d_stride, scale5_block1_A_conv2d_pad, true);
	place_zeros((uint32_t*)soc->out, scale5_block1_A_conv2d_size);
	SIZE scale5_block1_A_conv2d_output_scale5_block1_A_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block1_A_conv2d_output, soc->out, scale5_block1_A_conv2d_size[0], scale5_block1_A_conv2d_size[1], scale5_block1_A_conv2d_size[2], scale5_block1_A_conv2d_output_scale5_block1_A_conv2d_output_dstride);
	print_data(scale5_block1_A_conv2d_output, scale5_block1_A_conv2d_dim, "./output_neuraghe/resnet/33_scale5_block1_A_conv2d_output_FIXED");
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale5_block1_B_conv2d_size[] = { 512, 7, 7 };
	SIZE scale5_block1_B_conv2d_dim = 512 * 7 * 7;
	// scale5_block1_B_conv2d_dim = 25088
	static DATA scale5_block1_B_conv2d_output[25088];
	SIZE scale5_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	memcpyNEON(soc_swap_buffer_0, soc->out, 28672*sizeof(DATA));
	spatconv_forward_hw_sync(scale5_block1_B_conv2d_param, soc->in, soc->out, soc, scale5_block1_A_conv2d_size, scale5_block1_B_conv2d_size, scale5_block1_B_conv2d_stride, scale5_block1_B_conv2d_pad);
	place_zeros((uint32_t*)soc->out, scale5_block1_B_conv2d_size);
	SIZE scale5_block1_B_conv2d_output_scale5_block1_B_conv2d_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block1_B_conv2d_output, soc->out, scale5_block1_B_conv2d_size[0], scale5_block1_B_conv2d_size[1], scale5_block1_B_conv2d_size[2], scale5_block1_B_conv2d_output_scale5_block1_B_conv2d_output_dstride);
	print_data(scale5_block1_B_conv2d_output, scale5_block1_B_conv2d_dim, "./output_neuraghe/resnet/34_scale5_block1_B_conv2d_output_FIXED");
	
	static DATA scale5_block1_Residual_Add_Add_output[scale5_block1_B_conv2d_dim];
	SIZE scale5_block1_Residual_Add_Add_isize[] = { 28672, 1, 1 };
	add_forward_wR(soc->out, soc_swap_buffer_0, soc->out, scale5_block1_Residual_Add_Add_isize);
	SIZE scale5_block1_Residual_Add_Add_output_scale5_block1_Residual_Add_Add_output_dstride[] = { 1, 1 };
	deinterlace(scale5_block1_Residual_Add_Add_output, soc->out, scale5_block1_B_conv2d_size[0], scale5_block1_B_conv2d_size[1], scale5_block1_B_conv2d_size[2], scale5_block1_Residual_Add_Add_output_scale5_block1_Residual_Add_Add_output_dstride);
	print_data(scale5_block1_Residual_Add_Add_output, scale5_block1_B_conv2d_dim, "./output_neuraghe/resnet/35_scale5_block1_Residual_Add_Add_output_FIXED");
	
	SIZE avg_pool_size[] = { 512, 1, 1 };
	SIZE avg_pool_dim = 512 * 1 * 1;
	DATA* avg_pool_output = (DATA *) calloc(avg_pool_dim, sizeof(DATA));
	SIZE avg_pool_filter[] = { 7, 7 };
	SIZE avg_pool_stride[] = { 1, 1 };
	SIZE avg_pool_pad[] = { 0, 0 };
	avgpool_forward(scale5_block1_Residual_Add_Add_output, avg_pool_output, scale5_block0_B_conv2d_size, avg_pool_size, avg_pool_filter, avg_pool_stride, avg_pool_pad);
	print_data(avg_pool_output, avg_pool_dim, "./output_neuraghe/resnet/36_avg_pool_output_FIXED");
	
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 512
	 * X 512 x 1
	 */
	SIZE xw_plus_b_MatMul_size[] = { 1000, 1, 1 };
	SIZE xw_plus_b_MatMul_dim = 1000;
	static DATA xw_plus_b_MatMul_output[xw_plus_b_MatMul_dim];
	linear_forward(xw_plus_b_MatMul_param, avg_pool_output, xw_plus_b_MatMul_output, avg_pool_dim, xw_plus_b_MatMul_dim);
	print_data(xw_plus_b_MatMul_output, xw_plus_b_MatMul_dim, "./output_neuraghe/resnet/37_xw_plus_b_MatMul_output_FIXED");
	
	// Convert output
	for(unsigned int i = 0; i < xw_plus_b_MatMul_dim; i++)
		results[i] = (float) FIXED2FLOAT(xw_plus_b_MatMul_output[i]);
	
}

void free_platform(){
	munmap_soc(soc);
	free(soc);
}

