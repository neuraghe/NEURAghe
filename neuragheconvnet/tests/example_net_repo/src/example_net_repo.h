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
 * File:        example_net_repo.h                                                  
 * Description: Auto generated project. Edit it as you like                   *
 *                                                                            *
 ******************************************************************************/
#ifndef _example_net_repo_
#define _example_net_repo_

#include "neuconvnet.h"
#include "soc_drivers.h"

#define NEU_TCN
#define PRECISION8 0

#define _STRIDE_ 1
#define _ZERO_PAD_ 0

#if (PRECISION8==1)
	typedef char      DATA_CALC;
#else
	typedef short int DATA_CALC;
#endif

#define _NCLUSTER_ 2

#define NLAYERS 2
int if_ 			[NLAYERS]     = {1,64};
int of_ 			[NLAYERS]     = {64,128};
int ih_ 			[NLAYERS]     = {4,16};
int iw_ 			[NLAYERS]     = {4,16};
int fs_				[NLAYERS][2]	= {{3,3},{3,3}};
int dil_			[NLAYERS][2]	= {{1,1},{1,1}};
int max_mog_ 	[NLAYERS] 		= {16,32};

unsigned int ws_size_set(unsigned int fs_h, unsigned int fs_w){
	#ifdef NEU_TCN
		int ws_size = (fs_h*fs_w) +1;
//		if (ws_size%4)
//			ws_size = (ws_size+4) - (ws_size%4);
	#else
		ws_size = 32;
	#endif
	
	return ws_size;
}

unsigned int wei_dim_set(unsigned int _if_, unsigned int _of_, unsigned int fs_h, unsigned int fs_w){
	
	int wei_dim;
	
	#ifdef NEU_TCN
		wei_dim = _of_ * _if_ * ws_size_set(fs_h, fs_w);
	#else
		#if _FS_ == 3
			wei_dim = _of_ * _if_ / 3 * ws_size_set(fs_h, fs_w);
		#else
			wei_dim = _of_ * _if_ * ws_size_set(fs_h, fs_w);
		#endif
	#endif
	
	return wei_dim;
}

unsigned int round_if(int _if_, unsigned int n_col_, unsigned int fs_w){
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

unsigned int round_of(unsigned int _of_, unsigned int n_row_){

	(_of_%n_row_) ? _of_+ n_row_-_of_%n_row_: _of_;
	
	return _of_;
}

DATA_CALC* padding(DATA_CALC* input, int _if_, unsigned int fs_h, unsigned int fs_w, unsigned int ih, unsigned int iw, unsigned int dil_h, unsigned int dil_w){
		
		unsigned int h,w;
		unsigned int pad_h = (fs_h -1)*dil_h/2; 
		unsigned int pad_w = (fs_w -1)*dil_w/2;
		
		DATA_CALC* input_padded = (DATA_CALC*)neu_DDRmalloc(_if_*iw*ih*sizeof(DATA_CALC));
		
		#ifdef _ZERO_PAD_
		for(h=0; h<ih; h++){
			for(w=0; w<iw; w++){
				if(w<pad_w || w>=iw-pad_w)
					input_padded[w + iw*h] = 0;
				else if(h<pad_h || h>=ih-pad_h)
					input_padded[w + iw*h] = 0;
				else
					input_padded[w + iw*h] = input[(w-pad_w) + (iw-2*pad_w)*(h-pad_h)];
			}
		}
		#else
		input_padded = input;
		#endif
		
		return input_padded;
}

void assign_pad(unsigned int pad[]){

	unsigned int _PAD_h, _PAD_w;
	
	#ifdef NEU_TCN
		_PAD_h = 0;
		_PAD_w = 0;
	#elif
	if(_ZERO_PAD_)
	    if(_FS_h==1)
	      _PAD_h = 0;
	    else
	      _PAD_h = (_FS_h-1)/2;
	   else
	    _PAD_h = 0;

	if(_ZERO_PAD_)
	    if(_FS_w==1)
	      _PAD_w = 0;
	    else
	      _PAD_w = (_FS_w-1)/2;
	   else
	    _PAD_w = 0;
	 #endif
	 
	 pad[0] = _PAD_h;
	 pad[1] = _PAD_w;
}

unsigned int adjust_win(unsigned int iw, unsigned int fs_w, unsigned int dil_w){
	
	unsigned int iw_out = iw;
		
	#ifdef NEU_TCN
		if(iw < (fs_w-1)*dil_w +4) {
			printf(RED "[ERROR] input width must be at least (KS-1)*dil + 4 !\n" NC);
	    exit(1);
		}
		while( (iw_out-((fs_w-1)*dil_w + 4))%4 )
			iw_out++;
	#else
		#ifdef PRECISION8
			while(iw_out%(4))
		  	iw_out++;
		#else
			while(iw_out%(2)) 
				iw_out++;
		#endif
	#endif
	
	return iw_out;
}

unsigned int adjust_wout(unsigned int dim, unsigned int fs, unsigned int dil){

	unsigned int ow;

	#ifdef NEU_TCN
		ow = dim -(fs-1)*dil;
	#else
		ow = dim -(fs-1)*(1-_ZERO_PAD_);
	#endif
	
	return ow/_STRIDE_;
}

void preprocessing(DATA_CALC* pre, DATA_CALC* pre_out, unsigned int IW, unsigned int iw, unsigned int IH, unsigned int IF){
  
  unsigned int in,i,j,k;
  
  for(in=0; in<IF;in++){
    for(i=0; i<IH; i++){
          for(j=0; j<IW; j++){
            pre_out[in*IH*iw + i*iw + j] = pre[in*IH*IW + i*IW + j];
          }
          for(k=0; k<iw-IW; k++)
            pre_out[in*IH*iw + i*iw + IW + k] = 0;
        }
      }
}

void postprocessing(DATA_CALC* post, DATA_CALC* post_out, unsigned int IW, unsigned int OW, unsigned int OH, unsigned int OF){
  
  unsigned int o,i,j;
  
  for(o=0; o<OF;o++){
        for(i=0; i<OH; i++){
          for(j=0; j<(OW-(OW-IW)); j++){
            post_out[o*OH*(OW-(OW-IW)) + i*(OW-(OW-IW)) + j] = post[o*OH*OW + i*OW + j];
          }
        }
      }
}


void cnnMainInit(VARNAME load_data_dir);
void cnnMain(DATA* image, DATA* results);
void init_platform(char* bitstream);
void free_platform();



#endif
