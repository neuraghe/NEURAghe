/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 *                 Gianfranco Deriu - gian.deriu@gmail.com                    *
 *                   Marco Carreras - marco.carreras@unica.it                 *
 *                     Paolo Meloni - paolo.meloni@unica.it                   *
 *                                                                            *
 * Project:     NEURAGHE - Accelerator for Convolutional neural network       *
 * File:        example_net_repo.cpp                                                
 * Description: Auto generated project. Edit it as you like                   *
 *                                                                            *
 ******************************************************************************/
#include "example_net_repo.h"
#include "assert.h"

SOCMAP socs[_NCLUSTER_]; // the number of cluster is defined in soc_drivers. ARRUBIU has two clusters, LOSA just one
DATA* wPointer;


SPATCONV conv_2d_3x3_0_param;
SPATCONV conv_2d_3x3_1_param;


/*
##########################
         INIT MAIN
##########################
*/

void cnnMainInit(VARNAME load_data_dir)
{
  // load_data_dir is the folder where to get the data
  printf("[cnnMainInit] Test net from the project example_net_repo!\n");
  
  _dprintf_(YELLOW "printed only if DEBUG=1 and RELEASE=0\n" NC);
  _tprintf_(GREEN "printed only if TIME=1\n" NC);
  _rprintf_("printed when RELEASE=0\n");
  _cprintf_(RED "printed when CI=1\n" NC);
  
  VARNAME filename;  
  
/*
 +-+-+-+-+-+ +-+
 |L|A|Y|E|R| |0|
 +-+-+-+-+-+ +-+
*/
  
	conv_2d_3x3_0_param = spatconv_create();
	
	conv_2d_3x3_0_param -> pout 			= round_of(of_[0],_N_ROW_);
	conv_2d_3x3_0_param -> pin				= round_if(if_[0],_N_COL_,fs_[0][1]);
	conv_2d_3x3_0_param -> kern_s[0] 	= conv_2d_3x3_0_param ->pout;
	conv_2d_3x3_0_param -> kern_s[1] 	= conv_2d_3x3_0_param ->pin;
	conv_2d_3x3_0_param -> kern_s[2] 	= fs_[0][0];
	conv_2d_3x3_0_param -> kern_s[3] 	= fs_[0][1];
	conv_2d_3x3_0_param -> maxog     	= max_mog_[0];
	conv_2d_3x3_0_param -> dil[0]    	= dil_[0][0];
	conv_2d_3x3_0_param -> dil[1]		 	= dil_[0][1];

	SIZE conv_2d_3x3_0_param_weidim = wei_dim_set(conv_2d_3x3_0_param->pout, conv_2d_3x3_0_param->pin, conv_2d_3x3_0_param->kern_s[2], conv_2d_3x3_0_param->kern_s[3]);
/*
 +-+-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+-+ +-+-+-+-+
 |I|N|S|E|R|T| |T|H|E| |R|I|G|H|T| |W|E|I|G|H|T| |F|I|L|E| |N|A|M|E|
 +-+-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+-+ +-+-+-+-+
*/

	printf ("Loading weights and biases... ");
	sprintf(filename, "%s/_Conv0_weights_.bin", load_data_dir);
	conv_2d_3x3_0_param -> kernel = (DATA_CALC*)neu_DDRmalloc(conv_2d_3x3_0_param_weidim*sizeof(DATA_CALC));
	load_fixed(filename, conv_2d_3x3_0_param_weidim, conv_2d_3x3_0_param -> kernel);


	
/*
 +-+-+-+-+-+ +-+
 |L|A|Y|E|R| |1|
 +-+-+-+-+-+ +-+
*/
  
	conv_2d_3x3_1_param = spatconv_create();
	
	conv_2d_3x3_1_param -> pout 			= round_of(of_[1],_N_ROW_);
	conv_2d_3x3_1_param -> pin				= round_if(if_[1],_N_COL_,fs_[1][1]);
	conv_2d_3x3_1_param -> kern_s[0] 	= conv_2d_3x3_1_param ->pout;
	conv_2d_3x3_1_param -> kern_s[1] 	= conv_2d_3x3_1_param ->pin;
	conv_2d_3x3_1_param -> kern_s[2] 	= fs_[1][0];
	conv_2d_3x3_1_param -> kern_s[3] 	= fs_[1][1];
	conv_2d_3x3_1_param -> maxog     	= max_mog_[0];
	conv_2d_3x3_1_param -> dil[0]    	= dil_[1][0];
	conv_2d_3x3_1_param -> dil[1]		 	= dil_[1][1];

	SIZE conv_2d_3x3_1_param_weidim = wei_dim_set(conv_2d_3x3_1_param->pout, conv_2d_3x3_1_param->pin, conv_2d_3x3_1_param->kern_s[2], conv_2d_3x3_1_param->kern_s[3]);
	
/*
 +-+-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+-+ +-+-+-+-+
 |I|N|S|E|R|T| |T|H|E| |R|I|G|H|T| |W|E|I|G|H|T| |F|I|L|E| |N|A|M|E|
 +-+-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+-+ +-+-+-+-+
*/

	printf ("Loading weights and biases... ");
	sprintf(filename, "%s/_Conv1_weights_.bin", load_data_dir);
	conv_2d_3x3_1_param -> kernel = (DATA_CALC*)neu_DDRmalloc(conv_2d_3x3_1_param_weidim*sizeof(DATA_CALC));
	load_fixed(filename, conv_2d_3x3_1_param_weidim, conv_2d_3x3_1_param -> kernel);


}




/*
##########################
         MAIN
##########################
*/

void cnnMain(DATA* image, float* results)
{
// the host application provides the image data and expects the results of the processing.
printf ("[cnnMain] Test net from the project example_net_repo!\n");

int conv_id[0];
bool activate  = false;

/*
 +-+-+-+-+-+ +-+
 |L|A|Y|E|R| |0|
 +-+-+-+-+-+ +-+
*/
/*
########################################
     SYNTHETIC INPUTS OR READ FROM FILE
########################################
*/
	unsigned int i,j,k;
	DATA_CALC* in;
	in = (DATA_CALC*)socs[0]->in;
	for (j=0; j<conv_2d_3x3_0_param->pin; j++){
			if(j<if_[0])
				for (i=0;i<ih_[0]*iw_[0];i++)
							in[i+j*ih_[0]*iw_[0]]= rand()%127;
			else
				for (i=0;i<ih_[0]*iw_[0];i++)
							in[i+j*ih_[0]*iw_[0]]= 0;
	}
	
	for (j=0; j<conv_2d_3x3_0_param->pin; j++){
				for (i=0;i<ih_[0];i++){
					for (k=0; k<iw_[0]; k++){
							printf("%d\t",in[k + i*iw_[0] + j*ih_[0]*iw_[0]]);
							}
					printf("\n");
					}
			printf("\n");
			}
	
/*
##########################
  INPUT DIMS AFTER PADDING
##########################
*/
	
	unsigned int in_0_size_pad [2] = {ih_[0]+(conv_2d_3x3_0_param->kern_s[2]-1)*conv_2d_3x3_0_param->dil[0], 
																	iw_[0]+(conv_2d_3x3_0_param->kern_s[3]-1)*conv_2d_3x3_0_param->dil[1]	};
	
/*
##########################
     INPUT PADDED
##########################
*/
	DATA* in_0_pad = padding(	in, 
													conv_2d_3x3_0_param->pin, 
													conv_2d_3x3_0_param->kern_s[2], 
													conv_2d_3x3_0_param->kern_s[3], 
													in_0_size_pad [0], 
													in_0_size_pad [1], 
													conv_2d_3x3_0_param->dil[0], 
													conv_2d_3x3_0_param->dil[0] );
											

	for (j=0; j<conv_2d_3x3_0_param->pin*in_0_size_pad [0]*in_0_size_pad [1]; j++){
		printf("%d\t",in_0_pad[j]);
	}
	
	printf("\ninput padded\n");												
	for (j=0; j<conv_2d_3x3_0_param->pin; j++){
			for (i=0;i<in_0_size_pad [0];i++){
				for (k=0; k<in_0_size_pad [1]; k++){
						printf("%d\t",in_0_pad[k + i*in_0_size_pad [1] + j*in_0_size_pad [0]*in_0_size_pad [1]]);
						}
				printf("\n");
				}
		printf("\n");
		}
													
/*
####################################################
   INPUT SIZE ADJUSTMENT TO PREVENT ODD DIMENSIONS
####################################################
*/

	unsigned int conv_2d_3x3_0_in_size  [3];
	unsigned int conv_2d_3x3_0_out_size [3];
	
	conv_2d_3x3_0_in_size	[0] = conv_2d_3x3_0_param -> pin;
	conv_2d_3x3_0_in_size [1] = in_0_size_pad[0];
	conv_2d_3x3_0_in_size [2] = adjust_win(in_0_size_pad [1], fs_[0][1], dil_[0][1]);
	
	SIZE stride_0_[2] = {_STRIDE_,_STRIDE_};
	unsigned int pad_0_[2];
	assign_pad(pad_0_);
	
/*
################################################################
   PREPROCESSING: ADD ZERO COL TO ARRANGE INPUTS FOR ARCH. 2.0
################################################################
*/
	
  DATA_CALC *in_0_pre = (DATA_CALC*)neu_DDRmalloc(conv_2d_3x3_0_param->pin*in_0_size_pad [0]*in_0_size_pad [1]*sizeof(DATA_CALC));
  
	preprocessing(in_0_pad, in_0_pre, in_0_size_pad [1], conv_2d_3x3_0_in_size [2], in_0_size_pad [0], conv_2d_3x3_0_param->pin);

/*
########################
   INPUT REASSIGNMENT
########################
*/	
	in_0_pre = (DATA_CALC*) socs[0]->in;
	
/*
##########################################
   OUTPUT DIMS AFTER CONV: IN_DIM - PADD
##########################################
*/
	
	conv_2d_3x3_0_out_size [0] = conv_2d_3x3_0_param -> pout;
	conv_2d_3x3_0_out_size [1] = adjust_wout(conv_2d_3x3_0_in_size [1], fs_[0][0], dil_[0][0]);
	conv_2d_3x3_0_out_size [2] = adjust_wout(conv_2d_3x3_0_in_size [2], fs_[0][1], dil_[0][1]);
	
/*
################
   CONVOLUTION
################
*/

	conv_id[0] = spatconv_forward_hw(conv_2d_3x3_0_param, socs[0]->in, socs[0]->out, socs[0], (SIZE*)conv_2d_3x3_0_in_size, (SIZE*)conv_2d_3x3_0_out_size, stride_0_, pad_0_, 		activate, _QF_, PRECISION8);
	
	spatconv_wait(socs[0], conv_id[0]);
	
/*
####################################################################
   POSTPROCESSING: DELETE ZERO COL TO ARRANGE INPUTS FOR ARCH. 2.0
####################################################################
*/
	
	DATA_CALC* out_0_post = (DATA_CALC*)neu_DDRmalloc(conv_2d_3x3_0_param->pout*conv_2d_3x3_0_out_size [1]*conv_2d_3x3_0_out_size [2]*sizeof(DATA_CALC));
	
	postprocessing(socs[0]->out, out_0_post, iw_[0],conv_2d_3x3_0_out_size [2], conv_2d_3x3_0_out_size [1],conv_2d_3x3_0_param->pout);
	
	conv_2d_3x3_0_out_size [2] = iw_[0];
	
/*
########################
   OUTPUT REASSIGNMENT
########################
*/	
	out_0_post = (DATA_CALC*) socs[0]->out;
	

/*	
 +-+-+-+-+-+-+-+ +-+
 |P|O|O|L|I|N|G| |O|
 +-+-+-+-+-+-+-+ +-+
*/

SIZE pool_0_2x2_dim		 				= conv_2d_3x3_0_param->pout * ih_[0] * iw_[0];
DATA_CALC* pool_0_out 				= (DATA_CALC*)neu_DDRmalloc(pool_0_2x2_dim*sizeof(DATA_CALC));
SIZE pool_0_2x2_size[] 				= {conv_2d_3x3_0_param->pout, ih_[0], iw_[0]};
SIZE pool_0_max_pool_filter[] = { 2, 2 };
SIZE pool_0_max_pool_stride[] = { 2, 2 };
SIZE pool_0_max_pool_pad[] 		= { 1, 1 };

maxpool_fp16_forward(socs[0]->out, pool_0_out, conv_2d_3x3_0_out_size, pool_0_2x2_size, pool_0_max_pool_filter, pool_0_max_pool_stride, pool_0_max_pool_pad);


/*
 +-+-+-+-+-+ +-+
 |L|A|Y|E|R| |1|
 +-+-+-+-+-+ +-+
*/
	
/*
##########################
  INPUT DIMS AFTER PADDING
##########################
*/
	
	unsigned int in_1_size_pad [2] = {ih_[0]+(conv_2d_3x3_1_param->kern_s[2]-1)*conv_2d_3x3_1_param->dil[0], 
																	iw_[0]+(conv_2d_3x3_1_param->kern_s[3]-1)*conv_2d_3x3_1_param->dil[1]	};
	
/*
##########################
     INPUT PADDED
##########################
*/
	DATA* in_1_pad = padding(	in, 
													conv_2d_3x3_1_param->pin, 
													conv_2d_3x3_1_param->kern_s[2], 
													conv_2d_3x3_1_param->kern_s[3], 
													in_1_size_pad [0], 
													in_1_size_pad [1], 
													conv_2d_3x3_1_param->dil[0], 
													conv_2d_3x3_1_param->dil[0] );
													
/*
####################################################
   INPUT SIZE ADJUSTMENT TO PREVENT ODD DIMENSIONS
####################################################
*/

	unsigned int conv_2d_3x3_1_in_size  [3];
	unsigned int conv_2d_3x3_1_out_size [3];
	
	conv_2d_3x3_1_in_size	[0] = conv_2d_3x3_1_param -> pin;
	conv_2d_3x3_1_in_size [1] = in_1_size_pad[0];
	conv_2d_3x3_1_in_size [2] = adjust_win(in_1_size_pad[1], fs_[0][1], dil_[0][1]);
	
	SIZE stride_1_[2] = {_STRIDE_,_STRIDE_};
	unsigned int pad_1_[2];
	assign_pad(pad_1_);
	
/*
################################################################
   PREPROCESSING: ADD ZERO COL TO ARRANGE INPUTS FOR ARCH. 2.0
################################################################
*/
	
  DATA_CALC *in_1_pre = (DATA_CALC*)neu_DDRmalloc(conv_2d_3x3_1_param->pin*in_1_size_pad [0]*in_1_size_pad [1]*sizeof(DATA_CALC));
  
	preprocessing(in_1_pad, in_1_pre, in_1_size_pad [1], conv_2d_3x3_1_in_size [2], in_1_size_pad [0], conv_2d_3x3_1_param->pin);

/*
#######################
   INPUT REASSIGNMENT
#######################
*/	
	in_1_pre = (DATA_CALC*) socs[0]->in;
	
/*
##########################################
   OUTPUT DIMS AFTER CONV: IN_DIM - PADD
##########################################
*/
	
	conv_2d_3x3_1_out_size [0] = conv_2d_3x3_1_param -> pout;
	conv_2d_3x3_1_out_size [1] = adjust_wout(conv_2d_3x3_1_in_size [1], fs_[0][0], dil_[0][0]);
	conv_2d_3x3_1_out_size [2] = adjust_wout(conv_2d_3x3_1_in_size [2], fs_[0][1], dil_[0][1]);
	
/*
################
   CONVOLUTION
################
*/

	conv_id[0] = spatconv_forward_hw(conv_2d_3x3_1_param, socs[0]->in, socs[0]->out, socs[0], (SIZE*)conv_2d_3x3_1_in_size, (SIZE*)conv_2d_3x3_1_out_size, stride_1_, pad_1_, 		activate, _QF_, PRECISION8);
	
	spatconv_wait(socs[0], conv_id[0]);
	
/*
####################################################################
   POSTPROCESSING: DELETE ZERO COL TO ARRANGE INPUTS FOR ARCH. 2.0
####################################################################
*/
	
	DATA_CALC* out_1_post = (DATA_CALC*)neu_DDRmalloc(conv_2d_3x3_1_param->pout*conv_2d_3x3_1_out_size [1]*conv_2d_3x3_1_out_size [2]*sizeof(DATA_CALC));
	
	postprocessing(socs[0]->out, out_1_post, iw_[0],conv_2d_3x3_1_out_size [2], conv_2d_3x3_1_out_size [1],conv_2d_3x3_1_param->pout);
	
	conv_2d_3x3_1_out_size [2] = iw_[0];
	
/*
########################
   OUTPUT REASSIGNMENT
########################
*/	
	out_1_post = (DATA_CALC*) socs[0]->out;
	

/*	
 +-+-+-+-+-+-+-+ +-+
 |P|O|O|L|I|N|G| |O|
 +-+-+-+-+-+-+-+ +-+
*/

SIZE pool_1_2x2_dim		 				= conv_2d_3x3_1_param->pout * ih_[0] * iw_[0];
DATA_CALC* pool_1_out 				= (DATA_CALC*)neu_DDRmalloc(pool_1_2x2_dim*sizeof(DATA_CALC));
SIZE pool_1_2x2_size[] 				= {conv_2d_3x3_1_param->pout, ih_[0], iw_[0]};
SIZE pool_1_max_pool_filter[] = { 2, 2 };
SIZE pool_1_max_pool_stride[] = { 2, 2 };
SIZE pool_1_max_pool_pad[] 		= { 1, 1 };

maxpool_fp16_forward(socs[0]->out, pool_1_out, conv_2d_3x3_1_out_size, pool_1_2x2_size, pool_1_max_pool_filter, pool_1_max_pool_stride, pool_1_max_pool_pad);

//insert a FC layer

exit(0);
}






/*
##########################
         STUFF
##########################
*/

// the following function initializes the soc(s).
void init_platform(char* bitstream){ // called in codes/modnet2/src/app/neuconvnet.cpp
  init_soc(socs, &wPointer, _MAXMEM_, 0, bitstream);
}

void free_platform(){
  munmap_soc(socs);
  int i;	
  for (i=0; i<_NCLUSTER_; i++)
    free(socs[i]);
}

