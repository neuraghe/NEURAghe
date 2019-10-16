/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 *                                                                            *
 * Project:     NEURAGHE - Accelerator for Convolutional neural network       *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/
#ifndef _LeNet_Batch_h
#define _LeNet_Batch_h

#include "neuconvnet.h"
#include "soc_drivers.h"

#define NEU_TCN

#define _IF_  36
#define _OF_  40
#define _IH_  30
#define _IW_  30
#define _DIL_ 1

#define _FS_ 7

#define _MAX_OG_     2
#define _MAX_OG_INC_ 1
#define _MAX_OG_MAX_ 2

#define PRECISION8 0

#define _STRIDE_ 1
#define _ZERO_PAD_ 0

#define READ_FILES

#if (_IH_ > 1) 
  #define _FS_h   _FS_
  #define _DIL_h  _DIL_ 
#else
  #define _FS_h     1
  #define _DIL_h    1
#endif

#if (_IW_ > 1)
  #define _FS_w   _FS_
  #define _DIL_w  _DIL_
#else
  #define _FS_w     1
  #define _DIL_w    1     
#endif

#ifdef NEU_TCN
  #define  _ws_size_  ((_FS_h*_FS_w) +1)
  #define _WS_SIZE_ _ws_size_
//  #if(_ws_size_ % 4)
//	  #define _WS_SIZE_ (_ws_size_ + 4 - (_ws_size_ % 4))
//  #else
//	  #define _WS_SIZE_ _ws_size_
//  #endif

  #define  _BIAS_POS_  (_FS_h*_FS_w)
#else
  #define _WS_SIZE_ 32
#endif

#if (PRECISION8==1)
	typedef char      DATA_CALC;
#else
	typedef short int DATA_CALC;
#endif

int round_if(int _if_, int n_col_, int fs_w){
  #ifdef NEU_TCN
  	_if_       = (_if_%(n_col_)) ? _if_+ n_col_-_if_%(n_col_) : _if_;
	#else
  	if (fs_w==3)
		  _if_       = (_if_%(n_col_*3)) ? _if_+ n_col_*3-_if_%(n_col_*3): _if_;
	  else
		  _if_       = (_if_%(n_col_)) ? _if_+ n_col_-_if_%(n_col_) : _if_;
  #endif
  
  return _if_;
}

int round_of(int _of_, int n_row_){

	(_of_%n_row_) ? _of_+ n_row_-_of_%n_row_: _of_;
	
	return _of_;
}


/*
//VGG LAYERS FLOOR
#define NLAYERS 9
int if_ [NLAYERS]      = {4  , 60 , 60 , 120, 120, 252, 252, 504, 504};
int of_ [NLAYERS]      = {60 , 60 , 120, 120, 252, 252, 504, 504, 504};
int ih_ [NLAYERS]      = {224, 224, 112, 112, 56 , 56 , 28 , 28 , 14};
int iw_ [NLAYERS]      = {224, 224, 112, 112, 56 , 56 , 28 , 28 , 14};
int max_mog_ [NLAYERS] = {18, 18, 40, 40, 50 , 50 , 50 , 60 , 60};
*/
/*
//VGG LAYERS CEIL
#define NLAYERS 9
int if_ [NLAYERS]      = {4  , 72 , 72 , 132, 132, 258, 258, 516, 516};
int of_ [NLAYERS]      = {72 , 72 , 132, 132, 258, 258, 516, 516, 516};
int ih_ [NLAYERS]      = {224, 224, 112, 112, 56 , 56 , 28 , 28 , 14};
int iw_ [NLAYERS]      = {224, 224, 112, 112, 56 , 56 , 28 , 28 , 14};
int max_mog_ [NLAYERS] = {18, 18, 40, 40, 50 , 50 , 50 , 60 , 60};
*/

/*
//VGG LAYERS
#define NLAYERS 9
int if_ [NLAYERS]      = {4  , 72 , 72 , 132, 132, 258, 258, 516, 516};
int of_ [NLAYERS]      = {64 , 64 , 128, 128, 256, 256, 512, 512, 512};
int ih_ [NLAYERS]      = {224, 224, 112, 112, 56 , 56 , 28 , 28 , 14};
int iw_ [NLAYERS]      = {224, 224, 112, 112, 56 , 56 , 28 , 28 , 14};
int max_mog_ [NLAYERS] = {18, 18, 40, 40, 50 , 50 , 50 , 60 , 60};
*/
/*
//RESNET LAYERS
#define NLAYERS 7
int if_ [NLAYERS]      = {66, 66 , 132, 132, 258, 258, 512};
int of_ [NLAYERS]      = {64, 128, 128, 256, 256, 512, 512};
int ih_ [NLAYERS]      = {56, 56 , 28 , 28 , 14 , 14 , 7};
int iw_ [NLAYERS]      = {56, 56 , 28 , 28 , 14 , 14 , 8};
int max_mog_ [NLAYERS] = {40, 40, 50 , 50 , 50 , 100 , 100};
*/
/*
//SQUEEZENET LAYERS
#define NLAYERS 25
int if_ [NLAYERS]      = {96, 24, 24, 132, 24, 24, 132, 36 , 36 , 258, 36 , 36 , 258, 48 , 48 , 384, 48 , 48 , 384, 72 , 72 , 516, 72 , 72 , 516 };
int of_ [NLAYERS]      = {24, 64, 64, 24 , 64, 64, 36 , 128, 128, 36 , 128, 128, 48 , 192, 192, 48 , 192, 192, 72 , 256, 256, 72 , 256, 256, 1000};
int ih_ [NLAYERS]      = {56, 56, 56, 56 , 56, 56, 56 , 56 , 56 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 14 , 14 , 14 , 14  };
int iw_ [NLAYERS]      = {56, 56, 56, 56 , 56, 56, 56 , 56 , 56 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 14 , 14 , 14 , 14  };
int max_mog_ [NLAYERS] = {40, 40, 40, 40 , 40, 40, 40 , 40 , 40 , 50 , 50 , 50 , 50 , 50 , 50 , 50 , 50 , 50 , 50 , 50 , 50 , 100, 100, 100, 100 };
*/


//ONE LAYER
#define NLAYERS 1
int if_ [NLAYERS]      = {_IF_};
int of_ [NLAYERS]      = {_OF_};
int ih_ [NLAYERS]      = {_IH_};
int iw_ [NLAYERS]      = {_IW_};
int max_mog_ [NLAYERS] = {_MAX_OG_MAX_};




void cnnMainInit(VARNAME load_data_dir);
void cnnMain(DATA* image, DATA* results);
void init_platform(char* bitstream);
void free_platform();




void preprocessing(DATA_CALC* pre, DATA_CALC* pre_out, unsigned int IW, unsigned int iw, unsigned int IH, unsigned int IF);

void postprocessing(DATA_CALC* post, DATA_CALC* post_out, unsigned int IW, unsigned int OW, unsigned int OH, unsigned int OF);


#endif
