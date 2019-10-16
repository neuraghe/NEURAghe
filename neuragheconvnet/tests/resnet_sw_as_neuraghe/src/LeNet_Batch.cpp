// This code is auto-generated. Do not edit.

#include "LeNet_Batch.h"

#include "assert.h"
// void print_data(DATA * data, int size, const char*filename){
// #ifdef _DEBUG_	
// 	FILE * f = fopen(filename, "w");
// 	assert(f!=NULL);
// 	#ifdef _FIXED_
// 		const char * format_string = "%d\n";
// 	#else
// 		const char * format_string = "%f\n";
// 	#endif
// 	printf("Writing to %s ...\n", filename);
// 	for(int i=0; i<size; i++){
// 		fprintf(f, format_string, data[i]);
// 	}
// 	fclose(f);
// #endif
// }

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



void init_platform(char* bitstream){
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
	
	SIZE scale1_conv2d_5x5_0_weights_dim = 64 * 3 * 5 * 5;
	static DATA scale1_conv2d_5x5_0_weights_array[4800];
	sprintf(filename, "%s/scale1_conv2d_5x5_0_weights_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_0_weights_dim,scale1_conv2d_5x5_0_weights_array);
	
	scale1_conv2d_5x5_0_param->kernel = scale1_conv2d_5x5_0_weights_array;
	SIZE scale1_conv2d_5x5_0_bias_dim = 64;
	static DATA scale1_conv2d_5x5_0_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_0_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_0_bias_dim,scale1_conv2d_5x5_0_bias_array);
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
	
	SIZE scale1_conv2d_5x5_1_weights_dim = 64 * 3 * 5 * 5;
	static DATA scale1_conv2d_5x5_1_weights_array[4800];
	sprintf(filename, "%s/scale1_conv2d_5x5_1_weights_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_1_weights_dim,scale1_conv2d_5x5_1_weights_array);
	
	scale1_conv2d_5x5_1_param->kernel = scale1_conv2d_5x5_1_weights_array;
	SIZE scale1_conv2d_5x5_1_bias_dim = 64;
	static DATA scale1_conv2d_5x5_1_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_1_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_1_bias_dim,scale1_conv2d_5x5_1_bias_array);
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
	
	SIZE scale1_conv2d_5x5_2_weights_dim = 64 * 3 * 5 * 5;
	static DATA scale1_conv2d_5x5_2_weights_array[4800];
	sprintf(filename, "%s/scale1_conv2d_5x5_2_weights_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_2_weights_dim,scale1_conv2d_5x5_2_weights_array);
	
	scale1_conv2d_5x5_2_param->kernel = scale1_conv2d_5x5_2_weights_array;
	SIZE scale1_conv2d_5x5_2_bias_dim = 64;
	static DATA scale1_conv2d_5x5_2_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_2_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_2_bias_dim,scale1_conv2d_5x5_2_bias_array);
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
	
	SIZE scale1_conv2d_5x5_3_weights_dim = 64 * 3 * 5 * 5;
	static DATA scale1_conv2d_5x5_3_weights_array[4800];
	sprintf(filename, "%s/scale1_conv2d_5x5_3_weights_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_3_weights_dim,scale1_conv2d_5x5_3_weights_array);
	
	scale1_conv2d_5x5_3_param->kernel = scale1_conv2d_5x5_3_weights_array;
	SIZE scale1_conv2d_5x5_3_bias_dim = 64;
	static DATA scale1_conv2d_5x5_3_bias_array[64];
	sprintf(filename, "%s/scale1_conv2d_5x5_3_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_3_bias_dim,scale1_conv2d_5x5_3_bias_array);
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
	
	SIZE scale2_block0_A_conv2d_weights_dim = 64 * 64 * 3 * 3;
	static DATA scale2_block0_A_conv2d_weights_array[36864];
	sprintf(filename, "%s/scale2_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_A_conv2d_weights_dim,scale2_block0_A_conv2d_weights_array);
	
	scale2_block0_A_conv2d_param->kernel = scale2_block0_A_conv2d_weights_array;
	SIZE scale2_block0_A_conv2d_bias_dim = 64;
	static DATA scale2_block0_A_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_A_conv2d_bias_dim,scale2_block0_A_conv2d_bias_array);
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
	
	SIZE scale2_block0_B_conv2d_weights_dim = 64 * 64 * 3 * 3;
	static DATA scale2_block0_B_conv2d_weights_array[36864];
	sprintf(filename, "%s/scale2_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_B_conv2d_weights_dim,scale2_block0_B_conv2d_weights_array);
	
	scale2_block0_B_conv2d_param->kernel = scale2_block0_B_conv2d_weights_array;
	SIZE scale2_block0_B_conv2d_bias_dim = 64;
	static DATA scale2_block0_B_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_B_conv2d_bias_dim,scale2_block0_B_conv2d_bias_array);
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
	
	SIZE scale2_block1_A_conv2d_weights_dim = 64 * 64 * 3 * 3;
	static DATA scale2_block1_A_conv2d_weights_array[36864];
	sprintf(filename, "%s/scale2_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_A_conv2d_weights_dim,scale2_block1_A_conv2d_weights_array);
	
	scale2_block1_A_conv2d_param->kernel = scale2_block1_A_conv2d_weights_array;
	SIZE scale2_block1_A_conv2d_bias_dim = 64;
	static DATA scale2_block1_A_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_A_conv2d_bias_dim,scale2_block1_A_conv2d_bias_array);
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
	
	SIZE scale2_block1_B_conv2d_weights_dim = 64 * 64 * 3 * 3;
	static DATA scale2_block1_B_conv2d_weights_array[36864];
	sprintf(filename, "%s/scale2_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_B_conv2d_weights_dim,scale2_block1_B_conv2d_weights_array);
	
	scale2_block1_B_conv2d_param->kernel = scale2_block1_B_conv2d_weights_array;
	SIZE scale2_block1_B_conv2d_bias_dim = 64;
	static DATA scale2_block1_B_conv2d_bias_array[64];
	sprintf(filename, "%s/scale2_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_B_conv2d_bias_dim,scale2_block1_B_conv2d_bias_array);
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
	
	SIZE scale3_block0_shortcut_conv2d_weights_dim = 128 * 64 * 3 * 3;
	static DATA scale3_block0_shortcut_conv2d_weights_array[73728];
	sprintf(filename, "%s/scale3_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_shortcut_conv2d_weights_dim,scale3_block0_shortcut_conv2d_weights_array);
	
	scale3_block0_shortcut_conv2d_param->kernel = scale3_block0_shortcut_conv2d_weights_array;
	SIZE scale3_block0_shortcut_conv2d_bias_dim = 128;
	static DATA scale3_block0_shortcut_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_shortcut_conv2d_bias_dim,scale3_block0_shortcut_conv2d_bias_array);
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
	
	SIZE scale3_block0_A_conv2d_weights_dim = 128 * 64 * 3 * 3;
	static DATA scale3_block0_A_conv2d_weights_array[73728];
	sprintf(filename, "%s/scale3_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_A_conv2d_weights_dim,scale3_block0_A_conv2d_weights_array);
	
	scale3_block0_A_conv2d_param->kernel = scale3_block0_A_conv2d_weights_array;
	SIZE scale3_block0_A_conv2d_bias_dim = 128;
	static DATA scale3_block0_A_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_A_conv2d_bias_dim,scale3_block0_A_conv2d_bias_array);
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
	
	SIZE scale3_block0_B_conv2d_weights_dim = 128 * 128 * 3 * 3;
	static DATA scale3_block0_B_conv2d_weights_array[147456];
	sprintf(filename, "%s/scale3_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_B_conv2d_weights_dim,scale3_block0_B_conv2d_weights_array);
	
	scale3_block0_B_conv2d_param->kernel = scale3_block0_B_conv2d_weights_array;
	SIZE scale3_block0_B_conv2d_bias_dim = 128;
	static DATA scale3_block0_B_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_B_conv2d_bias_dim,scale3_block0_B_conv2d_bias_array);
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
	
	SIZE scale3_block1_A_conv2d_weights_dim = 128 * 128 * 3 * 3;
	static DATA scale3_block1_A_conv2d_weights_array[147456];
	sprintf(filename, "%s/scale3_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_A_conv2d_weights_dim,scale3_block1_A_conv2d_weights_array);
	
	scale3_block1_A_conv2d_param->kernel = scale3_block1_A_conv2d_weights_array;
	SIZE scale3_block1_A_conv2d_bias_dim = 128;
	static DATA scale3_block1_A_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_A_conv2d_bias_dim,scale3_block1_A_conv2d_bias_array);
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
	
	SIZE scale3_block1_B_conv2d_weights_dim = 128 * 128 * 3 * 3;
	static DATA scale3_block1_B_conv2d_weights_array[147456];
	sprintf(filename, "%s/scale3_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_B_conv2d_weights_dim,scale3_block1_B_conv2d_weights_array);
	
	scale3_block1_B_conv2d_param->kernel = scale3_block1_B_conv2d_weights_array;
	SIZE scale3_block1_B_conv2d_bias_dim = 128;
	static DATA scale3_block1_B_conv2d_bias_array[128];
	sprintf(filename, "%s/scale3_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_B_conv2d_bias_dim,scale3_block1_B_conv2d_bias_array);
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
	
	SIZE scale4_block0_shortcut_conv2d_weights_dim = 256 * 128 * 3 * 3;
	static DATA scale4_block0_shortcut_conv2d_weights_array[294912];
	sprintf(filename, "%s/scale4_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_shortcut_conv2d_weights_dim,scale4_block0_shortcut_conv2d_weights_array);
	
	scale4_block0_shortcut_conv2d_param->kernel = scale4_block0_shortcut_conv2d_weights_array;
	SIZE scale4_block0_shortcut_conv2d_bias_dim = 256;
	static DATA scale4_block0_shortcut_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_shortcut_conv2d_bias_dim,scale4_block0_shortcut_conv2d_bias_array);
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
	
	SIZE scale4_block0_A_conv2d_weights_dim = 256 * 128 * 3 * 3;
	static DATA scale4_block0_A_conv2d_weights_array[294912];
	sprintf(filename, "%s/scale4_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_A_conv2d_weights_dim,scale4_block0_A_conv2d_weights_array);
	
	scale4_block0_A_conv2d_param->kernel = scale4_block0_A_conv2d_weights_array;
	SIZE scale4_block0_A_conv2d_bias_dim = 256;
	static DATA scale4_block0_A_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_A_conv2d_bias_dim,scale4_block0_A_conv2d_bias_array);
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
	
	SIZE scale4_block0_B_conv2d_weights_dim = 256 * 256 * 3 * 3;
	static DATA scale4_block0_B_conv2d_weights_array[589824];
	sprintf(filename, "%s/scale4_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_B_conv2d_weights_dim,scale4_block0_B_conv2d_weights_array);
	
	scale4_block0_B_conv2d_param->kernel = scale4_block0_B_conv2d_weights_array;
	SIZE scale4_block0_B_conv2d_bias_dim = 256;
	static DATA scale4_block0_B_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_B_conv2d_bias_dim,scale4_block0_B_conv2d_bias_array);
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
	
	SIZE scale4_block1_A_conv2d_weights_dim = 256 * 256 * 3 * 3;
	static DATA scale4_block1_A_conv2d_weights_array[589824];
	sprintf(filename, "%s/scale4_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_A_conv2d_weights_dim,scale4_block1_A_conv2d_weights_array);
	
	scale4_block1_A_conv2d_param->kernel = scale4_block1_A_conv2d_weights_array;
	SIZE scale4_block1_A_conv2d_bias_dim = 256;
	static DATA scale4_block1_A_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_A_conv2d_bias_dim,scale4_block1_A_conv2d_bias_array);
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
	
	SIZE scale4_block1_B_conv2d_weights_dim = 256 * 256 * 3 * 3;
	static DATA scale4_block1_B_conv2d_weights_array[589824];
	sprintf(filename, "%s/scale4_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_B_conv2d_weights_dim,scale4_block1_B_conv2d_weights_array);
	
	scale4_block1_B_conv2d_param->kernel = scale4_block1_B_conv2d_weights_array;
	SIZE scale4_block1_B_conv2d_bias_dim = 256;
	static DATA scale4_block1_B_conv2d_bias_array[256];
	sprintf(filename, "%s/scale4_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_B_conv2d_bias_dim,scale4_block1_B_conv2d_bias_array);
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
	
	SIZE scale5_block0_shortcut_conv2d_weights_dim = 512 * 256 * 3 * 3;
	static DATA scale5_block0_shortcut_conv2d_weights_array[1179648];
	sprintf(filename, "%s/scale5_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_shortcut_conv2d_weights_dim,scale5_block0_shortcut_conv2d_weights_array);
	
	scale5_block0_shortcut_conv2d_param->kernel = scale5_block0_shortcut_conv2d_weights_array;
	SIZE scale5_block0_shortcut_conv2d_bias_dim = 512;
	static DATA scale5_block0_shortcut_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_shortcut_conv2d_bias_dim,scale5_block0_shortcut_conv2d_bias_array);
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
	
	SIZE scale5_block0_A_conv2d_weights_dim = 512 * 256 * 3 * 3;
	static DATA scale5_block0_A_conv2d_weights_array[1179648];
	sprintf(filename, "%s/scale5_block0_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_A_conv2d_weights_dim,scale5_block0_A_conv2d_weights_array);
	
	scale5_block0_A_conv2d_param->kernel = scale5_block0_A_conv2d_weights_array;
	SIZE scale5_block0_A_conv2d_bias_dim = 512;
	static DATA scale5_block0_A_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_A_conv2d_bias_dim,scale5_block0_A_conv2d_bias_array);
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
	
	SIZE scale5_block0_B_conv2d_weights_dim = 512 * 512 * 3 * 3;
	static DATA scale5_block0_B_conv2d_weights_array[2359296];
	sprintf(filename, "%s/scale5_block0_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_B_conv2d_weights_dim,scale5_block0_B_conv2d_weights_array);
	
	scale5_block0_B_conv2d_param->kernel = scale5_block0_B_conv2d_weights_array;
	SIZE scale5_block0_B_conv2d_bias_dim = 512;
	static DATA scale5_block0_B_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_B_conv2d_bias_dim,scale5_block0_B_conv2d_bias_array);
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
	
	SIZE scale5_block1_A_conv2d_weights_dim = 512 * 512 * 3 * 3;
	static DATA scale5_block1_A_conv2d_weights_array[2359296];
	sprintf(filename, "%s/scale5_block1_A_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_A_conv2d_weights_dim,scale5_block1_A_conv2d_weights_array);
	
	scale5_block1_A_conv2d_param->kernel = scale5_block1_A_conv2d_weights_array;
	SIZE scale5_block1_A_conv2d_bias_dim = 512;
	static DATA scale5_block1_A_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_A_conv2d_bias_dim,scale5_block1_A_conv2d_bias_array);
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
	
	SIZE scale5_block1_B_conv2d_weights_dim = 512 * 512 * 3 * 3;
	static DATA scale5_block1_B_conv2d_weights_array[2359296];
	sprintf(filename, "%s/scale5_block1_B_conv2d_weights_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_B_conv2d_weights_dim,scale5_block1_B_conv2d_weights_array);
	
	scale5_block1_B_conv2d_param->kernel = scale5_block1_B_conv2d_weights_array;
	SIZE scale5_block1_B_conv2d_bias_dim = 512;
	static DATA scale5_block1_B_conv2d_bias_array[512];
	sprintf(filename, "%s/scale5_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_B_conv2d_bias_dim,scale5_block1_B_conv2d_bias_array);
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
	print_data(batch_join_output, batch_join_dim, "output/0_batch_join_output_FIXED");
	
	SIZE scale1_conv2d_padding_size[] = { 3, 226, 226 };
	SIZE scale1_conv2d_padding_dim = 3 * 226 * 226;
	static DATA scale1_conv2d_padding_output[scale1_conv2d_padding_dim];
	SIZE scale1_conv2d_padding_pad[] = { 1, 1 };
	
	zero_pad(batch_join_output, scale1_conv2d_padding_output, batch_join_size, scale1_conv2d_padding_pad);
	print_data(scale1_conv2d_padding_output, scale1_conv2d_padding_dim, "output/1_scale1_conv2d_padding_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale1_conv2d_5x5_0_param, scale1_conv2d_padding_output, scale1_conv2d_5x5_0_output, scale1_conv2d_padding_size, scale1_conv2d_5x5_0_size, scale1_conv2d_5x5_0_stride, scale1_conv2d_5x5_0_pad);
	print_data(scale1_conv2d_5x5_0_output, scale1_conv2d_5x5_0_dim, "output/2_scale1_conv2d_5x5_0_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale1_conv2d_5x5_1_param, scale1_conv2d_padding_output, scale1_conv2d_5x5_1_output, scale1_conv2d_padding_size, scale1_conv2d_5x5_1_size, scale1_conv2d_5x5_1_stride, scale1_conv2d_5x5_1_pad);
	print_data(scale1_conv2d_5x5_1_output, scale1_conv2d_5x5_1_dim, "output/3_scale1_conv2d_5x5_1_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale1_conv2d_5x5_2_param, scale1_conv2d_padding_output, scale1_conv2d_5x5_2_output, scale1_conv2d_padding_size, scale1_conv2d_5x5_2_size, scale1_conv2d_5x5_2_stride, scale1_conv2d_5x5_2_pad);
	print_data(scale1_conv2d_5x5_2_output, scale1_conv2d_5x5_2_dim, "output/4_scale1_conv2d_5x5_2_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale1_conv2d_5x5_3_param, scale1_conv2d_padding_output, scale1_conv2d_5x5_3_output, scale1_conv2d_padding_size, scale1_conv2d_5x5_3_size, scale1_conv2d_5x5_3_stride, scale1_conv2d_5x5_3_pad);
	print_data(scale1_conv2d_5x5_3_output, scale1_conv2d_5x5_3_dim, "output/5_scale1_conv2d_5x5_3_output_FIXED");
	
	DATA* scale1_conv2d_merge_inputs[4] = { scale1_conv2d_5x5_0_output, scale1_conv2d_5x5_1_output, scale1_conv2d_5x5_2_output, scale1_conv2d_5x5_3_output };
	SIZE scale1_conv2d_merge_size[] = { 64, 112, 112 };
	SIZE scale1_conv2d_merge_dim = 64 * 112 * 112;
	static DATA scale1_conv2d_merge_output[scale1_conv2d_merge_dim];
	SIZE scale1_conv2d_merge_stride[] = { 2, 2 };
	
	spatconv_merge(scale1_conv2d_merge_output, scale1_conv2d_merge_inputs, scale1_conv2d_merge_size, 5, scale1_conv2d_merge_stride, false);
	print_data(scale1_conv2d_merge_output, scale1_conv2d_merge_dim, "output/6_scale1_conv2d_merge_output_FIXED");
	
	DATA* scale1_Relu_output = (DATA *) calloc(scale1_conv2d_merge_dim, sizeof(DATA));
	relu_forward(scale1_conv2d_merge_output, scale1_Relu_output, scale1_conv2d_merge_size);
	print_data(scale1_Relu_output, scale1_conv2d_merge_dim, "output/7_scale1_Relu_output_FIXED");
	
	SIZE scale2_max_pool_size[] = { 64, 56, 56 };
	SIZE scale2_max_pool_dim = 64 * 56 * 56;
	DATA* scale2_max_pool_output = (DATA *) calloc(scale2_max_pool_dim, sizeof(DATA));
	SIZE scale2_max_pool_filter[] = { 3, 3 };
	SIZE scale2_max_pool_stride[] = { 2, 2 };
	SIZE scale2_max_pool_pad[] = { 1, 1 };
	maxpool_forward(scale1_Relu_output, scale2_max_pool_output, scale1_conv2d_merge_size, scale2_max_pool_size, scale2_max_pool_filter, scale2_max_pool_stride, scale2_max_pool_pad);
	print_data(scale2_max_pool_output, scale2_max_pool_dim, "output/8_scale2_max_pool_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale2_block0_A_conv2d_param, scale2_max_pool_output, scale2_block0_A_conv2d_output, scale2_max_pool_size, scale2_block0_A_conv2d_size, scale2_block0_A_conv2d_stride, scale2_block0_A_conv2d_pad, true);
	print_data(scale2_block0_A_conv2d_output, scale2_block0_A_conv2d_dim, "output/9_scale2_block0_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale2_block0_B_conv2d_param, scale2_block0_A_conv2d_output, scale2_block0_B_conv2d_output, scale2_block0_A_conv2d_size, scale2_block0_B_conv2d_size, scale2_block0_B_conv2d_stride, scale2_block0_B_conv2d_pad);
	print_data(scale2_block0_B_conv2d_output, scale2_block0_B_conv2d_dim, "output/10_scale2_block0_B_conv2d_output_FIXED");
	
	DATA* scale2_block0_Residual_Add_Add_output = (DATA *) calloc(scale2_max_pool_dim, sizeof(DATA));
	add_forward_wR(scale2_max_pool_output, scale2_block0_B_conv2d_output, scale2_block0_Residual_Add_Add_output, scale2_max_pool_size);
	print_data(scale2_block0_Residual_Add_Add_output, scale2_max_pool_dim, "output/11_scale2_block0_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale2_block1_A_conv2d_param, scale2_block0_Residual_Add_Add_output, scale2_block1_A_conv2d_output, scale2_block0_B_conv2d_size, scale2_block1_A_conv2d_size, scale2_block1_A_conv2d_stride, scale2_block1_A_conv2d_pad, true);
	print_data(scale2_block1_A_conv2d_output, scale2_block1_A_conv2d_dim, "output/12_scale2_block1_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale2_block1_B_conv2d_param, scale2_block1_A_conv2d_output, scale2_block1_B_conv2d_output, scale2_block1_A_conv2d_size, scale2_block1_B_conv2d_size, scale2_block1_B_conv2d_stride, scale2_block1_B_conv2d_pad);
	print_data(scale2_block1_B_conv2d_output, scale2_block1_B_conv2d_dim, "output/13_scale2_block1_B_conv2d_output_FIXED");
	
	DATA* scale2_block1_Residual_Add_Add_output = (DATA *) calloc(scale2_block1_B_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale2_block1_B_conv2d_output, scale2_block0_Residual_Add_Add_output, scale2_block1_Residual_Add_Add_output, scale2_block1_B_conv2d_size);
	print_data(scale2_block1_Residual_Add_Add_output, scale2_block1_B_conv2d_dim, "output/14_scale2_block1_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale3_block0_shortcut_conv2d_param, scale2_block1_Residual_Add_Add_output, scale3_block0_shortcut_conv2d_output, scale2_block0_B_conv2d_size, scale3_block0_shortcut_conv2d_size, scale3_block0_shortcut_conv2d_stride, scale3_block0_shortcut_conv2d_pad);
	print_data(scale3_block0_shortcut_conv2d_output, scale3_block0_shortcut_conv2d_dim, "output/15_scale3_block0_shortcut_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale3_block0_A_conv2d_param, scale2_block1_Residual_Add_Add_output, scale3_block0_A_conv2d_output, scale2_block0_B_conv2d_size, scale3_block0_A_conv2d_size, scale3_block0_A_conv2d_stride, scale3_block0_A_conv2d_pad, true);
	print_data(scale3_block0_A_conv2d_output, scale3_block0_A_conv2d_dim, "output/16_scale3_block0_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale3_block0_B_conv2d_param, scale3_block0_A_conv2d_output, scale3_block0_B_conv2d_output, scale3_block0_A_conv2d_size, scale3_block0_B_conv2d_size, scale3_block0_B_conv2d_stride, scale3_block0_B_conv2d_pad);
	print_data(scale3_block0_B_conv2d_output, scale3_block0_B_conv2d_dim, "output/17_scale3_block0_B_conv2d_output_FIXED");
	
	DATA* scale3_block0_Residual_Add_Add_output = (DATA *) calloc(scale3_block0_shortcut_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale3_block0_shortcut_conv2d_output, scale3_block0_B_conv2d_output, scale3_block0_Residual_Add_Add_output, scale3_block0_shortcut_conv2d_size);
	print_data(scale3_block0_Residual_Add_Add_output, scale3_block0_shortcut_conv2d_dim, "output/18_scale3_block0_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale3_block1_A_conv2d_param, scale3_block0_Residual_Add_Add_output, scale3_block1_A_conv2d_output, scale3_block0_B_conv2d_size, scale3_block1_A_conv2d_size, scale3_block1_A_conv2d_stride, scale3_block1_A_conv2d_pad, true);
	print_data(scale3_block1_A_conv2d_output, scale3_block1_A_conv2d_dim, "output/19_scale3_block1_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale3_block1_B_conv2d_param, scale3_block1_A_conv2d_output, scale3_block1_B_conv2d_output, scale3_block1_A_conv2d_size, scale3_block1_B_conv2d_size, scale3_block1_B_conv2d_stride, scale3_block1_B_conv2d_pad);
	print_data(scale3_block1_B_conv2d_output, scale3_block1_B_conv2d_dim, "output/20_scale3_block1_B_conv2d_output_FIXED");
	
	DATA* scale3_block1_Residual_Add_Add_output = (DATA *) calloc(scale3_block1_B_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale3_block1_B_conv2d_output, scale3_block0_Residual_Add_Add_output, scale3_block1_Residual_Add_Add_output, scale3_block1_B_conv2d_size);
	print_data(scale3_block1_Residual_Add_Add_output, scale3_block1_B_conv2d_dim, "output/21_scale3_block1_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale4_block0_shortcut_conv2d_param, scale3_block1_Residual_Add_Add_output, scale4_block0_shortcut_conv2d_output, scale3_block0_B_conv2d_size, scale4_block0_shortcut_conv2d_size, scale4_block0_shortcut_conv2d_stride, scale4_block0_shortcut_conv2d_pad);
	print_data(scale4_block0_shortcut_conv2d_output, scale4_block0_shortcut_conv2d_dim, "output/22_scale4_block0_shortcut_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale4_block0_A_conv2d_param, scale3_block1_Residual_Add_Add_output, scale4_block0_A_conv2d_output, scale3_block0_B_conv2d_size, scale4_block0_A_conv2d_size, scale4_block0_A_conv2d_stride, scale4_block0_A_conv2d_pad, true);
	print_data(scale4_block0_A_conv2d_output, scale4_block0_A_conv2d_dim, "output/23_scale4_block0_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale4_block0_B_conv2d_param, scale4_block0_A_conv2d_output, scale4_block0_B_conv2d_output, scale4_block0_A_conv2d_size, scale4_block0_B_conv2d_size, scale4_block0_B_conv2d_stride, scale4_block0_B_conv2d_pad);
	print_data(scale4_block0_B_conv2d_output, scale4_block0_B_conv2d_dim, "output/24_scale4_block0_B_conv2d_output_FIXED");
	
	DATA* scale4_block0_Residual_Add_Add_output = (DATA *) calloc(scale4_block0_shortcut_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale4_block0_shortcut_conv2d_output, scale4_block0_B_conv2d_output, scale4_block0_Residual_Add_Add_output, scale4_block0_shortcut_conv2d_size);
	print_data(scale4_block0_Residual_Add_Add_output, scale4_block0_shortcut_conv2d_dim, "output/25_scale4_block0_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale4_block1_A_conv2d_param, scale4_block0_Residual_Add_Add_output, scale4_block1_A_conv2d_output, scale4_block0_B_conv2d_size, scale4_block1_A_conv2d_size, scale4_block1_A_conv2d_stride, scale4_block1_A_conv2d_pad, true);
	print_data(scale4_block1_A_conv2d_output, scale4_block1_A_conv2d_dim, "output/26_scale4_block1_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale4_block1_B_conv2d_param, scale4_block1_A_conv2d_output, scale4_block1_B_conv2d_output, scale4_block1_A_conv2d_size, scale4_block1_B_conv2d_size, scale4_block1_B_conv2d_stride, scale4_block1_B_conv2d_pad);
	print_data(scale4_block1_B_conv2d_output, scale4_block1_B_conv2d_dim, "output/27_scale4_block1_B_conv2d_output_FIXED");
	
	DATA* scale4_block1_Residual_Add_Add_output = (DATA *) calloc(scale4_block1_B_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale4_block1_B_conv2d_output, scale4_block0_Residual_Add_Add_output, scale4_block1_Residual_Add_Add_output, scale4_block1_B_conv2d_size);
	print_data(scale4_block1_Residual_Add_Add_output, scale4_block1_B_conv2d_dim, "output/28_scale4_block1_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale5_block0_shortcut_conv2d_param, scale4_block1_Residual_Add_Add_output, scale5_block0_shortcut_conv2d_output, scale4_block0_B_conv2d_size, scale5_block0_shortcut_conv2d_size, scale5_block0_shortcut_conv2d_stride, scale5_block0_shortcut_conv2d_pad);
	print_data(scale5_block0_shortcut_conv2d_output, scale5_block0_shortcut_conv2d_dim, "output/29_scale5_block0_shortcut_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale5_block0_A_conv2d_param, scale4_block1_Residual_Add_Add_output, scale5_block0_A_conv2d_output, scale4_block0_B_conv2d_size, scale5_block0_A_conv2d_size, scale5_block0_A_conv2d_stride, scale5_block0_A_conv2d_pad, true);
	print_data(scale5_block0_A_conv2d_output, scale5_block0_A_conv2d_dim, "output/30_scale5_block0_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale5_block0_B_conv2d_param, scale5_block0_A_conv2d_output, scale5_block0_B_conv2d_output, scale5_block0_A_conv2d_size, scale5_block0_B_conv2d_size, scale5_block0_B_conv2d_stride, scale5_block0_B_conv2d_pad);
	print_data(scale5_block0_B_conv2d_output, scale5_block0_B_conv2d_dim, "output/31_scale5_block0_B_conv2d_output_FIXED");
	
	DATA* scale5_block0_Residual_Add_Add_output = (DATA *) calloc(scale5_block0_shortcut_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale5_block0_shortcut_conv2d_output, scale5_block0_B_conv2d_output, scale5_block0_Residual_Add_Add_output, scale5_block0_shortcut_conv2d_size);
	print_data(scale5_block0_Residual_Add_Add_output, scale5_block0_shortcut_conv2d_dim, "output/32_scale5_block0_Residual_Add_Add_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale5_block1_A_conv2d_param, scale5_block0_Residual_Add_Add_output, scale5_block1_A_conv2d_output, scale5_block0_B_conv2d_size, scale5_block1_A_conv2d_size, scale5_block1_A_conv2d_stride, scale5_block1_A_conv2d_pad, true);
	print_data(scale5_block1_A_conv2d_output, scale5_block1_A_conv2d_dim, "output/33_scale5_block1_A_conv2d_output_FIXED");
	
	
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
	
	spatconv_forward_sw(scale5_block1_B_conv2d_param, scale5_block1_A_conv2d_output, scale5_block1_B_conv2d_output, scale5_block1_A_conv2d_size, scale5_block1_B_conv2d_size, scale5_block1_B_conv2d_stride, scale5_block1_B_conv2d_pad);
	print_data(scale5_block1_B_conv2d_output, scale5_block1_B_conv2d_dim, "output/34_scale5_block1_B_conv2d_output_FIXED");
	
	DATA* scale5_block1_Residual_Add_Add_output = (DATA *) calloc(scale5_block1_B_conv2d_dim, sizeof(DATA));
	add_forward_wR(scale5_block1_B_conv2d_output, scale5_block0_Residual_Add_Add_output, scale5_block1_Residual_Add_Add_output, scale5_block1_B_conv2d_size);
	print_data(scale5_block1_Residual_Add_Add_output, scale5_block1_B_conv2d_dim, "output/35_scale5_block1_Residual_Add_Add_output_FIXED");
	
	SIZE avg_pool_size[] = { 512, 1, 1 };
	SIZE avg_pool_dim = 512 * 1 * 1;
	DATA* avg_pool_output = (DATA *) calloc(avg_pool_dim, sizeof(DATA));
	SIZE avg_pool_filter[] = { 7, 7 };
	SIZE avg_pool_stride[] = { 1, 1 };
	SIZE avg_pool_pad[] = { 0, 0 };
	avgpool_forward(scale5_block1_Residual_Add_Add_output, avg_pool_output, scale5_block0_B_conv2d_size, avg_pool_size, avg_pool_filter, avg_pool_stride, avg_pool_pad);
	print_data(avg_pool_output, avg_pool_dim, "output/36_avg_pool_output_FIXED");
	
	_tprintf_("CHECKSUM: %lld\n", checksum(avg_pool_output, avg_pool_dim));
	
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
}

