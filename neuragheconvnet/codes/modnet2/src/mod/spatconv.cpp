#pragma GCC diagnostic ignored "-Wformat"

#include "spatconv.h"
//#include "channel.h"
#include "xassert.h"

//#include "spatconv_sw.h"
//#include "maxpool.h"
//#include "avgpool.h"

#include "paramIO.h"

RET spatconv_sw_8(signed char* input, signed char* output, signed char* kernel,
    signed char* bias, SIZE in_s[3], SIZE out_s[3], SIZE kern_s[2], SIZE dil[2], SIZE pad[2],
    SIZE stride[2], bool activate, int ncol, int qf) {


  unsigned int OF = out_s[0];
  unsigned int IF = in_s[0];

#ifdef _FIXED_
  int mac;
  #if (_NEURAGHE_)
  unsigned int if_count = 0;

    unsigned int _MIN_IF = 0;
#ifdef NEU_TCN
    _MIN_IF = ncol;
#else
    if(kern_s[0] == 5)
        _MIN_IF = ncol;
    if(kern_s[0] == 3 || kern_s[0] == 1)
        _MIN_IF = ncol*3;
#endif

    if(_MIN_IF!=0){

        if( (IF % _MIN_IF) > 0 )
            IF = (IF/_MIN_IF + 1) * _MIN_IF;         
    }

  #endif
#else
  DATA mac=0;
#endif

  /*DATA*/ int bi=0, current=0, curr_kern=0;
  /*DATA*/ //int out[OF*out_s[1]*out_s[2]];
	int *out = (int*)malloc(OF*out_s[1]*out_s[2]*sizeof(int));
  unsigned int i,j,k,in;

	//int k, j,in;
//	printf("\n input \n\n");
//	for(k=0; k<IF;k++){
//    	  for(i=0; i<in_s[1]; i++){
//	    for(j=0; j<in_s[2]; j++){
//	      printf("%x\t", (unsigned short int)input[(i*in_s[2])+j+(k*in_s[1]*in_s[2])]);
//	  }
//	  printf("\n");
//	}
//    	printf("\n");
//    }

//	for(k=0; k<OF;k++){
//    	  for(in=0; in<IF; in++){
//	     for(i=0; i<kern_s[0]; i++){
//		for(j=0; j<kern_s[1]; j++){
//		   printf("%x\t", kernel[(i*kern_s[0])+j+(k*IF*kern_s[0]*kern_s[1])+(in*kern_s[0]*kern_s[1])] );
//		    }
//		printf("\n");
//		}
//	printf("\n");
//	}
//    }

  // foreach output plane
  #pragma omp parallel for firstprivate(mac,bi,current,curr_kern,if_count)
  for (ITER pout = 0; pout < OF; pout++) {

    // buffer bias 
    bi = bias[pout];

    // for output matrix 
    for (ITER hout = 0; hout < out_s[1]; hout++) {
      for (ITER wout = 0; wout < out_s[2]; wout++) {

        // initialise multiply-accumulate to bias 
      #ifdef _FIXED_
        mac = ((int)bi) << qf;
      #else
        mac = bi;
      #endif

        // foreach input plane 
        for (ITER pin = 0; pin < IF; pin++) {

          // for kernel matrix 
          for (ITER hkern = 0; hkern < kern_s[0]; hkern++) {

          #if (_NEURAGHE_) && _FIXED_
            if(pin>=in_s[0] || pout>=out_s[0])
              continue;
          #endif

            // calculate required input position 
            int hin = stride[0] * hout + hkern*dil[0] - pad[0];

            // test if position is inside bounds
            bool cond = hin >= 0 && (ITER) hin < in_s[1];

            // if outside bounds => continue 
            if (cond == 0)
              continue;

            for (ITER wkern = 0; wkern < kern_s[1]; wkern++) {

              // calculate required input position 
              int win = stride[1] * wout + wkern*dil[1] - pad[1];

              // test if position is inside bounds
              cond = win >= 0 && (ITER) win < in_s[2];

              // if outside bounds => continue 
              if (cond == 0)
                continue;

              current = (input[(pin*in_s[1] + hin)*in_s[2] + win] == -128) ? -127 : input[(pin*in_s[1] + hin)*in_s[2] + win];

              curr_kern = kernel[((pout*in_s[0] + pin)*kern_s[0] + hkern)*kern_s[1] + wkern]; 
              // printf("place: %d  W: %d  -- v: %d\n", current, curr_kern, current*curr_kern);
              mac += current * curr_kern;

            }
          }
          
        #if (_NEURAGHE_) && _FIXED_
	#ifdef NEU_TCN
	     if_count++;
	     if(if_count == _MIN_IF) {
		mac = sat_8(mac >> qf) << qf;
                if_count = 0;
             }
	#else
          //Emulate Neuraghe platform
          if(kern_s[0]==3 || kern_s[0]==5 || kern_s[0]==1) {
            if_count++;
            if(((kern_s[0] == 3 || kern_s[0]==1) && if_count == _MIN_IF) || (kern_s[0] == 5 && if_count == _MIN_IF)) {
              //mac = (saturate(mac >> qf, "Conv")) << qf;
		          mac = sat_8(mac >> qf) << qf;
              if_count = 0;
            }
          }
        #endif
	#endif
  
        }

        if (activate) {
          mac = mac > 0 ? mac : 0;
        }

       /* #ifdef _FIXED_
          //output[(pout*out_s[1] + hout)*out_s[2] + wout] = (DATA)(mac >> qf);
          out[(pout*out_s[1] + hout)*out_s[2] + wout] = (DATA)(mac >> qf) mac;
        #else
          //output[(pout*out_s[1] + hout)*out_s[2] + wout] = mac;
          out[(pout*out_s[1] + hout)*out_s[2] + wout] = mac;
        #endif */

	out[(pout*out_s[1] + hout)*out_s[2] + wout] = mac;
        
        //printf("output[%d] -->  fixed: %d  -->  %3.10f\n", (pout*out_s[1] + hout)*out_s[2] + wout, output[(pout*out_s[1] + hout)*out_s[2] + wout], FIXED2FLOAT(output[(pout*out_s[1] + hout)*out_s[2] + wout]) );
      }
    }
  }

	/*printf("\n out \n\n");
	for(k=0; k<OF;k++){
    	  for(i=0; i<out_s[1]; i++){
	    for(j=0; j<out_s[2]; j++){
	      printf("%x\t", (unsigned short int)out[(i*out_s[2])+j+(k*out_s[1]*out_s[2])]);
	  }
	  printf("\n");
	}
    	printf("\n");
    }	*/

	//shift
	for(i=0; i<OF*out_s[1]*out_s[2]; i++){
	  output[i] = out[i] >> qf;
	  if(activate && output[i] < 0)
		output[i] = 0;
	}
	

	/*printf("\n out shifted + bias\n\n");
	for(k=0; k<OF;k++){
    	  for(i=0; i<out_s[1]; i++){
	    for(j=0; j<out_s[2]; j++){
	      printf("%x\t", (unsigned short int)output[(i*out_s[2])+j+(k*out_s[1]*out_s[2])]);
	  }
	  printf("\n");
	}
    	printf("\n");
    }*/

  return OK;
}

RET spatconv_sw_16(short int* input, short int* output, short int* kernel,
    short int* bias, SIZE in_s[3], SIZE out_s[3], SIZE kern_s[2], SIZE dil[2], SIZE pad[2],
    SIZE stride[2], bool activate, int ncol, int qf) {


  unsigned int OF = out_s[0];
  unsigned int IF = in_s[0];

#ifdef _FIXED_
  long long int mac;
  #if (_NEURAGHE_)
  unsigned int if_count = 0;

    unsigned int _MIN_IF = 0;

#ifdef NEU_TCN
    _MIN_IF = ncol;
#else
    if(kern_s[0] == 5)
        _MIN_IF = ncol;
    if(kern_s[0] == 3 || kern_s[0] == 1)
        _MIN_IF = ncol*3;
#endif

    if(_MIN_IF!=0){

        if( (IF % _MIN_IF) > 0 )
            IF = (IF/_MIN_IF + 1) * _MIN_IF;         
    }
    

  #endif
#else
  DATA mac;
#endif

printf("qf: %d  ncol: %d OF: %d  IF: %d \n", qf, ncol, OF, IF);
  /*DATA*/long long int bi, current, curr_kern;

	int *out = (int*)malloc(OF*out_s[1]*out_s[2]*sizeof(int));
  unsigned int i,j,k,in;


  // foreach output plane
  #pragma omp parallel for firstprivate(mac,bi,current,curr_kern,if_count)
  for (ITER pout = 0; pout < OF; pout++) {

    // buffer bias 
    bi = bias[pout];
//if (bi !=0)
		  //printf ("%d \n", pout);
      
    // for output matrix 
    for (ITER hout = 0; hout < out_s[1]; hout++) {
      for (ITER wout = 0; wout < out_s[2]; wout++) {

        // initialise multiply-accumulate to bias 
      #ifdef _FIXED_
        mac = ((long long int)bi) << qf;
      #else
        mac = bi;
      #endif

        // foreach input plane 
        for (ITER pin = 0; pin < IF; pin++) {

          // for kernel matrix 
          for (ITER hkern = 0; hkern < kern_s[0]; hkern++) {

          #if (_NEURAGHE_) && _FIXED_
            if(pin>=in_s[0] || pout>=out_s[0])
              continue;
          #endif

            // calculate required input position 
            int hin = stride[0] * hout + hkern*dil[0] - pad[0];

            // test if position is inside bounds
            bool cond = hin >= 0 && (ITER) hin < in_s[1];

            // if outside bounds => continue 
            if (cond == 0)
              continue;

            for (ITER wkern = 0; wkern < kern_s[1]; wkern++) {

              // calculate required input position 
              int win = stride[1] * wout + wkern*dil[1] - pad[1];

              // test if position is inside bounds
              cond = win >= 0 && (ITER) win < in_s[2];

              // if outside bounds => continue 
              if (cond == 0)
                continue;

              current = input[(pin*in_s[1] + hin)*in_s[2] + win];

              curr_kern = kernel[((pout*in_s[0] + pin)*kern_s[0] + hkern)*kern_s[1] + wkern]; 
              // printf("place: %d  W: %d  -- v: %d\n", current, curr_kern, current*curr_kern);
              mac += current * curr_kern;
              //if (mac>>qf == 0x00001b50)
		 // printf ("bbb %d %d %d %x %x \n", pout, hout, wout, current, curr_kern);

            }
          }
        //  if (mac>>qf == 0x00001b50)
		 // printf ("aa%d %d %d \n", pout, hout, wout);
     
       #if (_NEURAGHE_) && _FIXED_
          #ifdef NEU_TCN
	         if_count++;
	         if(if_count == _MIN_IF) {
		            mac = sat_16(mac >> qf) << qf;
                if_count = 0;
              }
	        #else
          //Emulate Neuraghe platform
          if(kern_s[0]==3 || kern_s[0]==5 || kern_s[0]==1) {
            if_count++;
            if(((kern_s[0] == 3 || kern_s[0]==1) && if_count == _MIN_IF) || (kern_s[0] == 5 && if_count == _MIN_IF)) {
              //mac = (saturate(mac >> qf, "Conv")) << qf;
		          mac = sat_16(mac >> qf) << qf;
              if_count = 0;
            }
          }
          #endif
       #endif
  
        }

       // if (activate) {
       //   mac = mac > 0 ? mac : 0;
       // }

       
	out[(pout*out_s[1] + hout)*out_s[2] + wout] = mac;
	//	if (mac>>qf == 0x00001b50)
	//	  printf ("%d %d %d \n", pout, hout, wout);
        
        //printf("output[%d] -->  fixed: %d  -->  %3.10f\n", (pout*out_s[1] + hout)*out_s[2] + wout, output[(pout*out_s[1] + hout)*out_s[2] + wout], FIXED2FLOAT(output[(pout*out_s[1] + hout)*out_s[2] + wout]) );
      }
    }
  }

	
	//shift
	for(i=0; i<OF*out_s[1]*out_s[2]; i++){
	  output[i] = out[i] >> qf;
	  if(activate && output[i] < 0)
		  output[i] = 0;
	}

	

  return OK;
}

RET spatconv_merge(DATA* out, DATA** b, SIZE out_s[3], SIZE kernel_size, SIZE stride[2], bool activate)
{
	_tcreate_(time);

  //We assuming stride < 3 and stride x and y equal
  ASSERT((stride[0]<3 && stride[0]==stride[1]),"%s", "Error: we assume stride < 3 and stride x and y equal");
  uint32_t of_h = out_s[1];
  uint32_t of_w = out_s[2];
  uint32_t if_h = kernel_size == 3 ? out_s[1]+(4/stride[0]) :  out_s[1]+(2/stride[0]);
  uint32_t if_w = kernel_size == 3 ? out_s[2]+(4/stride[0]) :  out_s[2]+(2/stride[0]);
  ITER x,y,of;
  
	switch(kernel_size) {
		case 3:
			for(of = 0; of < out_s[0]; of++) {
				DATA *_out  = &out[of*of_h*of_w];
				DATA *_tmp0 = &b[0][of*if_h*if_w];
				DATA *_tmp1 = &b[1][of*if_h*if_w + (2/stride[0])];
				DATA *_tmp2 = &b[2][of*if_h*if_w + (4/stride[0])];
				DATA *_tmp3 = &b[3][of*if_h*if_w + (2/stride[0])*if_w];
				DATA *_tmp4 = &b[4][of*if_h*if_w + (2/stride[0])*if_w + (2/stride[0])];
				DATA *_tmp5 = &b[5][of*if_h*if_w + (2/stride[0])*if_w + (4/stride[0])];
				DATA *_tmp6 = &b[6][of*if_h*if_w + (4/stride[0])*if_w];
				DATA *_tmp7 = &b[7][of*if_h*if_w + (4/stride[0])*if_w + (2/stride[0])];
				DATA *_tmp8 = &b[8][of*if_h*if_w + (4/stride[0])*if_w + (4/stride[0])];
				
				for(y = 0; y < of_h; y++)
					for(x = 0; x < of_w; x++) {
						_out[y*of_w+x] = _tmp0[y*if_w+x] + _tmp1[y*if_w+x] + _tmp2[y*if_w+x] +
					                     _tmp3[y*if_w+x] + _tmp4[y*if_w+x] + _tmp5[y*if_w+x] +
					                     _tmp6[y*if_w+x] + _tmp7[y*if_w+x] + _tmp8[y*if_w+x];
						if (activate) {
							_out[y*of_w+x] = _out[y*of_w+x] > 0 ? _out[y*of_w+x] : 0;
						}           
					}
			}
			break;

		case 5:
      #pragma omp parallel for firstprivate(of_h, of_w, if_h, if_w) private(x,y)
			for(of = 0; of < out_s[0]; of++) {
        DATA *_out  = &out[of*of_h*of_w];
        DATA *_tmp0 = &b[0][of*if_h*if_w];
        DATA *_tmp1 = &b[1][of*if_h*if_w + (2/stride[0])];
        DATA *_tmp2 = &b[2][of*if_h*if_w + (2/stride[0])*if_w];
        DATA *_tmp3 = &b[3][of*if_h*if_w + (2/stride[0])*if_w + (2/stride[0])];
				
				for(y = 0; y < of_h; y++)
					for(x = 0; x < of_w; x++) {
						_out[y*of_w+x] = _tmp0[y*if_w+x] + _tmp1[y*if_w+x] +
										 _tmp2[y*if_w+x] + _tmp3[y*if_w+x];
		
						if (activate) {
							_out[y*of_w+x] = _out[y*of_w+x] > 0 ? _out[y*of_w+x] : 0;
						}
					}
			}
			break;
	}
	_tprintf_("Merge time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;
}

RET spatconv_single_merge_7x7(DATA* out, DATA* partial_conv, int conv_id, SIZE out_s[3], SIZE kernel_size, SIZE stride[2], bool activate)
{
  //_tcreate_(time);
  SIZE of_h = out_s[1];
  SIZE of_w = out_s[2];
  uint32_t if_h = kernel_size == 3 ? out_s[1]+(4/stride[0]) :  out_s[1]+(2/stride[0]);
  uint32_t if_w = kernel_size == 3 ? out_s[2]+(4/stride[0]) :  out_s[2]+(2/stride[0]);
  ITER x,y,of;

  //HW generated padding
  if_w += if_w%2;

  switch(kernel_size) {
    case 3:
      for(of = 0; of < out_s[0]; of++) {
        DATA *tmp;
        DATA *_out  = &out[of*(of_h)*(of_w)];
        
        ASSERT(conv_id>=0&&conv_id<9,"spatconv_7x7_merge_single: partial convolution not expected %d (0-8)\n",conv_id);
        switch(conv_id){
          case 0:
            tmp = &partial_conv[of*if_h*if_w];
            break;
          case 1:
            tmp = &partial_conv[of*if_h*if_w + (2/stride[0])];
            break;
          case 2:
            tmp = &partial_conv[of*if_h*if_w + (4/stride[0])];
            break;
          case 3:
            tmp = &partial_conv[of*if_h*if_w + (2/stride[0])*if_w];
            break;
          case 4:
            tmp = &partial_conv[of*if_h*if_w + (2/stride[0])*if_w + (2/stride[0])];
            break;
          case 5:
            tmp = &partial_conv[of*if_h*if_w + (2/stride[0])*if_w + (4/stride[0])];
            break;
          case 6:
            tmp = &partial_conv[of*if_h*if_w + (4/stride[0])*if_w];
            break;
          case 7:
            tmp = &partial_conv[of*if_h*if_w + (4/stride[0])*if_w + (2/stride[0])];
            break;
          case 8:
            tmp = &partial_conv[of*if_h*if_w + (4/stride[0])*if_w + (4/stride[0])];
            break;
          default:
            exit(1);
        }

        if(conv_id==0){
          for(y = 0; y < of_h; y++)
            for(x = 0; x < of_w; x++) {
              _out[y*of_w+x] = tmp[y*if_w+x];
            }
        }
        else
        {
          for(y = 0; y < of_h; y++)
            for(x = 0; x < of_w; x++) {
              _out[y*of_w+x] += tmp[y*if_w+x];
              if (activate)
                _out[y*of_w+x] = _out[y*of_w+x] > 0 ? _out[y*of_w+x] : 0;
            }          
        }
      }
      break;

    case 5:
      for(of = 0; of < out_s[0]; of++) {
        DATA *tmp;
        DATA *_out  = &out[of*(of_h)*(of_w)];
        
        ASSERT(conv_id>=0&&conv_id<4,"spatconv_7x7_merge_single: partial convolution not expected %d (0-3)\n",conv_id);
        switch(conv_id){
          case 0:
            tmp = &partial_conv[of*if_h*if_w];
            break;
          case 1:
            tmp = &partial_conv[of*if_h*if_w + (2/stride[0])];
            break;
          case 2:
            tmp = &partial_conv[of*if_h*if_w];
            break;
          case 3:
            tmp = &partial_conv[of*if_h*if_w + (2/stride[0])*if_w + (2/stride[0])];
            break;
          default:
            exit(1);
            break;
        }
        
        if(conv_id==0){
          for(y = 0; y < of_h; y++)
            for(x = 0; x < of_w; x++) {
              _out[y*of_w+x] = tmp[y*if_w+x];
            }
        }
        else
        {
          for(y = 0; y < of_h; y++)
            for(x = 0; x < of_w; x++) {
              _out[y*of_w+x] += tmp[y*if_w+x];
              if (activate)
                _out[y*of_w+x] = _out[y*of_w+x] > 0 ? _out[y*of_w+x] : 0;
            }          
        }
      }
      break;
  }
  return OK;
}

RET spatconv_forward_sw(SPATCONV sc, DATA* input, DATA* output, SIZE in_s[3],
                        SIZE out_s[3], SIZE stride[2], SIZE pad[2], bool activate, int ncol, int qf, int precision8) {


    ASSERT(in_s[0] == sc->pin, "%s", "input planes do not match");
    ASSERT(out_s[0] == sc->pout, "%s", "output planes do not match");

    SIZE* kern_s = &sc->kern_s[0];
    SIZE* dil    = &sc->dil[0];

	int complexity = out_s[0] * in_s[0] * kern_s[2] * kern_s[3] * out_s[1] * out_s[2];

    _rprintf_("[%dx%d] software spatial convolution:\n", kern_s[2], kern_s[3]);
    _rprintf_("\t%lu to %lu\n", in_s[0], out_s[0]);
    _rprintf_("\t%lux%lu to %lux%lu\n", in_s[1], in_s[2], out_s[1], out_s[2]);

if(precision8){
	_tcreate_(time);
	spatconv_sw_8((signed char *)input, (signed char *)output, (signed char *)sc->kernel, (signed char *)sc->bias, in_s, out_s, &kern_s[2], &dil[0], pad, stride, activate, ncol, qf);
	_tprintf_("\tConv_exec 8: %5.3f ms,  time/complexity: %5.6f us,  GMACs: %5.2f\n", (get_wall_time()-time)/1000, (get_wall_time()-time)/complexity, (double)complexity/(get_wall_time()-time)/1000);
}

else{
	_tcreate_(time);
	spatconv_sw_16((short int *)input, (short int *)output, (short int *)sc->kernel, (short int *)sc->bias, in_s, out_s, &kern_s[2], &dil[0], pad, stride, activate, ncol, qf);
	_tprintf_("\tConv_exec 16: %5.3f ms,  time/complexity: %5.6f us,  GMACs: %5.2f\n", (get_wall_time()-time)/1000, (get_wall_time()-time)/complexity, (double)complexity/(get_wall_time()-time)/1000);
}

    _dprintf_("\tInput Checksum: %lld\n", checksum(input, in_s[0]*in_s[1]*in_s[2]));
    _dprintf_("\tWeights Checksum: %lld\n", checksum(sc->kernel, in_s[0]*out_s[0]*kern_s[2]*kern_s[2]));
    
    return OK;
}


RET zero_pad(DATA* input, DATA* output, SIZE in_s[3], SIZE pad[2])
{
	_tcreate_(time);
	int out_h = in_s[1] + pad[0]*2;
	int out_w = in_s[2] + pad[1]*2;
	unsigned int i,j,feature;
//printf ("sizeofDATA: %d\n", sizeof(DATA));
  #pragma omp parallel for firstprivate(out_h, out_w) private(feature, i, j)
	for(feature = 0; feature < in_s[0]; feature++)
	{
		//top and bottom padding
		for(i=0; i<pad[0]; i++)
		{
			memset(&output[feature*out_h*out_w + i*out_w], 0, out_w*sizeof(DATA));
			memset(&output[feature*out_h*out_w + (out_h-i-1)*out_w], 0, out_w*sizeof(DATA));
		}

		//left and right padding
		for(i=pad[0]; i<in_s[1]+pad[0]; i++)
		{
			for(j=0; j<pad[1]; j++)
			{
				output[feature*out_h*out_w + i*out_w+j] = 0;
				output[feature*out_h*out_w + i*out_w+out_h-1-j] = 0;
			}
		}

		//image
		for(i=0; i<in_s[1]; i++)
			memcpy(&output[feature*out_h*out_w + (i+pad[0])*out_w+pad[1]], &input[feature*in_s[1]*in_s[2] + i*in_s[2]], in_s[2]*sizeof(DATA));		
	}

	_tprintf_("Zero pad time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return OK;

}

SPATCONV spatconv_create(void) {
    SPATCONV sc = (SPATCONV) calloc(1, sizeof(struct Spatconv));
    return sc;
}


RET spatconv_destroy(SPATCONV sc) {

#ifdef _NEURAGHE_
    if(sc->kern_s[2] != 5 && sc->kern_s[2] != 3)
    {       
#endif

    free(sc->kernel);

#ifdef _NEURAGHE_
    }
#endif

    free(sc->bias);
    free(sc);
    return OK;
}

