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
#include "conv_test.h"

#include "assert.h"

#include <sys/time.h>
#include <time.h>



SOCMAP socs[2];
DATA* wPointer;


SPATCONV conv_params_hw;
SPATCONV conv_params_sw;
int n_weights;

// if you are using a bitstream that works at a different frequency than the target one you can adjust the performance measurement with a scale factor (Target_freq/actual_freq)
#define FREQ_SCALE_FACTOR (140/20)



void cnnMainInit(VARNAME load_data_dir)
{
	unsigned int o,i,j,k;
	printf("Init!\n");

	printf("\nIF:%d OF:%d max_OG:%d\n\n",_IF_,_OF_,_MAX_OG_);
	
	VARNAME filename;
	
//INITIALIZATION FOR HW PARAMETERS
	
	conv_params_hw = spatconv_create();				//create a spatconv struct for hw parameters

  // Round the number of OF to the upper N_ROW multiple
	//conv_params_hw->pout = (_OF_%_N_ROW_) ? _OF_+ _N_ROW_-_OF_%_N_ROW_: _OF_;
	
	conv_params_hw->pout = round_of(_OF_,_N_ROW_);
	
  // Round the number of OF to the upper N_COL multiple for FS==5 or N_COL*3 multiple for FS==3
//  #ifdef NEU_TCN
//    conv_params_hw->pin       = (_IF_%(_N_COL_)) ? _IF_+ _N_COL_-_IF_%(_N_COL_) : _IF_;
//  #else
//	  if (_FS_==3)
//		  conv_params_hw->pin       = (_IF_%(_N_COL_*3)) ? _IF_+ _N_COL_*3-_IF_%(_N_COL_*3): _IF_;
//	  else
//		  conv_params_hw->pin       = (_IF_%(_N_COL_)) ? _IF_+ _N_COL_-_IF_%(_N_COL_) : _IF_;
//  #endif

	conv_params_hw->pin = round_if(_IF_,_N_COL_,_FS_);
  
	conv_params_hw->kern_s[0] = conv_params_hw->pout;
	conv_params_hw->kern_s[1] = conv_params_hw->pin;
	conv_params_hw->kern_s[2] = _FS_h;
	conv_params_hw->kern_s[3] = _FS_w;
	conv_params_hw->maxog     = _MAX_OG_;
	conv_params_hw->dil[0]    = _DIL_h;
	conv_params_hw->dil[1]    = _DIL_w;
	
	#ifdef NEU_TCN
		n_weights        = conv_params_hw->pout*conv_params_hw->pin*_WS_SIZE_;
	#else
		#if _FS_ == 3
			n_weights        = conv_params_hw->pout*conv_params_hw->pin/3*_WS_SIZE_;
		#else
			n_weights        = conv_params_hw->pout*conv_params_hw->pin*_WS_SIZE_;
		#endif
	#endif


//INITIALIZATION FOR SW PARAMETERS

	conv_params_sw = spatconv_create();

	conv_params_sw->pout      = _OF_;
	conv_params_sw->pin       = _IF_;   //rounded in spatconv_sw
	conv_params_sw->kern_s[0] = _OF_;
	conv_params_sw->kern_s[1] = _IF_;
	conv_params_sw->kern_s[2] = _FS_h;
	conv_params_sw->kern_s[3] = _FS_w;
	conv_params_sw->maxog     = _MAX_OG_;
	conv_params_sw->dil[0]    = _DIL_h;
	conv_params_sw->dil[1]    = _DIL_w;

//WEIGHT AND BIAS SW ARRAY INITIALIZATION
	SIZE conv_wei_dim = conv_params_sw->pout * conv_params_sw->pin * conv_params_sw->kern_s[2] * conv_params_sw->kern_s[3];
	static DATA * conv_wei_array;
	conv_wei_array = (DATA*) neu_DDRmalloc (conv_wei_dim * sizeof (DATA));

	SIZE conv_bias_dim = conv_params_sw->pout;
	static DATA * conv_bias_array;
  conv_bias_array = (DATA*) malloc (conv_bias_dim * sizeof (DATA));

	printf("conv params!\n");

/*
██╗      ██████╗  █████╗ ██████╗     ███████╗██████╗  ██████╗ ███╗   ███╗    ███████╗██╗██╗     ███████╗
██║     ██╔═══██╗██╔══██╗██╔══██╗    ██╔════╝██╔══██╗██╔═══██╗████╗ ████║    ██╔════╝██║██║     ██╔════╝
██║     ██║   ██║███████║██║  ██║    █████╗  ██████╔╝██║   ██║██╔████╔██║    █████╗  ██║██║     █████╗  
██║     ██║   ██║██╔══██║██║  ██║    ██╔══╝  ██╔══██╗██║   ██║██║╚██╔╝██║    ██╔══╝  ██║██║     ██╔══╝  
███████╗╚██████╔╝██║  ██║██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚═╝ ██║    ██║     ██║███████╗███████╗
╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝    ╚═╝     ╚═╝╚══════╝╚══════╝
                                                                                                        
*/


#ifdef READ_FILES
  printf ("Loading weights and biases... ");
	sprintf(filename, "%s/weights_array_file_hw.bin", load_data_dir);
	load_fixed(filename, n_weights, wPointer);
  
	sprintf(filename, "%s/weights_array_file", load_data_dir);
	load_fixed(filename,conv_wei_dim,conv_wei_array);

	sprintf(filename, "%s/bias_array_file", load_data_dir);
	load_fixed(filename,conv_bias_dim,conv_bias_array);

	conv_params_hw->kernel = wPointer;
	conv_params_sw->kernel = conv_wei_array;
	conv_params_sw->bias   = conv_bias_array;

#ifndef NEU_TCN
	char *pesi  = (char*)malloc(_OF_*_IF_*27*sizeof(char));
	char *bias8 = (char*)malloc(_OF_*sizeof(char));

	 if(PRECISION8){
	  if(_FS_ == 3){ 
		  for(o=0; o<_OF_; o++){
			  for(i=0; i<_IF_/3; i++){
				  for(j=0; j<27; j++){
					  pesi[j + i*27 + o*_IF_/3*27] = conv_params_sw->kernel[j + i*27 + o*_IF_/3*27];
				  }
			  }
			  bias8[o] = conv_params_sw->bias[o];
		  }
		  }
		  else{
		  for(o=0; o<_OF_; o++){
		    for(i=0; i<_IF_; i++){
			    for(j=0; j<25; j++){
				    pesi[j + i*25 + o*_IF_*25] = conv_params_sw->kernel[j + i*25 + o*_IF_*25];
				  }
			  }
			  bias8[o] = conv_params_sw->bias[o];
		  }
	  }
		conv_params_sw->kernel = (DATA*)pesi;
		conv_params_sw->bias   = (DATA*)bias8;
	}
#endif
  printf ("Done!\n");
  

#else

/*
██╗    ██╗███████╗██╗ ██████╗ ██╗  ██╗████████╗███████╗
██║    ██║██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝██╔════╝
██║ █╗ ██║█████╗  ██║██║  ███╗███████║   ██║   ███████╗
██║███╗██║██╔══╝  ██║██║   ██║██╔══██║   ██║   ╚════██║
╚███╔███╔╝███████╗██║╚██████╔╝██║  ██║   ██║   ███████║
 ╚══╝╚══╝ ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
*/

//NOTE: the hw weights arrangement is very different than the sw arrangement.
//The code snippet below doesn't take it into account so sw and hw result could be very different
// in hw weights and biased are in the same structure

       for (i=0;i<n_weights;i++){ // HW
          wPointer[i]=0x0;
        }
        
        for (i=0;i<conv_bias_dim;i++){ // SW
          conv_bias_array[i]=0x0;
        }
        
        for (i=0;i<conv_wei_dim;i++){ // SW
          conv_wei_array[i]=0x0;
        }


        // the only filter that has the same arrangement in the two cases is the first.
        //You can put all the filters to 0 and only this to a non-zero value to perform simple tests.
        wPointer[4]       = 0x100;
        conv_wei_array[4] = 0x100;


        conv_params_hw->kernel = wPointer;
        
        conv_params_sw->kernel = conv_wei_array;
        conv_params_sw->bias   = conv_bias_array;


#endif

printf("load files!\n");
}



/*
##########################
        CNN MAIN
##########################
*/

void cnnMain(DATA* image, float* results)
{
  srand(time(NULL));
  
  unsigned int _OW_ = _IW_-(_FS_w-1)*_DIL_w*(1-_ZERO_PAD_)*(1-!(_IW_>1));
  unsigned int _OH_ = _IH_-(_FS_h-1)*_DIL_h*(1-_ZERO_PAD_)*(1-!(_IH_>1));
        
  SOCMAP soc = socs[0];

  int _ih_ = _IH_;
  int _iw_ = _IW_;

  if (getenv("_IH_")){
    printf ("getting _IH_ from env\n");
    _ih_=atoi(getenv("_IH_"));
    ih_[0]=_ih_;
  }
  
  if (getenv("_IW_")){
    printf ("getting _IW_ from env\n");
    _iw_=atoi(getenv("_IW_"));
    iw_[0]=_iw_;
  }
  
  SIZE conv_dim = _OF_ * _OH_ * _OW_;
  
//ARRANGE PADDING PARAMS ACCORDING TO ZERO PAD ACTIVATION
 
  unsigned int _PAD_h, _PAD_w;    

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

//ARRANGE IN_WIDTH PARAM ACCORDING TO DATA PRECISION

  unsigned int iw = _iw_;
  
	if(PRECISION8){
		while(iw%(4))
          	iw++;
	}
	else{
		while(iw%(2)) 
			iw++;
	}
	
//ARRANGE OUT_WIDTH PARAM ACCORDING TO LAYER PARAMS

	unsigned int ow = iw - (_FS_w-1)*_DIL_w*(1-_ZERO_PAD_)*(1-!(iw>1));


//REDIRECTING HW PARAMS

	unsigned int in_s  [3];
	unsigned int out_s [3];
	
	in_s  [0] = conv_params_hw->pin;
	in_s  [1] = _ih_;
	in_s  [2] = iw;
	
	out_s [0] =conv_params_hw->pout;
	out_s [1] =_OH_/_STRIDE_;
	out_s [2] =ow/_STRIDE_;
	
	SIZE stride[2] = {_STRIDE_,_STRIDE_};
	SIZE pad   [2] = {_PAD_h,_PAD_w};
	bool activate  = false;

//REDIRECTING SW PARAMS

	unsigned int in_s_sw  [3] ;
	unsigned int out_s_sw [3] ;
  
  in_s_sw  [0] =_IF_;
  in_s_sw  [1] =_ih_;
  in_s_sw  [2] = iw;                   //also the IFs that feed the spatconv sw are preprocessed, unnecessarily, but so are
  
  out_s_sw [0] = _OF_;
  out_s_sw [1] = _OH_/_STRIDE_;
  out_s_sw [2] = ow/_STRIDE_;
        
	DATA *output = (DATA*)malloc(_OF_*_OH_*ow*sizeof(DATA_CALC));
//DATA *input  = (DATA*)malloc(_OF_*_ih_*iw*sizeof(DATA_CALC));

	int conv_id[2];
	printf("Main!\n");
	
	
	
	
/*
 █████╗  ██████╗████████╗██╗██╗   ██╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔════╝╚══██╔══╝██║██║   ██║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
███████║██║        ██║   ██║██║   ██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔══██║██║        ██║   ██║╚██╗ ██╔╝██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║  ██║╚██████╗   ██║   ██║ ╚████╔╝ ██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝  ╚═══╝  ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
	SYNTHETIC
 */

	unsigned int i, j, k, o;
        
	DATA_CALC * in;
	in = (DATA_CALC *) soc->in;     //in of the struct soc is defined as a short int pointer
	for (j=0;j<_IF_;j++){
		for (i=0;i<_ih_*_iw_;i++){
				in[i+j*_ih_*_iw_]= rand()%127;//(( i+1)*0x10)%256; // //
				                   //i+j*_ih_*_iw_;
		}
	}


/*
  _____                                            _             
 |  __ \                                          (_)            
 | |__) | __ ___ _ __  _ __ ___   ___ ___  ___ ___ _ _ __   __ _ 
 |  ___/ '__/ _ \ '_ \| '__/ _ \ / __/ _ \/ __/ __| | '_ \ / _` |
 | |   | | |  __/ |_) | | | (_) | (_|  __/\__ \__ \ | | | | (_| |
 |_|   |_|  \___| .__/|_|  \___/ \___\___||___/___/_|_| |_|\__, |
                | |                                         __/ |
                |_|                                        |___/ 
INPUT PROCESSING TO AVOID SOME ODD DIMENSION
*/

	_tcreate_(time);

	DATA_CALC *input = (DATA_CALC*)malloc(_IF_*_ih_*iw*sizeof(DATA_CALC));

	preprocessing(in, input, _iw_, iw, _ih_, _IF_);

	_tprintf_("\npreprocessing time: %5.3f ms\n", (get_wall_time()-time)/1000);

 // move the preprocessed input pixel back to the input vector
 
	for (i=0;i<_IF_*_ih_*iw;i++){
		in[i]= input[i];
	}

// As a check put the memory locations for the yout values to an uncommon non zero value (say 0x0101)

  for (i=0;i<_OF_*_OH_*ow;i++){
    soc->out[i]=0x0101;
  }





  /*

  ██╗      █████╗ ██╗   ██╗███████╗██████╗ ███████╗    ██╗      ██████╗  ██████╗ ██████╗ 
  ██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝    ██║     ██╔═══██╗██╔═══██╗██╔══██╗
  ██║     ███████║ ╚████╔╝ █████╗  ██████╔╝███████╗    ██║     ██║   ██║██║   ██║██████╔╝
  ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗╚════██║    ██║     ██║   ██║██║   ██║██╔═══╝ 
  ███████╗██║  ██║   ██║   ███████╗██║  ██║███████║    ███████╗╚██████╔╝╚██████╔╝██║     
  ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝    ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     
                                                                                         
  */


  //printf("\n size data calc :%d\n",sizeof(DATA_CALC));

  //print_data(conv_params_hw->kernel, n_weights, "w_test.txt");
  //print_data(soc->in, _IF_ * _ih_ * _iw_, "x_test.txt");
  
  _tprintf_("FREQ_SCALE_FACTOR: %d\n", FREQ_SCALE_FACTOR);
  _tprintf_("\n\nIF\tOF\tIH\tIW\tmax_OG\tt[ms]\tGOps\tGOpss\tt/[ms]\tGOpss\n");


  int mog;
  int l;

  // see the arrays defined in the header
  for (l=0;l<NLAYERS;l++){

    conv_params_hw->pout= of_[l];
    conv_params_hw->pin= if_[l];
    conv_params_hw->kern_s[0] = of_[l];
    conv_params_hw->kern_s[1] = if_[l];

    in_s  [0] = conv_params_hw->pin;
    in_s  [1] = ih_[l];
    in_s  [2] = iw_[l];
      
    out_s [0] = conv_params_hw->pout;
    out_s [1] = ih_[l] - (_FS_w-1)*_DIL_w*(1-_ZERO_PAD_)*(1-!(ih_[l]>1));
    out_s [2] = iw_[l] - (_FS_w-1)*_DIL_w*(1-_ZERO_PAD_)*(1-!(iw_[l]>1));
      
    float min_t=0;
    int maxog_min_t=0;

    long long int ops  = (long long int)of_[l]*(long long int)if_[l]*(long long int)ih_[l]*(long long int)iw_[l]*(long long int)(_FS_*_FS_*2);
    //printf("%lld\t%ld\t%ld\t%ld\t%ld\t\n", ops,of_[l],if_[l],ih_[l],iw_[l]);
    double gops = (double)ops/1000000000;
    double gopss;

    /*

    ███╗   ███╗ █████╗ ██╗  ██╗ ██████╗  ██████╗     ██╗      ██████╗  ██████╗ ██████╗ 
    ████╗ ████║██╔══██╗╚██╗██╔╝██╔═══██╗██╔════╝     ██║     ██╔═══██╗██╔═══██╗██╔══██╗
    ██╔████╔██║███████║ ╚███╔╝ ██║   ██║██║  ███╗    ██║     ██║   ██║██║   ██║██████╔╝
    ██║╚██╔╝██║██╔══██║ ██╔██╗ ██║   ██║██║   ██║    ██║     ██║   ██║██║   ██║██╔═══╝ 
    ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗╚██████╔╝╚██████╔╝    ███████╗╚██████╔╝╚██████╔╝██║     
    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     
                                                                                       
    */


    for(mog= _MAX_OG_; mog <= max_mog_[l]; mog=mog+_MAX_OG_INC_){
      conv_params_hw->maxog     = mog;
      _tcreate_(time_hw);


      /*
      ██╗  ██╗██╗    ██╗     ██████╗ ██████╗ ███╗   ██╗██╗   ██╗
      ██║  ██║██║    ██║    ██╔════╝██╔═══██╗████╗  ██║██║   ██║
      ███████║██║ █╗ ██║    ██║     ██║   ██║██╔██╗ ██║██║   ██║
      ██╔══██║██║███╗██║    ██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝
      ██║  ██║╚███╔███╔╝    ╚██████╗╚██████╔╝██║ ╚████║ ╚████╔╝ 
      ╚═╝  ╚═╝ ╚══╝╚══╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  
                                                                
      */
      
      //rounding dimension readed from conv_test.h
      
      if(PRECISION8)
        while(in_s [2] % 4) in_s[2]++;
      else
        while(in_s [2] % 2) in_s[2]++;
      
      out_s [2] = in_s[2] - (_FS_w-1)*_DIL_w*(1-_ZERO_PAD_)*(1-!(in_s[2]>1));

      conv_id[0] = spatconv_forward_hw(conv_params_hw, socs[0]->in, socs[0]->out, socs[0], (SIZE*)in_s, (SIZE*)out_s, stride, pad, activate, _QF_, PRECISION8);
      //conv_id[1] = spatconv_forward_hw(conv_params_hw, socs[1]->in, socs[1]->out, socs[1], (SIZE*)in_s, (SIZE*)out_s, stride, pad, activate, _QF_, PRECISION8);

      spatconv_wait(socs[0], conv_id[0]);
      //spatconv_wait(socs[1], conv_id[1]);

      float t = get_wall_time()-time_hw;

      if (mog== _MAX_OG_){
        min_t=t;
        maxog_min_t=mog;
      }
      else if (t<min_t){ // find the best value for MAXOG
        min_t=t;
        maxog_min_t=mog;
      }
      gopss = gops*1000*1000/min_t;
      //if (mog== max_mog_[l])
      _tprintf_("%d\t%d\t%d\t%d\t%d\t%5.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f\n", in_s  [0], out_s [0], in_s  [1], in_s  [2], maxog_min_t, (min_t)/1000,gops, gopss,(min_t)/(FREQ_SCALE_FACTOR*1000),gopss*FREQ_SCALE_FACTOR);
    } // maxog loop
  }// layers loop
  




  /*
  ███████╗██╗    ██╗     ██████╗ ██████╗ ███╗   ██╗██╗   ██╗
  ██╔════╝██║    ██║    ██╔════╝██╔═══██╗████╗  ██║██║   ██║
  ███████╗██║ █╗ ██║    ██║     ██║   ██║██╔██╗ ██║██║   ██║
  ╚════██║██║███╗██║    ██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝
  ███████║╚███╔███╔╝    ╚██████╗╚██████╔╝██║ ╚████║ ╚████╔╝ 
  ╚══════╝ ╚══╝╚══╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  
                                                            
  */
  

 
 /* for (i=0;i<_IF_*_ih_*iw;i++){
		if (soc->in[i]!= input[i])
		  printf("INPUT CORRUPTED!!!!  [%d] %x %x\n", i, soc->in[i], input[i]);
	}*/
  
	_tprintf_("\n\nSoftware conv...\n\n");
	spatconv_forward_sw(conv_params_sw, /*soc->in*/(short int*)input, output, (SIZE*)in_s_sw, (SIZE*)out_s_sw, stride, pad, activate,_N_COL_, _QF_,PRECISION8);
     
  _tprintf_("\n\nSoftware conv done\n\n");   


	DATA_CALC* out_sw = (DATA_CALC*) output;	
	DATA_CALC* out_hw = (DATA_CALC*) soc->out;

/*
                  _                                     _             
  _ __   ___  ___| |_ _ __  _ __ ___   ___ ___  ___ ___(_)_ __   __ _ 
 | '_ \ / _ \/ __| __| '_ \| '__/ _ \ / __/ _ \/ __/ __| | '_ \ / _` |
 | |_) | (_) \__ \ |_| |_) | | | (_) | (_|  __/\__ \__ \ | | | | (_| |
 | .__/ \___/|___/\__| .__/|_|  \___/ \___\___||___/___/_|_| |_|\__, |
 |_|                 |_|                                        |___/ 
*/
	

	DATA_CALC* out_sw_post = (DATA_CALC*)malloc(_OF_*_OH_*_OW_*sizeof(DATA_CALC));

	postprocessing(out_sw, out_sw_post, _OW_, ow, _OH_, _OF_);
	  
	_tcreate_(time2);

	DATA_CALC* out_hw_post = (DATA_CALC*)malloc(_OF_*_OH_*_OW_*sizeof(DATA_CALC));

	postprocessing(out_hw, out_hw_post, _OW_, ow, _OH_, _OF_);

	_tprintf_("\npostprocessing time: %5.3f ms\n", (get_wall_time()-time2)/1000);






printf ("soc->in %x\n",soc->in);
printf ("soc->out %x\n",soc->out);
printf ("soc->ddr_addr %x\n",soc->ddr_addr);

/*
 ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗
██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝
██║     ███████║█████╗  ██║     █████╔╝ 
██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ 
╚██████╗██║  ██║███████╗╚██████╗██║  ██╗
 ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝
                                        
*/


	int checksum_hw=0, checksum_sw=0;
	int e=0;
	#define MAXERR 1000
	#define MAXCOR 10
        
	DATA_CALC * sw_out;
	DATA_CALC * hw_out;
        
	sw_out = (DATA_CALC *) /*output*/ out_sw_post;
	hw_out = (DATA_CALC *) /*soc->out*/ out_hw_post;



        for (i=0; i<conv_dim/(stride[0]*stride[1]);i++){
           if (hw_out[i]!=sw_out[i]){
             if (e< MAXERR )//|| hw_out[i] - sw_out[i]>10 || sw_out[i]-hw_out[i] >10)

               printf("%05d HW: 0x%08x != SW: 0x%08x\n", i, hw_out[i] ,sw_out[i]);
               
             e++;
           }
           else if (i<MAXCOR)
             printf("          %05d HW: 0x%08x == SW: 0x%08x\n", i, hw_out[i] ,sw_out[i]);
          checksum_hw+=hw_out[i];
          checksum_sw+=sw_out[i];
        }


        printf("\n\nIF:%d OF:%d IW:%d IH:%d max_OG:%d\n",_IF_,_OF_,_iw_, _ih_, _MAX_OG_);	
        printf("\ntotal errors: %05d\n", e );
        printf("checksum_sw: %d\n", checksum_sw );
        printf("checksum_hw: %d\n", checksum_hw );
        printf("avg_err: %f\n", (float)(checksum_sw-checksum_hw)/(float)e );
        
        print_data((short int*)output, conv_dim/(stride[0]*stride[1]), "socout.txt");
        print_data(soc->out, conv_dim/(stride[0]*stride[1]), "output.txt");
        
        printf("Convdim: %d\n", conv_dim);
        
        
//	free(output);
//	free(input);
	free(out_sw_post);
	free(out_hw_post);


	if (e==0)
          exit(0);
	else
	  exit(1);        
	
                  
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

void init_platform(char* bitstream){ // called in codes/modnet2/src/app/neuconvnet.cpp
	init_soc(socs, &wPointer, _MAXMEM_, 0, bitstream);
}
void free_platform(){
	munmap_soc(socs);
	int i;	
	for (i=0; i<_NCLUSTER_; i++)
		free(socs[i]);
}

