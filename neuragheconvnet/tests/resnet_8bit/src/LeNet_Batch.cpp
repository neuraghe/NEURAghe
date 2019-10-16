// This code is auto-generated. Do not edit.

#include "LeNet_Batch.h"

#include "assert.h"

#include "tests.h"


#define ELEM_PER_WS 32

// global variables

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
SOCMAP soc;
DATA* wPointer;


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
LINEAR_FP16 xw_plus_b_MatMul_param;


DATA *scale1_conv2d_5x5_0_out;
DATA *scale1_conv2d_5x5_1_out;
DATA *scale1_conv2d_5x5_2_out;
DATA *scale1_conv2d_5x5_3_out;
DATA *tmp_out; 

DATA scale1_conv2d_padding_output[3 * 226 * 228];
DATA scale1_conv2d_merge_output[64 * 112 * 112];
DATA scale1_Relu_output[64 * 112 * 112];
DATA scale2_max_pool_output[64 * 56 * 56];	
DATA scale2_block0_A_conv2d_output[200704];	
DATA scale2_block0_B_conv2d_output[200704];
DATA scale2_block0_Residual_Add_Add_output[64 * 56 * 56];	
DATA scale2_block1_A_conv2d_output[200704];	
DATA scale2_block1_B_conv2d_output[200704];	
DATA scale3_block0_shortcut_conv2d_output[100352];	
DATA scale3_block0_A_conv2d_output[100352];	
DATA scale3_block0_B_conv2d_output[100352];	
DATA scale3_block1_A_conv2d_output[100352];	
DATA scale3_block1_B_conv2d_output[100352];	
DATA scale4_block0_shortcut_conv2d_output[50176];	
DATA scale4_block0_A_conv2d_output[50176];	
DATA scale4_block0_B_conv2d_output[50176];	
DATA scale4_block1_A_conv2d_output[50176];	
DATA scale4_block1_B_conv2d_output[50176];	
DATA scale5_block0_shortcut_conv2d_output[25088];	
DATA scale5_block0_A_conv2d_output[25088];	
DATA scale5_block0_B_conv2d_output[25088];
DATA scale5_block0_B_conv2d_output_hw[512 * 8 * 7];	
DATA scale5_block1_A_conv2d_output[25088];	
DATA scale5_block1_B_conv2d_output[25088];
DATA scale5_block1_B_conv2d_output_hw[512 * 8 * 7];
DATA scale2_block0_Shortcut[64 * 56 * 56];
DATA avg_pool_output[512 * 1 * 1];
DATA scale2_block1_Shortcut[64 * 56 * 56];
DATA scale2_block1_Residual_Add_Add_output[64 * 56 * 56];
DATA scale3_block0_Shortcut[128 * 28 * 28];	
DATA scale3_block0_Residual_Add_Add_output[128 * 28 * 28];
DATA scale3_block1_Shortcut[128 * 28 * 28];	
DATA scale3_block1_Residual_Add_Add_output[128 * 28 * 28];
DATA scale4_block0_Shortcut[256 * 14 * 14];	
DATA scale4_block0_Residual_Add_Add_output[256 * 14 * 14];
DATA scale4_block1_Shortcut[256 * 14 * 14];
DATA scale4_block1_Residual_Add_Add_output[256 * 14 * 14];	
DATA scale5_block0_Shortcut[512 * 8 * 7];
DATA scale5_block0_Residual_Add_Add_output[512 * 7 * 7];
DATA scale5_block0_Residual_Add_Add_output_hw[512 * 8 * 7];
DATA scale5_block1_Shortcut[512 * 8 * 7];
DATA scale5_block1_Residual_Add_Add_output[512 * 7 * 7];
DATA scale5_block1_Residual_Add_Add_output_tmp[512 * 8 * 7];


void init_platform(char* bitstream){
	init_soc(&soc, &wPointer, _MAXMEM_, 0, bitstream);
}

/*

 ██████╗███╗   ██╗███╗   ██╗    ██╗███╗   ██╗██╗████████╗
██╔════╝████╗  ██║████╗  ██║    ██║████╗  ██║██║╚══██╔══╝
██║     ██╔██╗ ██║██╔██╗ ██║    ██║██╔██╗ ██║██║   ██║   
██║     ██║╚██╗██║██║╚██╗██║    ██║██║╚██╗██║██║   ██║   
╚██████╗██║ ╚████║██║ ╚████║    ██║██║ ╚████║██║   ██║   
 ╚═════╝╚═╝  ╚═══╝╚═╝  ╚═══╝    ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   
                                                                                                              
                                                          
*/

void cnnMainInit(VARNAME load_data_dir)
{
        
        int minIF=0;
        int wsize=0;
        int minOF=0;
        int IG=0, OG=0;

	double time;
	VARNAME filename;

	SIZE scale1_conv2d_5x5_out_dim = 64 * 113 * 114;
	scale1_conv2d_5x5_0_out = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_out_dim*sizeof(DATA));
	scale1_conv2d_5x5_1_out = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_out_dim*sizeof(DATA));
	scale1_conv2d_5x5_2_out = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_out_dim*sizeof(DATA));
	scale1_conv2d_5x5_3_out = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_out_dim*sizeof(DATA));
	tmp_out = (DATA*)neu_DDRmalloc(_MAXMEM_*sizeof(DATA));

int minmaxog = 4;
if (_NCOL_ == 2)
   minmaxog=9;
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
	scale1_conv2d_5x5_0_param->maxog = minmaxog;
        
        if (scale1_conv2d_5x5_0_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale1_conv2d_5x5_0_param->pin/minIF;
        if (scale1_conv2d_5x5_0_param->pin%minIF)
          IG++;
        
        OG= scale1_conv2d_5x5_0_param->pout/minOF;
        if (scale1_conv2d_5x5_0_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
  printf("wsize %d\n", wsize);
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_0_weights_array_file", load_data_dir);
	scale1_conv2d_5x5_0_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale1_conv2d_5x5_0_param->kernel);
		
	SIZE scale1_conv2d_5x5_0_bias_dim = 64;
	scale1_conv2d_5x5_0_param->bias = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_0_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale1_conv2d_5x5_0_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_0_bias_dim,scale1_conv2d_5x5_0_param->bias);
	
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
	scale1_conv2d_5x5_1_param->maxog = minmaxog;
	
        
        if (scale1_conv2d_5x5_1_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale1_conv2d_5x5_1_param->pin/minIF;
        if (scale1_conv2d_5x5_1_param->pin%minIF)
          IG++;
        
        OG= scale1_conv2d_5x5_1_param->pout/minOF;
        if (scale1_conv2d_5x5_1_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
        
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_1_weights_array_file", load_data_dir);
	scale1_conv2d_5x5_1_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale1_conv2d_5x5_1_param->kernel);
	
	SIZE scale1_conv2d_5x5_1_bias_dim = 64;
	scale1_conv2d_5x5_1_param->bias = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_1_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale1_conv2d_5x5_1_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_1_bias_dim,scale1_conv2d_5x5_1_param->bias);
	
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
	scale1_conv2d_5x5_2_param->maxog = minmaxog;
	
        if (scale1_conv2d_5x5_2_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale1_conv2d_5x5_2_param->pin/minIF;
        if (scale1_conv2d_5x5_2_param->pin%minIF)
          IG++;
        
        OG= scale1_conv2d_5x5_2_param->pout/minOF;
        if (scale1_conv2d_5x5_2_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_2_weights_array_file", load_data_dir);
	scale1_conv2d_5x5_2_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));	
	load_fixed(filename,wsize,scale1_conv2d_5x5_2_param->kernel);
	
	SIZE scale1_conv2d_5x5_2_bias_dim = 64;
	scale1_conv2d_5x5_2_param->bias = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_2_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale1_conv2d_5x5_2_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_2_bias_dim,scale1_conv2d_5x5_2_param->bias);
	
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
	scale1_conv2d_5x5_3_param->maxog = minmaxog;
	
        if (scale1_conv2d_5x5_3_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale1_conv2d_5x5_3_param->pin/minIF;
        if (scale1_conv2d_5x5_3_param->pin%minIF)
          IG++;
        
        OG= scale1_conv2d_5x5_3_param->pout/minOF;
        if (scale1_conv2d_5x5_3_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 7168
	// original weight shape = 64 x 3 x 5 x 5;
	sprintf(filename, "%s/scale1_conv2d_5x5_3_weights_array_file", load_data_dir);
	scale1_conv2d_5x5_3_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale1_conv2d_5x5_3_param->kernel);
	
	SIZE scale1_conv2d_5x5_3_bias_dim = 64;
	scale1_conv2d_5x5_3_param->bias = (DATA*)neu_DDRmalloc(scale1_conv2d_5x5_3_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale1_conv2d_5x5_3_bias_array_file", load_data_dir);
	load_fixed(filename,scale1_conv2d_5x5_3_bias_dim,scale1_conv2d_5x5_3_param->bias);
	
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
	scale2_block0_A_conv2d_param->maxog = minmaxog;
	
        if (scale2_block0_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale2_block0_A_conv2d_param->pin/minIF;
        if (scale2_block0_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale2_block0_A_conv2d_param->pout/minOF;
        if (scale2_block0_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block0_A_conv2d_weights_array_file", load_data_dir);
	scale2_block0_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
        
	load_fixed(filename,wsize,scale2_block0_A_conv2d_param->kernel);
	
	SIZE scale2_block0_A_conv2d_bias_dim = 64;
	scale2_block0_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale2_block0_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale2_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_A_conv2d_bias_dim,scale2_block0_A_conv2d_param->bias);
	
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
	scale2_block0_B_conv2d_param->maxog = minmaxog;
	
        if (scale2_block0_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale2_block0_B_conv2d_param->pin/minIF;
        if (scale2_block0_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale2_block0_B_conv2d_param->pout/minOF;
        if (scale2_block0_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block0_B_conv2d_weights_array_file", load_data_dir);
	scale2_block0_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale2_block0_B_conv2d_param->kernel);
	
	SIZE scale2_block0_B_conv2d_bias_dim = 64;
	scale2_block0_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale2_block0_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale2_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block0_B_conv2d_bias_dim,scale2_block0_B_conv2d_param->bias);
	
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
	scale2_block1_A_conv2d_param->maxog = minmaxog;
	
        if (scale2_block1_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale2_block1_A_conv2d_param->pin/minIF;
        if (scale2_block1_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale2_block1_A_conv2d_param->pout/minOF;
        if (scale2_block1_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block1_A_conv2d_weights_array_file", load_data_dir);
	scale2_block1_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale2_block1_A_conv2d_param->kernel);
	
	SIZE scale2_block1_A_conv2d_bias_dim = 64;
	scale2_block1_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale2_block1_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale2_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_A_conv2d_bias_dim,scale2_block1_A_conv2d_param->bias);
	
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
	scale2_block1_B_conv2d_param->maxog = minmaxog;
	
        if (scale2_block1_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale2_block1_B_conv2d_param->pin/minIF;
        if (scale2_block1_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale2_block1_B_conv2d_param->pout/minOF;
        if (scale2_block1_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 43008
	// original weight shape = 64 x 64 x 3 x 3;
	sprintf(filename, "%s/scale2_block1_B_conv2d_weights_array_file", load_data_dir);
	scale2_block1_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale2_block1_B_conv2d_param->kernel);
	
	SIZE scale2_block1_B_conv2d_bias_dim = 64;
	scale2_block1_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale2_block1_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale2_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale2_block1_B_conv2d_bias_dim,scale2_block1_B_conv2d_param->bias);
	
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
	scale3_block0_shortcut_conv2d_param->maxog = minmaxog;
	
        if (scale3_block0_shortcut_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale3_block0_shortcut_conv2d_param->pin/minIF;
        if (scale3_block0_shortcut_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale3_block0_shortcut_conv2d_param->pout/minOF;
        if (scale3_block0_shortcut_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 86016
	// original weight shape = 128 x 64 x 3 x 3;
	sprintf(filename, "%s/scale3_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	scale3_block0_shortcut_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale3_block0_shortcut_conv2d_param->kernel);
	
	SIZE scale3_block0_shortcut_conv2d_bias_dim = 128;
	scale3_block0_shortcut_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale3_block0_shortcut_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale3_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_shortcut_conv2d_bias_dim,scale3_block0_shortcut_conv2d_param->bias);
	
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
	scale3_block0_A_conv2d_param->maxog = minmaxog;
	
        if (scale3_block0_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale3_block0_A_conv2d_param->pin/minIF;
        if (scale3_block0_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale3_block0_A_conv2d_param->pout/minOF;
        if (scale3_block0_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 86016
	// original weight shape = 128 x 64 x 3 x 3;
	sprintf(filename, "%s/scale3_block0_A_conv2d_weights_array_file", load_data_dir);
	scale3_block0_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale3_block0_A_conv2d_param->kernel);
	
	SIZE scale3_block0_A_conv2d_bias_dim = 128;
	scale3_block0_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale3_block0_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale3_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_A_conv2d_bias_dim,scale3_block0_A_conv2d_param->bias);
	
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
	scale3_block0_B_conv2d_param->maxog = minmaxog;
	
        if (scale3_block0_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale3_block0_B_conv2d_param->pin/minIF;
        if (scale3_block0_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale3_block0_B_conv2d_param->pout/minOF;
        if (scale3_block0_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/scale3_block0_B_conv2d_weights_array_file", load_data_dir);
	scale3_block0_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale3_block0_B_conv2d_param->kernel);
	
	SIZE scale3_block0_B_conv2d_bias_dim = 128;
	scale3_block0_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale3_block0_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale3_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block0_B_conv2d_bias_dim,scale3_block0_B_conv2d_param->bias);
	
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
	scale3_block1_A_conv2d_param->maxog = minmaxog;
	
        if (scale3_block1_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale3_block1_A_conv2d_param->pin/minIF;
        if (scale3_block1_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale3_block1_A_conv2d_param->pout/minOF;
        if (scale3_block1_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/scale3_block1_A_conv2d_weights_array_file", load_data_dir);
	scale3_block1_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale3_block1_A_conv2d_param->kernel);
	
	SIZE scale3_block1_A_conv2d_bias_dim = 128;
	scale3_block1_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale3_block1_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale3_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_A_conv2d_bias_dim,scale3_block1_A_conv2d_param->bias);
	
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
	scale3_block1_B_conv2d_param->maxog = minmaxog;
	
        if (scale3_block1_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale3_block1_B_conv2d_param->pin/minIF;
        if (scale3_block1_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale3_block1_B_conv2d_param->pout/minOF;
        if (scale3_block1_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 157696
	// original weight shape = 128 x 128 x 3 x 3;
	sprintf(filename, "%s/scale3_block1_B_conv2d_weights_array_file", load_data_dir);
	scale3_block1_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale3_block1_B_conv2d_param->kernel);
	
	SIZE scale3_block1_B_conv2d_bias_dim = 128;
	scale3_block1_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale3_block1_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale3_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale3_block1_B_conv2d_bias_dim,scale3_block1_B_conv2d_param->bias);
	
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
	scale4_block0_shortcut_conv2d_param->maxog = minmaxog;
	
        if (scale4_block0_shortcut_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale4_block0_shortcut_conv2d_param->pin/minIF;
        if (scale4_block0_shortcut_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale4_block0_shortcut_conv2d_param->pout/minOF;
        if (scale4_block0_shortcut_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 315392
	// original weight shape = 256 x 128 x 3 x 3;
	sprintf(filename, "%s/scale4_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	scale4_block0_shortcut_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale4_block0_shortcut_conv2d_param->kernel);
	
	SIZE scale4_block0_shortcut_conv2d_bias_dim = 256;
	scale4_block0_shortcut_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale4_block0_shortcut_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale4_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_shortcut_conv2d_bias_dim,scale4_block0_shortcut_conv2d_param->bias);
	
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
	scale4_block0_A_conv2d_param->maxog = minmaxog;
	
        if (scale4_block0_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale4_block0_A_conv2d_param->pin/minIF;
        if (scale4_block0_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale4_block0_A_conv2d_param->pout/minOF;
        if (scale4_block0_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 315392
	// original weight shape = 256 x 128 x 3 x 3;
	sprintf(filename, "%s/scale4_block0_A_conv2d_weights_array_file", load_data_dir);
	scale4_block0_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale4_block0_A_conv2d_param->kernel);
	
	SIZE scale4_block0_A_conv2d_bias_dim = 256;
	scale4_block0_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale4_block0_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale4_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_A_conv2d_bias_dim,scale4_block0_A_conv2d_param->bias);
	
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
	scale4_block0_B_conv2d_param->maxog = minmaxog;
	
        if (scale4_block0_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale4_block0_B_conv2d_param->pin/minIF;
        if (scale4_block0_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale4_block0_B_conv2d_param->pout/minOF;
        if (scale4_block0_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/scale4_block0_B_conv2d_weights_array_file", load_data_dir);
	scale4_block0_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale4_block0_B_conv2d_param->kernel);
	
	SIZE scale4_block0_B_conv2d_bias_dim = 256;
	scale4_block0_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale4_block0_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale4_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block0_B_conv2d_bias_dim,scale4_block0_B_conv2d_param->bias);
	
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
	scale4_block1_A_conv2d_param->maxog = minmaxog;
	
        if (scale4_block1_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale4_block1_A_conv2d_param->pin/minIF;
        if (scale4_block1_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale4_block1_A_conv2d_param->pout/minOF;
        if (scale4_block1_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/scale4_block1_A_conv2d_weights_array_file", load_data_dir);
	scale4_block1_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale4_block1_A_conv2d_param->kernel);
	
	SIZE scale4_block1_A_conv2d_bias_dim = 256;
	scale4_block1_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale4_block1_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale4_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_A_conv2d_bias_dim,scale4_block1_A_conv2d_param->bias);
	
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
	scale4_block1_B_conv2d_param->maxog = minmaxog;
	
        if (scale4_block1_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale4_block1_B_conv2d_param->pin/minIF;
        if (scale4_block1_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale4_block1_B_conv2d_param->pout/minOF;
        if (scale4_block1_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 630784
	// original weight shape = 256 x 256 x 3 x 3;
	sprintf(filename, "%s/scale4_block1_B_conv2d_weights_array_file", load_data_dir);
	scale4_block1_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale4_block1_B_conv2d_param->kernel);
	
	SIZE scale4_block1_B_conv2d_bias_dim = 256;
	scale4_block1_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale4_block1_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale4_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale4_block1_B_conv2d_bias_dim,scale4_block1_B_conv2d_param->bias);
	
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
	scale5_block0_shortcut_conv2d_param->maxog = minmaxog;
	
        if (scale5_block0_shortcut_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale5_block0_shortcut_conv2d_param->pin/minIF;
        if (scale5_block0_shortcut_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale5_block0_shortcut_conv2d_param->pout/minOF;
        if (scale5_block0_shortcut_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 1261568
	// original weight shape = 512 x 256 x 3 x 3;
	sprintf(filename, "%s/scale5_block0_shortcut_conv2d_weights_array_file", load_data_dir);
	scale5_block0_shortcut_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale5_block0_shortcut_conv2d_param->kernel);
	
	SIZE scale5_block0_shortcut_conv2d_bias_dim = 512;
	scale5_block0_shortcut_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale5_block0_shortcut_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale5_block0_shortcut_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_shortcut_conv2d_bias_dim,scale5_block0_shortcut_conv2d_param->bias);
	
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
	scale5_block0_A_conv2d_param->maxog = minmaxog;
	
        if (scale5_block0_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale5_block0_A_conv2d_param->pin/minIF;
        if (scale5_block0_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale5_block0_A_conv2d_param->pout/minOF;
        if (scale5_block0_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 1261568
	// original weight shape = 512 x 256 x 3 x 3;
	sprintf(filename, "%s/scale5_block0_A_conv2d_weights_array_file", load_data_dir);
	scale5_block0_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale5_block0_A_conv2d_param->kernel);
	
	SIZE scale5_block0_A_conv2d_bias_dim = 512;
	scale5_block0_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale5_block0_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale5_block0_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_A_conv2d_bias_dim,scale5_block0_A_conv2d_param->bias);
	
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
	scale5_block0_B_conv2d_param->maxog = minmaxog;
	
        if (scale5_block0_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale5_block0_B_conv2d_param->pin/minIF;
        if (scale5_block0_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale5_block0_B_conv2d_param->pout/minOF;
        if (scale5_block0_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/scale5_block0_B_conv2d_weights_array_file", load_data_dir);
	scale5_block0_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale5_block0_B_conv2d_param->kernel);
	
	SIZE scale5_block0_B_conv2d_bias_dim = 512;
	scale5_block0_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale5_block0_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale5_block0_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block0_B_conv2d_bias_dim,scale5_block0_B_conv2d_param->bias);
	
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
	scale5_block1_A_conv2d_param->maxog = minmaxog;
	
        if (scale5_block1_A_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale5_block1_A_conv2d_param->pin/minIF;
        if (scale5_block1_A_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale5_block1_A_conv2d_param->pout/minOF;
        if (scale5_block1_A_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/scale5_block1_A_conv2d_weights_array_file", load_data_dir);
	scale5_block1_A_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale5_block1_A_conv2d_param->kernel);
	
	SIZE scale5_block1_A_conv2d_bias_dim = 512;
	scale5_block1_A_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale5_block1_A_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale5_block1_A_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_A_conv2d_bias_dim,scale5_block1_A_conv2d_param->bias);
	
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
	scale5_block1_B_conv2d_param->maxog = minmaxog;
	
        if (scale5_block1_B_conv2d_param->kern_s[2] == 3)
          minIF=_NCOL_*3;
        else 
          minIF=_NCOL_;	

        minOF=_NROW_;
        
        IG= scale5_block1_B_conv2d_param->pin/minIF;
        if (scale5_block1_B_conv2d_param->pin%minIF)
          IG++;
        
        OG= scale5_block1_B_conv2d_param->pout/minOF;
        if (scale5_block1_B_conv2d_param->pout%minOF)
          OG++;
          
        wsize=IG*OG*_NROW_*_NCOL_*ELEM_PER_WS;  
        
        
	// preprocessed weight dim = 2465792
	// original weight shape = 512 x 512 x 3 x 3;
	sprintf(filename, "%s/scale5_block1_B_conv2d_weights_array_file", load_data_dir);
	scale5_block1_B_conv2d_param->kernel = (DATA*)neu_DDRmalloc(wsize*sizeof(DATA));
	load_fixed(filename,wsize,scale5_block1_B_conv2d_param->kernel);
	
	SIZE scale5_block1_B_conv2d_bias_dim = 512;
	scale5_block1_B_conv2d_param->bias = (DATA*)neu_DDRmalloc(scale5_block1_B_conv2d_bias_dim*sizeof(DATA));;
	sprintf(filename, "%s/scale5_block1_B_conv2d_bias_array_file", load_data_dir);
	load_fixed(filename,scale5_block1_B_conv2d_bias_dim,scale5_block1_B_conv2d_param->bias);
	
	SIZE scale5_block1_B_conv2d_dim = 512 * 7 * 7;
	
	
	SIZE avg_pool_dim = 512 * 1 * 1;
	
	
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 512
	 * X 512 x 1
	 */
	SIZE xw_plus_b_MatMul_dim = 1000;
	xw_plus_b_MatMul_param = linear_fp16_create();
	xw_plus_b_MatMul_param->out_s = 1000;
	xw_plus_b_MatMul_param->in_s = avg_pool_dim;
	static short int xw_plus_b_MatMul_weights_array[512000];
	sprintf(filename, "%s/xw_plus_b_MatMul_weights_array_file", load_data_dir);
	load_fixed_16bit(filename,512000,xw_plus_b_MatMul_weights_array);
	xw_plus_b_MatMul_param->weights = xw_plus_b_MatMul_weights_array;
	static short int xw_plus_b_MatMul_bias_array[1000];
	sprintf(filename, "%s/xw_plus_b_MatMul_bias_array_file", load_data_dir);
	load_fixed_16bit(filename,1000,xw_plus_b_MatMul_bias_array);
	xw_plus_b_MatMul_param->bias = xw_plus_b_MatMul_bias_array;
	
	
	
}

void round4(DATA* dest, DATA* src, int KS, int n_feat, int height, int width){
  
  int n_feat_round;
  int min_feat;
  int i;
  
  if (KS==5)
    min_feat=_NCOL_;
  else
    min_feat=_NCOL_*3;
    
  n_feat_round = n_feat/min_feat;
  if (n_feat%min_feat>0)
   n_feat_round++;
  n_feat_round= n_feat_round *min_feat;
  
   
  for (i=0; i < n_feat_round*height*width;i++)
    if (i<n_feat*height*width)
      dest[i]=src[i];
    else
      dest[i]=0;
}


RET place_zeros_nointer(uint32_t* data, SIZE out_s[3])
{
  _tcreate_(time);

  int step = 1;
  int tot_rows = out_s[1];
  int of = out_s[0];

  int int_per_row = out_s[2]/2 + 1;

  uint32_t* ptr;
  for(int row=0; row < tot_rows*of; row++){
    ptr = data + step * (row*int_per_row + int_per_row-1); 
    *(ptr)   = *(ptr)   & 0x0000FFFFU;
  }
  }
  
void from8to16bit (signed char * src, short int * dst, int size, int qf_8, int qf_16){
  int qf_diff= qf_16-qf_8;
  
  for (int i=0;i<size;i++){
    dst[i]=src[i]<<qf_diff;
    
  }
  
}
/*

 ██████╗███╗   ██╗███╗   ██╗    ███████╗██╗  ██╗███████╗ ██████╗
██╔════╝████╗  ██║████╗  ██║    ██╔════╝╚██╗██╔╝██╔════╝██╔════╝
██║     ██╔██╗ ██║██╔██╗ ██║    █████╗   ╚███╔╝ █████╗  ██║     
██║     ██║╚██╗██║██║╚██╗██║    ██╔══╝   ██╔██╗ ██╔══╝  ██║     
╚██████╗██║ ╚████║██║ ╚████║    ███████╗██╔╝ ██╗███████╗╚██████╗
 ╚═════╝╚═╝  ╚═══╝╚═╝  ╚═══╝    ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝
                                                                
*/

void add_zeros (DATA * out, DATA* in, int feat, int h_in, int w_in, int h_out, int w_out){
  int i,j,f;
  int c=0;
  for (f=0;f<feat;f++)
          for (i=0;i<h_out;i++)
            for (j=0;j<w_out;j++){
              if (i>h_in-1 || j>w_in-1)
                out[f*h_out*w_out + i*w_out + j]=0;
              else{
                out[f*h_out*w_out + i*w_out + j]= in[c];
                c++;
              }
            }
  

}

void relu (DATA * data, int size){
  int j;
    for (j=0;j<size;j++){
      if (data[j]<0)
        data[j]= 0;
      
    }
  

}

void do_stride (DATA * out, DATA* in, int feat, int h, int w, int stride){
  int i,j, f;
  int c=0;
  for (f=0;f<feat;f++)
  for (i=0;i<h;i+=stride)
    for (j=0;j<w;j+=stride){
      out[c]= in[f*h*w + i*w + j];
      c++;
    }
  

}

void discard_col (DATA * out, DATA* in, int feat, int h, int w, int num){
  int i,j, f;
  int c=0;
  for (f=0;f<feat;f++)
  for (i=0;i<h;i++)
    for (j=0;j<w;j++){
      if (j<w-num) {
        out[c]= in[f*h*w + i*w + j];
        c++;
      }
    }
  

}


void cnnMain(DATA* image, float* results)
{
	double time;
	SIZE batch_join_size[] = { 3, 224, 224 };
	SIZE batch_join_dim = 3 * 224 * 224;
	DATA* batch_join_output = image;


bool hw_relu = false;

       /* printf("val: %d \n", batch_join_output[25850]);
        printf("val: %d \n", batch_join_output[25851]);
        printf("val: %d \n", batch_join_output[25852]);
        printf("val: %d \n", batch_join_output[25853]);
        printf("val: %d \n", batch_join_output[25858]);
        printf("val: %d \n", batch_join_output[25859]);
*/

       // printf("CHECK: %lld \n", checksum(batch_join_output, 3*224*224));
//print_data(image, 3 * 224 * 224, "./image_8bit.txt");


/*	
	remove("/tmp/lockPL.neuraghe");
        exit(0);
*/


	int job_id = 0;
	int job_id_sc = 0;

	SIZE scale1_conv2d_padding_size[] = { 3, 226, 226 };
	SIZE scale1_conv2d_padding_dim = 3 * 226 * 226;
	static DATA scale1_conv2d_padding_output[scale1_conv2d_padding_dim];
	SIZE scale1_conv2d_padding_pad[] = { 1, 1 };
	
	zero_pad(batch_join_output, scale1_conv2d_padding_output, batch_join_size, scale1_conv2d_padding_pad);
	
     //   printf("CHECK: %lld \n", checksum(scale1_conv2d_padding_output, 3*226*226));
	//print_data(scale1_conv2d_padding_output, 3*226*226, "./zp_8bit.txt");
	
	SIZE scale1_conv2d_round_size[] = { 3, 226, 228 };
	SIZE scale1_conv2d_addzero_dim = 3 * 226 * 228;
	static DATA scale1_conv2d_addzero_output[scale1_conv2d_addzero_dim];
	
	add_zeros (scale1_conv2d_addzero_output, scale1_conv2d_padding_output, 3, 226, 226, 226, 228);
     
   /*
██████╗          ██╗       ██████╗ ██╗  ██╗            ███████╗██╗  ██╗███████╗
╚════██╗         ╚██╗     ██╔════╝ ██║  ██║            ╚════██║╚██╗██╔╝╚════██║
 █████╔╝    █████╗╚██╗    ███████╗ ███████║                ██╔╝ ╚███╔╝     ██╔╝
 ╚═══██╗    ╚════╝██╔╝    ██╔═══██╗╚════██║               ██╔╝  ██╔██╗    ██╔╝ 
██████╔╝         ██╔╝     ╚██████╔╝     ██║               ██║  ██╔╝ ██╗   ██║  
╚═════╝          ╚═╝       ╚═════╝      ╚═╝               ╚═╝  ╚═╝  ╚═╝   ╚═╝  
                                                                               
*/  
     
	/*
	 * Convolution layer
	 * IF = 3 x 226 x 226 --> OF = 64 x 113 x 113
	 * W 64 x 3 x 7 x 7
	 * Pad    2x2
	 * Stride 2x2
	 */
	
	SIZE scale1_conv2d_merge_size[]   = { 64, 112, 112 };
	SIZE scale1_conv2d_5x5_stride[] = { 1, 1 };
	SIZE scale1_conv2d_merge_stride[] = { 2, 2 };
	SIZE scale1_conv2d_merge_pad[] = { 2, 2 };
	SIZE scale1_conv2d_merge_dim = 64 * 112 * 112;

	SIZE scale1_conv2d_5x5_out[] = { 64, 226, 228 };
	SIZE scale1_conv2d_5x5_out_dim = 64 * 226 * 228;
	
	SIZE scale1_conv2d_5x5_strided[] = { 64, 113, 114 };
	SIZE scale1_conv2d_5x5_strided_dim = 64 * 113 * 114;
	SIZE _stride[2] = {1,1};
	int conv_id[4] = {0};

	static DATA scale1_conv2d_5x5_0_strided[scale1_conv2d_5x5_strided_dim];
	static DATA scale1_conv2d_5x5_1_strided[scale1_conv2d_5x5_strided_dim];
	static DATA scale1_conv2d_5x5_2_strided[scale1_conv2d_5x5_strided_dim];
	static DATA scale1_conv2d_5x5_3_strided[scale1_conv2d_5x5_strided_dim];

	static DATA scale1_conv2d_5x5_0_output[scale1_conv2d_5x5_out_dim];
	static DATA scale1_conv2d_5x5_1_output[scale1_conv2d_5x5_out_dim];
	static DATA scale1_conv2d_5x5_2_output[scale1_conv2d_5x5_out_dim];
	static DATA scale1_conv2d_5x5_3_output[scale1_conv2d_5x5_out_dim];

	static DATA scale1_conv2d_merge_output[scale1_conv2d_merge_dim];

  	//SPATCONV scale1_conv2d_7x7as5x5[4] = {
    //	scale1_conv2d_5x5_0_param,
    //	scale1_conv2d_5x5_1_param,
    //	scale1_conv2d_5x5_2_param,
    //	scale1_conv2d_5x5_3_param,
  	//};

	
  	//spatconv_forward_big_hw(scale1_conv2d_7x7as5x5, 5,
    //                      soc->in, scale1_conv2d_merge_output, soc,
    //                      scale1_conv2d_padding_size,
    //                      scale1_conv2d_merge_size,
    //                      scale1_conv2d_merge_stride,
    //                      scale1_conv2d_merge_pad,
    //                      true);

	
	
  round4 (soc->in, scale1_conv2d_addzero_output, 5, 3, 226, 228);
  
     //   printf("CHECK: %lld \n", checksum(soc->in, 4*226*228));
        
        
  //     print_data(soc->in, 4*226*228, "./round_8bit.txt");
	time = get_wall_time();
	
       // print_data(scale1_conv2d_5x5_0_param->kernel, 1000, "./w.txt");
        
	//print_data(scale1_conv2d_5x5_0_param->kernel, 32, "./wc0_8bit.txt");
	conv_id[0] = spatconv_forward_hw(scale1_conv2d_5x5_0_param, soc->in, scale1_conv2d_5x5_0_out, soc, scale1_conv2d_round_size, scale1_conv2d_5x5_out, scale1_conv2d_5x5_stride, scale1_conv2d_merge_pad, false, _QF_);        
	
	conv_id[1] = spatconv_forward_hw(scale1_conv2d_5x5_1_param, soc->in, scale1_conv2d_5x5_1_out, soc, scale1_conv2d_round_size, scale1_conv2d_5x5_out, scale1_conv2d_5x5_stride, scale1_conv2d_merge_pad, false, _QF_);
	
	conv_id[2] = spatconv_forward_hw(scale1_conv2d_5x5_2_param, soc->in, scale1_conv2d_5x5_2_out, soc, scale1_conv2d_round_size, scale1_conv2d_5x5_out, scale1_conv2d_5x5_stride, scale1_conv2d_merge_pad, false, _QF_);
	
	conv_id[3] = spatconv_forward_hw(scale1_conv2d_5x5_3_param, soc->in, scale1_conv2d_5x5_3_out, soc, scale1_conv2d_round_size, scale1_conv2d_5x5_out, scale1_conv2d_5x5_stride, scale1_conv2d_merge_pad, false, _QF_);
  
   
    #pragma omp parallel shared(conv_id)
    {
    	#pragma omp single
    	{
	    	#pragma omp task
	    	{
		    	spatconv_wait(soc, conv_id[0]);
		    	
		    	//print_data(scale1_conv2d_5x5_0_strided, 64*226*228, "./conv0nostr_8bit.txt");
		    	
                        do_stride (scale1_conv2d_5x5_0_strided, scale1_conv2d_5x5_0_out,64, 226, 228, 2); 
                       
                        print_data(scale1_conv2d_5x5_0_strided, 64 * 113 * 114, "./conv0_8bit.txt");
	
                     //   remove("/tmp/lockPL.neuraghe");
                     //   exit(0);
                        
                        
                  //      printf("CHECK: %lld \n", checksum(scale1_conv2d_5x5_0_strided, 64*113*114));
	          //      print_data(scale1_conv2d_5x5_0_strided, 64*113*114, "./conv0str_8bit.txt");
                        
                     //   discard_col (scale1_conv2d_5x5_0_out, scale1_conv2d_5x5_0_strided,64, 113, 114, 1);       
                        
                   //     printf("CHECK conv0: %lld \n", checksum(scale1_conv2d_5x5_0_out, 64*113*113));
                       
	              //  print_data(scale1_conv2d_5x5_0_strided, 64*113*114, "./aaaaaaaaaaaa.txt");
	
	//remove("/tmp/lockPL.neuraghe");
       // exit(0);
	    	}

	    	#pragma omp task
	    	{
	    		spatconv_wait(soc, conv_id[1]);
                        do_stride (scale1_conv2d_5x5_1_strided, scale1_conv2d_5x5_1_out,64, 226, 228, 2);
                    //    discard_col (scale1_conv2d_5x5_1_out, scale1_conv2d_5x5_1_strided,64, 113, 114, 1);   
                        
                 

			}

			#pragma omp task
			{
	    		spatconv_wait(soc, conv_id[2]);
                        do_stride (scale1_conv2d_5x5_2_strided, scale1_conv2d_5x5_2_out,64, 226, 228, 2);
                 //       discard_col (scale1_conv2d_5x5_2_out, scale1_conv2d_5x5_2_strided,64, 113, 114, 1);   

			}

			#pragma omp task
			{
	    		spatconv_wait(soc, conv_id[3]);
                        do_stride   (scale1_conv2d_5x5_3_strided, scale1_conv2d_5x5_3_out,64, 226, 228, 2);
                //        discard_col (scale1_conv2d_5x5_3_out, scale1_conv2d_5x5_3_strided,64, 113, 114, 1);   

			}
		}
	}
	
	
	
	/*
███╗   ███╗███████╗██████╗  ██████╗ ███████╗
████╗ ████║██╔════╝██╔══██╗██╔════╝ ██╔════╝
██╔████╔██║█████╗  ██████╔╝██║  ███╗█████╗  
██║╚██╔╝██║██╔══╝  ██╔══██╗██║   ██║██╔══╝  
██║ ╚═╝ ██║███████╗██║  ██║╚██████╔╝███████╗
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
                                            
*/




	DATA* scale1_conv2d_merge_inputs[4] = { scale1_conv2d_5x5_0_out, scale1_conv2d_5x5_1_out, scale1_conv2d_5x5_2_out, scale1_conv2d_5x5_3_out };
	spatconv_merge_hw(scale1_conv2d_merge_output, scale1_conv2d_merge_inputs, scale1_conv2d_merge_size, 5, scale1_conv2d_merge_stride, true, _QF_);
	
	_tprintf_("7x7 Conv time: %5.3f ms\n", (get_wall_time()-time)/1000);
	
	
       // print_data(scale1_conv2d_merge_output, 64 * 56 * 56, "./merge_8bit.txt");
	
  	//remove("/tmp/lockPL.neuraghe");
      //  exit(0);
        
  	// printf("CHECK: %lld \n", checksum(scale1_conv2d_merge_output, scale1_conv2d_merge_dim));

	//DATA* scale1_Relu_output = (DATA *) calloc(scale1_conv2d_merge_dim, sizeof(DATA));
	//relu_forward(scale1_conv2d_merge_output, scale1_Relu_output, scale1_conv2d_merge_size);
	
	
	//relu_forward(scale1_conv2d_merge_output, scale1_Relu_output, scale1_conv2d_merge_size);
	SIZE scale2_max_pool_size[]   = { 64, 56, 56 };
	SIZE scale2_max_pool_dim      = 64 * 56 * 56;
	SIZE scale2_max_pool_filter[] = { 3, 3 };
	SIZE scale2_max_pool_stride[] = { 2, 2 };
	SIZE scale2_max_pool_pad[]    = { 1, 1 };
	
	
	/*
███╗   ███╗ █████╗ ██╗  ██╗██████╗  ██████╗  ██████╗ ██╗     
████╗ ████║██╔══██╗╚██╗██╔╝██╔══██╗██╔═══██╗██╔═══██╗██║     
██╔████╔██║███████║ ╚███╔╝ ██████╔╝██║   ██║██║   ██║██║     
██║╚██╔╝██║██╔══██║ ██╔██╗ ██╔═══╝ ██║   ██║██║   ██║██║     
██║ ╚═╝ ██║██║  ██║██╔╝ ██╗██║     ╚██████╔╝╚██████╔╝███████╗
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝      ╚═════╝  ╚═════╝ ╚══════╝
                                                             
*/
	maxpool_fp8_forward(scale1_conv2d_merge_output, soc->in, scale1_conv2d_merge_size, scale2_max_pool_size, scale2_max_pool_filter, scale2_max_pool_stride, scale2_max_pool_pad);
	
	
	//OK checksum**************************************************************************************
	
	//printf("CHECK: %lld \n", checksum_abs(soc->in, 64*56*56));
     //   remove("/tmp/lockPL.neuraghe");
     //   exit(0);
	
	//print_data(soc->in, 64*56*56, "./max.txt");
      //  exit(0);	
	
	
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
	SIZE scale2_block0_A_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block0_A_conv2d_pad[] = { 1, 1 };
	
	//printf("CHECKw: %lld \n", checksum_abs(scale2_block0_A_conv2d_param->kernel, 49152));
       // remove("/tmp/lockPL.neuraghe");
       // exit(0);
      //  for (int ii=0; ii<64*56*56;ii++)
     //     soc->out[ii]=2;
          
	job_id = spatconv_forward_hw(scale2_block0_A_conv2d_param, soc->in, soc->out, soc, scale2_max_pool_size, scale2_block0_A_conv2d_size, scale2_block0_A_conv2d_stride, scale2_block0_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale2_block0_A_conv2d_output_scale2_block0_A_conv2d_output_dstride[] = { 1, 1 };
	
	spatconv_wait(soc, job_id);
	
	printf("CHECKprerelu: %lld \n", checksum_abs(soc->out, 64*56*56));
	if (!hw_relu)
	  relu (soc->out, 64*56*56);
	
	printf("CHECKpostrelu: %lld \n", checksum_abs(soc->out, 64*56*56));
	print_data(soc->out, 64*56*56, "./a1.txt");
        remove("/tmp/lockPL.neuraghe");
      // exit(0);
        
	memcpyNEON(scale2_block0_Shortcut, soc->in, scale2_block0_A_conv2d_dim*sizeof(DATA));
	
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
	SIZE scale2_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	SIZE scale2_block0_B_conv2d_scale2_max_pool_output_dstride[] = { 1, 1 };
	
	job_id = spatconv_forward_hw(scale2_block0_B_conv2d_param, soc->in, soc->out, soc, scale2_block0_A_conv2d_size, scale2_block0_B_conv2d_size, scale2_block0_B_conv2d_stride, scale2_block0_B_conv2d_pad,false, _QF_);
	
	SIZE scale2_block0_B_conv2d_output_scale2_block0_B_conv2d_output_dstride[] = { 1, 1 };
	
	spatconv_wait(soc, job_id);

	 
   // memcpyNEON(scale2_block0_B_conv2d_output, soc->out, scale2_block0_B_conv2d_dim*sizeof(DATA));
    add_fp8_forward_wR(scale2_block0_Shortcut, soc->out, soc->in, scale2_max_pool_size);
    //add_fp8_forward_wR(scale2_block0_Shortcut, soc->out, soc->in, scale2_max_pool_size);
   // memcpyNEON(soc->in, scale2_block0_Residual_Add_Add_output, scale2_block0_A_conv2d_dim*sizeof(DATA));
	
	
	printf("CHECKaa: %lld \n", checksum_abs(scale2_block0_Shortcut, 64*56*56));
      //  remove("/tmp/lockPL.neuraghe");
    //    exit(0);
	
	
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
	SIZE scale2_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block1_A_conv2d_pad[] = { 1, 1 };
	
	
	//time = get_wall_time();
	//memcpyNEON(scale2_block1_Shortcut, soc->in, scale2_block0_B_conv2d_dim*sizeof(DATA));
	//_tprintf_("\tmemcpyNEON: %5.3f ms\n", (get_wall_time()-time)/1000);

	job_id=spatconv_forward_hw(scale2_block1_A_conv2d_param, soc->in, soc->out, soc, scale2_block0_B_conv2d_size, scale2_block1_A_conv2d_size, scale2_block1_A_conv2d_stride, scale2_block1_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale2_block1_A_conv2d_output_scale2_block1_A_conv2d_output_dstride[] = { 1, 1 };
	
	
	spatconv_wait(soc, job_id);
	
	if (!hw_relu)
	  relu (soc->out, 64*56*56);
	
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
	SIZE scale2_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale2_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	SIZE scale2_block1_B_conv2d_scale2_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	memcpyNEON(scale2_block0_Residual_Add_Add_output, soc->out, scale2_block1_B_conv2d_dim*sizeof(DATA));
	      
	job_id = spatconv_forward_hw(scale2_block1_B_conv2d_param, soc->in, soc->out, soc, scale2_block1_A_conv2d_size, scale2_block1_B_conv2d_size, scale2_block1_B_conv2d_stride, scale2_block1_B_conv2d_pad, false, _QF_);
  
	SIZE scale2_block1_B_conv2d_output_scale2_block1_B_conv2d_output_dstride[] = { 1, 1 };
	
	spatconv_wait(soc, job_id);
		
	
	memcpyNEON(scale2_block1_B_conv2d_output, soc->out, scale2_block1_B_conv2d_dim*sizeof(DATA));	
	add_fp8_forward_wR(scale2_block0_Residual_Add_Add_output, scale2_block1_B_conv2d_output, scale2_block1_Residual_Add_Add_output, scale2_block1_B_conv2d_size);
	memcpyNEON(soc->in, scale2_block1_Residual_Add_Add_output, scale2_block0_B_conv2d_dim*sizeof(DATA));
	
	//print_data(soc->in, 64 * 56 * 56, "./64_8bit.txt");
	
  	//remove("/tmp/lockPL.neuraghe");
      //  exit(0);
	
	printf("CHECK: %lld \n", checksum_abs(soc->in, 64*56*56));
     //   remove("/tmp/lockPL.neuraghe");
    //    exit(0);
	
	/*
 ██████╗ ██╗  ██╗         ██╗       ██╗██████╗  █████╗ 
██╔════╝ ██║  ██║         ╚██╗     ███║╚════██╗██╔══██╗
███████╗ ███████║    █████╗╚██╗    ╚██║ █████╔╝╚█████╔╝
██╔═══██╗╚════██║    ╚════╝██╔╝     ██║██╔═══╝ ██╔══██╗
╚██████╔╝     ██║         ██╔╝      ██║███████╗╚█████╔╝
 ╚═════╝      ╚═╝         ╚═╝       ╚═╝╚══════╝ ╚════╝ 
                                                       
*/
    
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 128 x 28 x 28
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale3_block0_shortcut_conv2d_size[] = { 128, 56, 56 };
	SIZE scale3_block0_shortcut_conv2d_dim = 128 * 28 * 28;
	// scale3_block0_shortcut_conv2d_dim = 100352
	SIZE scale3_block0_shortcut_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block0_shortcut_conv2d_pad[] = { 1, 1 };
	
	job_id_sc = spatconv_forward_hw(scale3_block0_shortcut_conv2d_param, soc->in, tmp_out, soc, scale2_block0_B_conv2d_size, scale3_block0_shortcut_conv2d_size, scale3_block0_shortcut_conv2d_stride, scale3_block0_shortcut_conv2d_pad, false, _QF_);
	SIZE scale3_block0_shortcut_conv2d_output_scale3_block0_shortcut_conv2d_output_dstride[] = { 1, 1 };
        
        spatconv_wait(soc, job_id_sc);
  
        
        static DATA scale3_block0_shortcut_conv2d_strided[scale3_block0_shortcut_conv2d_dim];
	do_stride (scale3_block0_shortcut_conv2d_strided, tmp_out, 128, 56, 56, 2); 
	
    
    
    
    
	/*
	 * Convolution layer
	 * IF = 64 x 56 x 56 --> OF = 128 x 28 x 28
	 * W 128 x 64 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale3_block0_A_conv2d_size[] = { 128, 56, 56 };
	SIZE scale3_block0_A_conv2d_dim = 128 * 28 * 28;
	// scale3_block0_A_conv2d_dim = 100352
	SIZE scale3_block0_A_conv2d_stride[] = {1, 1 };
	SIZE scale3_block0_A_conv2d_pad[] = { 1, 1 };
	
	job_id = spatconv_forward_hw(scale3_block0_A_conv2d_param, soc->in, soc->out, soc, scale2_block0_B_conv2d_size, scale3_block0_A_conv2d_size, scale3_block0_A_conv2d_stride, scale3_block0_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale3_block0_A_conv2d_output_scale3_block0_A_conv2d_output_dstride[] = { 1, 1 };
        
        spatconv_wait(soc, job_id);
        static DATA scale3_block0_A_conv2d_strided[scale3_block0_A_conv2d_dim];
	do_stride (scale3_block0_A_conv2d_strided, soc->out, 128, 56, 56, 2); 
	
	if (!hw_relu)
	  relu (scale3_block0_A_conv2d_strided, 128*28*28);
	memcpyNEON(soc->out, scale3_block0_A_conv2d_strided, scale3_block0_A_conv2d_dim*sizeof(DATA));
	
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
	SIZE scale3_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(scale3_block0_B_conv2d_param, soc->in, soc->out, soc, scale3_block0_A_conv2d_size, scale3_block0_B_conv2d_size, scale3_block0_B_conv2d_stride, scale3_block0_B_conv2d_pad, false, _QF_);
	SIZE scale3_block0_B_conv2d_output_scale3_block0_B_conv2d_output_dstride[] = { 1, 1 };
	
	//spatconv_wait(soc, job_id_sc);
        memcpyNEON(scale3_block0_Shortcut, scale3_block0_shortcut_conv2d_strided, scale3_block0_shortcut_conv2d_dim*sizeof(DATA));
	//memcpyNEON(scale3_block0_Shortcut, tmp_out, scale3_block0_shortcut_conv2d_dim*sizeof(DATA));

	spatconv_wait(soc, job_id);

	memcpyNEON(scale3_block0_B_conv2d_output, soc->out, scale3_block0_B_conv2d_dim*sizeof(DATA));
	add_fp8_forward_wR(scale3_block0_Shortcut, scale3_block0_B_conv2d_output, scale3_block0_Residual_Add_Add_output, scale3_block0_B_conv2d_size);

        memcpyNEON(soc->in, scale3_block0_Residual_Add_Add_output, scale3_block0_B_conv2d_dim*sizeof(DATA));

	
	printf("CHECK: %lld \n", checksum_abs(soc->in, 128*28*28));
    //    remove("/tmp/lockPL.neuraghe");
   //     exit(0);
	//*********************** CERCA da qui
	
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
	SIZE scale3_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block1_A_conv2d_pad[] = { 1, 1 };
	
	
	//time = get_wall_time();
	//memcpyNEON(scale3_block1_Shortcut, soc->in, scale3_block0_shortcut_conv2d_dim*sizeof(DATA));
	//_tprintf_("\tmemcpyNEON: %5.3f ms\n", (get_wall_time()-time)/1000);

	job_id=spatconv_forward_hw(scale3_block1_A_conv2d_param, soc->in, soc->out, soc, scale3_block0_B_conv2d_size, scale3_block1_A_conv2d_size, scale3_block1_A_conv2d_stride, scale3_block1_A_conv2d_pad, hw_relu, _QF_);
	
	
	
	spatconv_wait(soc, job_id);
	if (!hw_relu)
	  relu (soc->out, 128*28*28);
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
	SIZE scale3_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale3_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in  = (DATA*)((uintptr_t)soc->in  ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in  = (DATA*)((uintptr_t)soc->in  ^ (uintptr_t)soc->out);
	SIZE scale3_block1_B_conv2d_scale3_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	
	
	//print_data(scale3_block1_B_conv2d_param->kernel, 157696, "./w.txt");
	//print_data(soc->in, 128*28*28, "./x.txt");
	
	
	job_id = spatconv_forward_hw(scale3_block1_B_conv2d_param, soc->in, soc->out, soc, scale3_block1_A_conv2d_size, scale3_block1_B_conv2d_size, scale3_block1_B_conv2d_stride, scale3_block1_B_conv2d_pad, false, _QF_);
	
	spatconv_wait(soc, job_id);
	
	


	memcpyNEON(scale3_block1_B_conv2d_output, soc->out, scale3_block1_B_conv2d_dim*sizeof(DATA));	
	add_fp8_forward_wR(scale3_block0_Residual_Add_Add_output, scale3_block1_B_conv2d_output, scale3_block1_Residual_Add_Add_output, scale3_block1_B_conv2d_size);

  memcpyNEON(soc->in, scale3_block1_Residual_Add_Add_output, scale3_block1_B_conv2d_dim*sizeof(DATA));
	
    // ERRORIIIIIII ************************************************************************
    

	
	printf("CHECK: %lld \n", checksum_abs(soc->in, 128*28*28));
  //      remove("/tmp/lockPL.neuraghe");
  //      exit(0);
        
   /*
 ██╗██████╗  █████╗          ██╗      ██████╗ ███████╗ ██████╗ 
███║╚════██╗██╔══██╗         ╚██╗     ╚════██╗██╔════╝██╔════╝ 
╚██║ █████╔╝╚█████╔╝    █████╗╚██╗     █████╔╝███████╗███████╗ 
 ██║██╔═══╝ ██╔══██╗    ╚════╝██╔╝    ██╔═══╝ ╚════██║██╔═══██╗
 ██║███████╗╚█████╔╝         ██╔╝     ███████╗███████║╚██████╔╝
 ╚═╝╚══════╝ ╚════╝          ╚═╝      ╚══════╝╚══════╝ ╚═════╝ 
                                                               
*/ 
    
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 256 x 14 x 14
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale4_block0_shortcut_conv2d_size[] = { 256, 28, 28 };
	SIZE scale4_block0_shortcut_conv2d_dim = 256 * 14 * 14;
	// scale4_block0_shortcut_conv2d_dim = 50176
	static DATA scale4_block0_shortcut_conv2d_output[50176];
	SIZE scale4_block0_shortcut_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block0_shortcut_conv2d_pad[] = { 1, 1 };
	
	job_id_sc = spatconv_forward_hw(scale4_block0_shortcut_conv2d_param, soc->in, tmp_out, soc, scale3_block0_B_conv2d_size, scale4_block0_shortcut_conv2d_size, scale4_block0_shortcut_conv2d_stride, scale4_block0_shortcut_conv2d_pad, false, _QF_);
	SIZE scale4_block0_shortcut_conv2d_output_scale4_block0_shortcut_conv2d_output_dstride[] = { 1, 1 };
	
	//spatconv_wait(soc, job_id_sc);
	
	  
 
	
	
	/*
	 * Convolution layer
	 * IF = 128 x 28 x 28 --> OF = 256 x 14 x 14
	 * W 256 x 128 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale4_block0_A_conv2d_size[] = { 256, 28, 28 };
	SIZE scale4_block0_A_conv2d_dim = 256 * 14 * 14;
	// scale4_block0_A_conv2d_dim = 50176
	SIZE scale4_block0_A_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block0_A_conv2d_pad[] = { 1, 1 };
	
	job_id=spatconv_forward_hw(scale4_block0_A_conv2d_param, soc->in, soc->out, soc, scale3_block0_B_conv2d_size, scale4_block0_A_conv2d_size, scale4_block0_A_conv2d_stride, scale4_block0_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale4_block0_A_conv2d_output_scale4_block0_A_conv2d_output_dstride[] = { 1, 1 };
	

         spatconv_wait(soc, job_id);
        static DATA scale4_block0_A_conv2d_strided[scale4_block0_A_conv2d_dim];
	do_stride (scale4_block0_A_conv2d_strided, soc->out, 256, 28, 28, 2); 
	
	if (!hw_relu)
	  relu (scale4_block0_A_conv2d_strided, 256*14*14);
	add_zeros (soc->out, scale4_block0_A_conv2d_strided, 256, 14, 14, 14, 16);
	
	//memcpyNEON(soc->out, scale4_block0_A_conv2d_strided, scale4_block0_A_conv2d_dim*sizeof(DATA));
	

    
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale4_block0_B_conv2d_size[] = { 256, 14, 16 };
	SIZE scale4_block0_B_conv2d_dim = 256 * 14 * 16;
	// scale4_block0_B_conv2d_dim = 50176
	SIZE scale4_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block0_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(scale4_block0_B_conv2d_param, soc->in, soc->out, soc, scale4_block0_A_conv2d_size, scale4_block0_B_conv2d_size, scale4_block0_B_conv2d_stride, scale4_block0_B_conv2d_pad, false, _QF_);
	SIZE scale4_block0_B_conv2d_output_scale4_block0_B_conv2d_output_dstride[] = { 1, 1 };

	spatconv_wait(soc, job_id_sc);
	
	static DATA scale4_block0_shortcut_conv2d_strided[scale4_block0_shortcut_conv2d_dim];
	do_stride (scale4_block0_Shortcut, tmp_out, 256, 28, 28, 2);
	
	 
	
	

	//memcpyNEON(scale4_block0_Shortcut, tmp_out, scale4_block0_shortcut_conv2d_dim*sizeof(DATA));

	spatconv_wait(soc, job_id);
	

	discard_col (scale1_conv2d_5x5_0_out, scale1_conv2d_5x5_0_strided, 256, 14, 16, 2);  
	
	SIZE scale4_block0_add_conv2d_size[] = { 256, 14, 14 };

	memcpyNEON(scale4_block0_B_conv2d_output, soc->out, scale4_block0_B_conv2d_dim*sizeof(DATA));
	add_fp8_forward_wR(scale4_block0_Shortcut, scale4_block0_B_conv2d_output, scale4_block0_Residual_Add_Add_output, scale4_block0_add_conv2d_size);
	//memcpyNEON(soc->in, scale4_block0_Residual_Add_Add_output, scale4_block0_B_conv2d_dim*sizeof(DATA));

        add_zeros (soc->in, scale4_block0_Residual_Add_Add_output, 256, 14, 14, 14, 16);

printf("CHECKrr: %lld \n", checksum_abs(soc->in, 256*14*16));
		

	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale4_block1_A_conv2d_size[] = { 256, 14, 16 };
	SIZE scale4_block1_A_conv2d_dim = 256 * 14 * 14;
	// scale4_block1_A_conv2d_dim = 50176
	SIZE scale4_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block1_A_conv2d_pad[] = { 1, 1 };

	
	//memcpyNEON(scale4_block1_Shortcut, soc->in, scale4_block0_shortcut_conv2d_dim*sizeof(DATA));

	job_id=spatconv_forward_hw(scale4_block1_A_conv2d_param, soc->in, soc->out, soc, scale4_block0_B_conv2d_size, scale4_block1_A_conv2d_size, scale4_block1_A_conv2d_stride, scale4_block1_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale4_block1_A_conv2d_output_scale4_block1_A_conv2d_output_dstride[] = { 1, 1 };
	
        spatconv_wait(soc, job_id);
        
        discard_col (tmp_out, soc->out, 256, 14, 16, 2); 
        
	if (!hw_relu)
	  relu (tmp_out, 256*14*14); 
	add_zeros (soc->out, tmp_out, 256, 14, 14, 14, 16);

printf("CHECKoo: %lld \n", checksum_abs(soc->out, 256*14*16));
	
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 256 x 14 x 14
	 * W 256 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale4_block1_B_conv2d_size[] = { 256, 14, 16 };
	SIZE scale4_block1_B_conv2d_dim = 256 * 14 * 14;
	// scale4_block1_B_conv2d_dim = 50176
	SIZE scale4_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale4_block1_B_conv2d_pad[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	SIZE scale4_block1_B_conv2d_scale4_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	job_id = spatconv_forward_hw(scale4_block1_B_conv2d_param, soc->in, soc->out, soc, scale4_block1_A_conv2d_size, scale4_block1_B_conv2d_size, scale4_block1_B_conv2d_stride, scale4_block1_B_conv2d_pad, false, _QF_);
	SIZE scale4_block1_B_conv2d_output_scale4_block1_B_conv2d_output_dstride[] = { 1, 1 };
	
	spatconv_wait(soc, job_id);

	discard_col (scale4_block1_B_conv2d_output, soc->out, 256, 14, 16, 2);  
	
	SIZE scale4_block1_B_add_size[] = { 256, 14, 12 };
  //memcpyNEON(scale4_block1_B_conv2d_output, soc->out, scale4_block1_B_conv2d_dim*sizeof(DATA));
  add_fp8_forward_wR(scale4_block0_Residual_Add_Add_output, scale4_block1_B_conv2d_output, scale4_block1_Residual_Add_Add_output, scale4_block1_B_add_size);

   //memcpyNEON(soc->in, scale4_block1_Residual_Add_Add_output, scale4_block1_B_conv2d_dim*sizeof(DATA));
add_zeros (soc->in, scale4_block1_Residual_Add_Add_output, 256, 14, 14, 14, 16);

        
	
	
	//print_data(soc->in, 64*56*56, "./max.txt");
      //  exit(0);	
	
	printf("CHECKuu: %lld \n", checksum_abs(soc->in, 256*14*16));
  //      remove("/tmp/lockPL.neuraghe");
     //   exit(0);
	
        //ERRORI****************************

/*
██████╗ ███████╗ ██████╗          ██╗      ███████╗ ██╗██████╗ 
╚════██╗██╔════╝██╔════╝          ╚██╗     ██╔════╝███║╚════██╗
 █████╔╝███████╗███████╗     █████╗╚██╗    ███████╗╚██║ █████╔╝
██╔═══╝ ╚════██║██╔═══██╗    ╚════╝██╔╝    ╚════██║ ██║██╔═══╝ 
███████╗███████║╚██████╔╝         ██╔╝     ███████║ ██║███████╗
╚══════╝╚══════╝ ╚═════╝          ╚═╝      ╚══════╝ ╚═╝╚══════╝
                                                               
*/
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale5_block0_shortcut_conv2d_size[] = { 512, 14, 16 };
	SIZE scale5_block0_shortcut_conv2d_dim = 512 * 7 * 7;
	SIZE scale5_block0_shortcut_hw = 512 * 7 * 8;
	// scale5_block0_shortcut_conv2d_dim = 25088
	SIZE scale5_block0_shortcut_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block0_shortcut_conv2d_pad[] = { 1, 1 };
	
	job_id_sc = spatconv_forward_hw(scale5_block0_shortcut_conv2d_param, soc->in, tmp_out, soc, scale4_block0_B_conv2d_size, scale5_block0_shortcut_conv2d_size, scale5_block0_shortcut_conv2d_stride, scale5_block0_shortcut_conv2d_pad, false, _QF_);
	SIZE scale5_block0_shortcut_conv2d_output_scale5_block0_shortcut_conv2d_output_dstride[] = { 1, 1 };
	
	spatconv_wait(soc, job_id_sc);
	do_stride (scale5_block0_Shortcut, tmp_out, 512, 14, 16, 2); 
	//discard_col (tmp_out, soc->out, 512, 7, 8, 1);  
	
	//HERE********************************************
    
	
	/*
	 * Convolution layer
	 * IF = 256 x 14 x 14 --> OF = 512 x 7 x 7
	 * W 512 x 256 x 3 x 3
	 * Pad    1x1
	 * Stride 2x2
	 */
	SIZE scale5_block0_A_conv2d_size[] = { 512, 14, 16 };
	SIZE scale5_block0_A_conv2d_dim = 512 * 7 * 7;
	// scale5_block0_A_conv2d_dim = 25088
	SIZE scale5_block0_A_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block0_A_conv2d_pad[] = { 1, 1 };

	job_id = spatconv_forward_hw(scale5_block0_A_conv2d_param, soc->in, soc->out, soc, scale4_block0_B_conv2d_size, scale5_block0_A_conv2d_size, scale5_block0_A_conv2d_stride, scale5_block0_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale5_block0_A_conv2d_output_scale5_block0_A_conv2d_output_dstride[] = { 1, 1 };
	
	
	spatconv_wait(soc, job_id);
	
	
	static DATA scale5_block0_A_conv2d_strided[ 512 * 7 * 8];
	do_stride (scale5_block0_A_conv2d_strided, soc->out, 512, 14, 16, 2); 
	discard_col (soc->in, scale5_block0_A_conv2d_strided, 512, 7, 8, 1);
	
	
	if (!hw_relu)
	  relu (soc->in, 512*7*7); 
	
        add_zeros (soc->out, soc->in, 512, 7, 7, 7, 8);
	
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale5_block0_B_conv2d_size[] = { 512, 7, 7 };
	SIZE scale5_add_size[] = { 512, 7, 8 };
	SIZE scale5_block0_B_conv2d_dim = 512 * 7 * 7;
	// scale5_block0_B_conv2d_dim = 25088
	SIZE scale5_block0_B_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block0_B_conv2d_pad[] = { 1, 1 };

	soc->in  = (DATA*)((uintptr_t)soc->in  ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in  = (DATA*)((uintptr_t)soc->in  ^ (uintptr_t)soc->out);	
	job_id = spatconv_forward_hw(scale5_block0_B_conv2d_param, soc->in, soc->out, soc, scale5_block0_A_conv2d_size, scale5_block0_B_conv2d_size, scale5_block0_B_conv2d_stride, scale5_block0_B_conv2d_pad, false, _QF_);
	SIZE scale5_block0_B_conv2d_output_scale5_block0_B_conv2d_output_dstride[] = { 1, 1 };

	//spatconv_wait(soc, job_id_sc);
	
	

	//memcpyNEON(scale5_block0_Shortcut, tmp_out, scale5_block0_shortcut_hw*sizeof(DATA));

	spatconv_wait(soc, job_id);	 
	
	memcpyNEON(scale5_block0_B_conv2d_output_hw, soc->out, scale5_block0_shortcut_hw*sizeof(DATA));
	
	add_fp8_forward_wR(scale5_block0_Shortcut, scale5_block0_B_conv2d_output_hw, scale5_block0_Residual_Add_Add_output_hw, scale5_add_size);
	
	//place_zeros_nointer((uint32_t*)scale5_block0_Residual_Add_Add_output_hw, scale5_add_size);
	
	discard_col (tmp_out, scale5_block0_Residual_Add_Add_output_hw, 512, 7, 8, 1);
        add_zeros (soc->in, tmp_out, 512, 7, 7, 7, 8);
	
	//memcpyNEON(soc->in, scale5_block0_Residual_Add_Add_output_hw, scale5_block0_shortcut_hw*sizeof(DATA));
	


	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale5_block1_A_conv2d_size[] = { 512, 7, 8 };
	SIZE scale5_block1_A_conv2d_dim = 512 * 7 * 7;
	SIZE scale5_block1_A_conv2d_dim_hw = 512 * 7 * 8;
	// scale5_block1_A_conv2d_dim = 25088
	SIZE scale5_block1_A_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block1_A_conv2d_pad[] = { 1, 1 };
	
	job_id = spatconv_forward_hw(scale5_block1_A_conv2d_param, soc->in, soc->out, soc, scale5_block0_B_conv2d_size, scale5_block1_A_conv2d_size, scale5_block1_A_conv2d_stride, scale5_block1_A_conv2d_pad, hw_relu, _QF_);
	SIZE scale5_block1_A_conv2d_output_scale5_block1_A_conv2d_output_dstride[] = { 1, 1 };

	spatconv_wait(soc, job_id);

	if (!hw_relu)
	  relu (soc->out, 512*7*8); 
	  
	discard_col (tmp_out, soc->out, 512, 7, 8, 1);
        add_zeros (soc->out, tmp_out, 512, 7, 7, 7, 8);
	
	//place_zeros_nointer((uint32_t*)soc->out, scale5_add_size);

	//time = get_wall_time();
	//memcpyNEON(scale5_block1_Shortcut, soc->in, scale5_block1_A_conv2d_dim_hw*sizeof(DATA));
	//_tprintf_("\tmemcpyNEON: %5.3f ms\n", (get_wall_time()-time)/1000);
	
	/*
	 * Convolution layer
	 * IF = 512 x 7 x 7 --> OF = 512 x 7 x 7
	 * W 512 x 512 x 3 x 3
	 * Pad    1x1
	 * Stride 1x1
	 */
	SIZE scale5_block1_B_conv2d_size[] = { 512, 7, 8 };
	SIZE scale5_block1_B_conv2d_dim = 512 * 7 * 7;
	// scale5_block1_B_conv2d_dim = 25088
	SIZE scale5_block1_B_conv2d_stride[] = { 1, 1 };
	SIZE scale5_block1_B_conv2d_pad[] = { 1, 1 };
	
	SIZE scale5_block1_B_conv2d_scale5_block0_Residual_Add_Add_output_dstride[] = { 1, 1 };
	
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	soc->out = (DATA*)((uintptr_t)soc->out ^ (uintptr_t)soc->in);
	soc->in = (DATA*)((uintptr_t)soc->in ^ (uintptr_t)soc->out);
	job_id = spatconv_forward_hw(scale5_block1_B_conv2d_param, soc->in, soc->out, soc, scale5_block1_A_conv2d_size, scale5_block1_B_conv2d_size, scale5_block1_B_conv2d_stride, scale5_block1_B_conv2d_pad, false, _QF_);
	SIZE scale5_block1_B_conv2d_output_scale5_block1_B_conv2d_output_dstride[] = { 1, 1 };

	spatconv_wait(soc, job_id);
	
	
	
	
   
  memcpyNEON(scale5_block1_B_conv2d_output_hw, soc->out, scale5_block1_A_conv2d_dim_hw*sizeof(DATA));
  add_fp8_forward_wR(scale5_block0_Residual_Add_Add_output_hw, scale5_block1_B_conv2d_output_hw, scale5_block1_Residual_Add_Add_output, scale5_add_size);
 
        
        
  int i;	
	for (i=0; i<512 * 7 * 7;i++){ //delete spurious column
          scale5_block1_Residual_Add_Add_output[i]=scale5_block1_Residual_Add_Add_output[i+i/7];
            
           
        
          }

	
	
	/*
 █████╗ ██╗   ██╗ ██████╗     ██████╗  ██████╗  ██████╗ ██╗     
██╔══██╗██║   ██║██╔════╝     ██╔══██╗██╔═══██╗██╔═══██╗██║     
███████║██║   ██║██║  ███╗    ██████╔╝██║   ██║██║   ██║██║     
██╔══██║╚██╗ ██╔╝██║   ██║    ██╔═══╝ ██║   ██║██║   ██║██║     
██║  ██║ ╚████╔╝ ╚██████╔╝    ██║     ╚██████╔╝╚██████╔╝███████╗
╚═╝  ╚═╝  ╚═══╝   ╚═════╝     ╚═╝      ╚═════╝  ╚═════╝ ╚══════╝
                                                                
*/
	

	SIZE avg_pool_size[] = { 512, 1, 1 };
	SIZE avg_pool_dim = 512 * 1 * 1;
	SIZE avg_pool_filter[] = { 7, 7 };
	SIZE avg_pool_stride[] = { 1, 1 };
	SIZE avg_pool_pad[] = { 0, 0 };
	avgpool_forward(scale5_block1_Residual_Add_Add_output, avg_pool_output, scale5_block0_B_conv2d_size, avg_pool_size, avg_pool_filter, avg_pool_stride, avg_pool_pad);

	_tprintf_("CHECKSUM: %lld \n", checksum(avg_pool_output, avg_pool_dim));
	
short int avg_pool_output_16bit[512 * 1 * 1];
	
	        //  print_data(avg_pool_output, 512, "./avg8bit.txt");
from8to16bit (avg_pool_output, avg_pool_output_16bit, avg_pool_dim, _QF_, 11);
     // print_data(avg_pool_output_16bit, 512, "./avg16bit.txt");
   //  for (int j=0;j<512;j++)
     //  printf("0x%04x \t 0x%04x \n",avg_pool_output[j], avg_pool_output_16bit[j]); 
        printf("CHECKavg: %lld \n", checksum_abs(avg_pool_output, avg_pool_dim));
     //   remove("/tmp/lockPL.neuraghe");
      // exit(0);
      
           
  /*
███████╗ ██████╗
██╔════╝██╔════╝
█████╗  ██║     
██╔══╝  ██║     
██║     ╚██████╗
╚═╝      ╚═════╝
                
*/         
           
           
	/*
	 * Fully-connected layer
	 * num outputs = 1000
	 * W 1000 x 512
	 * X 512 x 1
	 */
	SIZE xw_plus_b_MatMul_size[] = { 1000, 1, 1 };
	SIZE xw_plus_b_MatMul_dim = 1000;
	static short int xw_plus_b_MatMul_output[xw_plus_b_MatMul_dim];
	linear_fp16_forward(xw_plus_b_MatMul_param, avg_pool_output_16bit, xw_plus_b_MatMul_output, avg_pool_dim, xw_plus_b_MatMul_dim);
	
#define FIXED2FLOAT16bit(a) (((float) (a)) / (1<<11))
	// Convert output
	for(unsigned int i = 0; i < xw_plus_b_MatMul_dim; i++)
		results[i] = (float) FIXED2FLOAT16bit(xw_plus_b_MatMul_output[i]);

	
}

void free_platform(){
	munmap_soc(soc);
	free(soc);
}

