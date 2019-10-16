#pragma GCC diagnostic ignored "-Wformat"

#include "spatconv_hw.h"
//#include "channel.h"
#include "xassert.h"

//#include "spatconv_sw.h"
//#include "maxpool.h"
//#include "avgpool.h"

//#include "paramIO.h"

#include "ConvLayer.h"

#ifdef _ARM_
#include "arm_neon.h"
#endif

//RET deinterlace_even (DATA* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2]);

RET spatconv_merge_hw(DATA* out, DATA** b, SIZE out_s[3], SIZE kernel_size, SIZE stride[2], bool activate, int qf)
{
  _tcreate_(time);

  //We assuming stride < 3 and stride x and y equal
  ASSERT((stride[0]<3 && stride[0]==stride[1]),"%s", "Error: we assume stride < 3 and stride x and y equal");
  uint32_t of_h = out_s[1];
  uint32_t of_w = out_s[2];
  uint32_t if_h = kernel_size == 3 ? out_s[1]+(4/stride[0]) :  out_s[1]+(2/stride[0]);
  uint32_t if_w = kernel_size == 3 ? out_s[2]+(4/stride[0]) :  out_s[2]+(2/stride[0]);
  ITER x,y,of;
  
  if_w += if_w%2;

  _dprintf_("[%lu,%lu] spatconv_merge_hw:\n", stride[0], stride[1]);
  _dprintf_("\t%lu to %lu\n", kernel_size==3? 9:4, 1);
  _dprintf_("\t%lux%lu to %lux%lu\n", if_h, if_w, of_h, of_w);

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

int spatconv_forward_hw(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                     	SIZE out_s[3], SIZE stride[2], SIZE pad[2], bool activate, int qf, int precision8) {

    ASSERT(in_s[0] == sc->pin, "%s", "input planes do not match");
    ASSERT(out_s[0] == sc->pout, "%s", "output planes do not match");
    ASSERT(stride[0] < 5 || stride[1] < 5, "%s\n", "stride > 4 is not supported in hardware");
    ASSERT(pad[0] < 3 && pad[1] < 3, "%s\n", "padding > 2 is not supported in hardware");
    
    //SIZE* kern_s = &sc->kern_s[0];
   // ASSERT(kern_s[2] == 3 || kern_s[2] == 5, "%s", "kernel size not supported in hardware");

   // int complexity = out_s[0] * in_s[0] * kern_s[2] * kern_s[2] * out_s[1] * out_s[2];

    int padding = 1;
    int pooling_hw = 0;
  //  int subsamp = 0;

    if(pad[0]==0 && pad[1]==0)
        padding = 0;

    if(stride[0]==2 && stride[1]==2) {
        pooling_hw = (SUBSAMP<<2)|POOL_2x2;
    //    subsamp = SUBSAMP;      
    }

    if(stride[0]==4 && stride[1]==4) {
        pooling_hw = (SUBSAMP<<2)|POOL_4x4;
 //       subsamp = SUBSAMP;      
    }

  //  _dprintf_("[%dx%d] HW accelerated conv:\n", kern_s[2], kern_s[2]);
    _dprintf_("\t%lu to %lu\n", in_s[0], out_s[0]);
    _dprintf_("\t%lux%lu to %lux%lu\n", in_s[1], in_s[2], out_s[1], out_s[2]);
    

#ifdef _NEURAGHE_
	int job_id = ConvLayer_exec(soc, sc, input, output, in_s[1], in_s[2], activate, pooling_hw, qf, precision8, padding);
#endif	
		
	return job_id;
}



/*
int basicBlock_hw(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                    SIZE out_s[3], SIZE stride[2], SIZE pad[2], SIZE pooling_hw, 
                    SIZE pooling_method, bool activate, int qf, int precision8) {


    ASSERT(in_s[0] == sc->pin, "%s", "input planes do not match");
    ASSERT(out_s[0] == sc->pout, "%s", "output planes do not match");
    ASSERT(stride[0] < 2 || stride[1] < 2, "%s\n", "stride > 1 and pooling is not supported in hardware");
    ASSERT(pad[0] < 3 && pad[1] < 3, "%s\n", "padding > 2 is not supported in hardware"); 
        
    SIZE* kern_s = &sc->kern_s[0];
    ASSERT(kern_s[2] == 3 || kern_s[2] == 5, "%s", "kernel size not supported in hardware");

//	int complexity = out_s[0] * in_s[0] * kern_s[2] * kern_s[2] * out_s[1] * out_s[2];

    int padding = 1;

    if(pad[0]==0 && pad[1]==0)
        padding = 0;

    _dprintf_("[%dx%d] HW accelerated block:\n", kern_s[2], kern_s[2]);
    _dprintf_("\t%lu to %lu\n", in_s[0], out_s[0]);
    _dprintf_("\t%lux%lu to %lux%lu\n", in_s[1], in_s[2], out_s[1], out_s[2]);

#ifdef _NEURAGHE_
	int job_id = ConvLayer_exec(soc, sc, input, output, in_s[1], in_s[2], activate, pooling_hw, qf, precision8, padding);
#endif	
		
	return job_id;
}*/

int spatconv_forward_hw_sync(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                      SIZE out_s[3], SIZE stride[2], SIZE pad[2], bool activate, int qf, int precision8) {

    ASSERT(in_s[0] == sc->pin, "%s", "input planes do not match");
    ASSERT(out_s[0] == sc->pout, "%s", "output planes do not match");
    ASSERT(stride[0] < 5 || stride[1] < 5, "%s\n", "stride > 4 is not supported in hardware");
    ASSERT(pad[0] < 3 && pad[1] < 3, "%s\n", "padding > 2 is not supported in hardware");   
    
    SIZE* kern_s = &sc->kern_s[0];
    ASSERT(kern_s[2] == 3 || kern_s[2] == 5, "%s", "kernel size not supported in hardware");

    int complexity = out_s[0] * in_s[0] * kern_s[2] * kern_s[2] * out_s[1] * out_s[2];

    int padding = 1;
    int pooling_hw = 0;
  //  int subsamp = 0;

    if(pad[0]==0 && pad[1]==0)
        padding = 0;

    if(stride[0]==2 && stride[1]==2) {
        pooling_hw = (SUBSAMP<<2)|POOL_2x2;
  //      subsamp = SUBSAMP;      
    }

    if(stride[0]==4 && stride[1]==4) {
        pooling_hw = (SUBSAMP<<2) | POOL_4x4;
 //       subsamp = SUBSAMP;      
    }

    _dprintf_("[%dx%d] HW accelerated conv:\n", kern_s[2], kern_s[2]);
    _dprintf_("\t%lu to %lu\n", in_s[0], out_s[0]);
    _dprintf_("\t%lux%lu to %lux%lu\n", in_s[1], in_s[2], out_s[1], out_s[2]);

  _tcreate_(time);
#ifdef _NEURAGHE_
  int job_id = ConvLayer_exec(soc, sc, input, output, in_s[1], in_s[2], activate, pooling_hw, qf, precision8, padding);
#endif  
  spatconv_wait(soc, job_id);
  _tprintf_("\tConv_exec: %5.3f ms,  time/complexity: %5.6f us,  GMACs: %5.2f\n", (get_wall_time()-time)/1000, (get_wall_time()-time)/complexity, (double)complexity/(get_wall_time()-time)/1000);
    
  return job_id;
}
/*
int basicBlock_hw_sync(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                    SIZE out_s[3], SIZE stride[2], SIZE pad[2], SIZE pooling_hw, 
                    SIZE pooling_method, bool activate, int qf, int precision8) {


    ASSERT(in_s[0] == sc->pin, "%s", "input planes do not match");
    ASSERT(out_s[0] == sc->pout, "%s", "output planes do not match");
    ASSERT(stride[0] < 2 || stride[1] < 2, "%s\n", "stride > 1 and pooling is not supported in hardware");
    ASSERT(pad[0] < 3 && pad[1] < 3, "%s\n", "padding > 2 is not supported in hardware"); 
        
    SIZE* kern_s = &sc->kern_s[0];
    ASSERT(kern_s[2] == 3 || kern_s[2] == 5, "%s", "kernel size not supported in hardware");

  int complexity = out_s[0] * in_s[0] * kern_s[2] * kern_s[2] * out_s[1] * out_s[2];

    int padding = 1;

    if(pad[0]==0 && pad[1]==0)
        padding = 0;

    _dprintf_("[%dx%d] HW accelerated block:\n", kern_s[2], kern_s[2]);
    _dprintf_("\t%lu to %lu\n", in_s[0], out_s[0]);
    _dprintf_("\t%lux%lu to %lux%lu\n", in_s[1], in_s[2], out_s[1], out_s[2]);

  _tcreate_(time);
#ifdef _NEURAGHE_
  int job_id = ConvLayer_exec(soc, sc, input, output, in_s[1], in_s[2], activate, pooling_hw, qf, precision8, padding);
#endif  
  spatconv_wait(soc, job_id);
  _tprintf_("\tConv_exec: %5.3f ms,  time/complexity: %5.6f us,  GMACs: %5.2f\n", (get_wall_time()-time)/1000, (get_wall_time()-time)/complexity, (double)complexity/(get_wall_time()-time)/1000);
    
  return job_id;
}
*/

RET spatconv_wait(SOCMAP soc, int job_id)
{
  ConvLayer_wait(soc, job_id);

  return OK;
}

RET place_zeros(uint32_t* data, SIZE out_s[3])
{
  _tcreate_(time);

  int step = 4;
  int tot_rows = out_s[1];
  int of = out_s[0];

  int int_per_row = out_s[2]/2 + 1;

  uint32_t* ptr;
  for(int row=0; row < tot_rows*of; row++){
    ptr = data + step * (row*int_per_row + int_per_row-1); 
    *(ptr)   = *(ptr)   & 0x0000FFFFU;
    *(ptr+1) = *(ptr+1) & 0x0000FFFFU;
    *(ptr+2) = *(ptr+2) & 0x0000FFFFU;
    *(ptr+3) = *(ptr+3) & 0x0000FFFFU;
  }
  
  _tprintf_("\tput zeros: %5.3f ms\n", (get_wall_time()-time)/1000);

  return OK;
}
/*

RET interlace (DATA* dest, DATA* src, int KS, int n_feat, int height, int width)
{
    _tcreate_(time);
  int step = 4;
  
  int gr = n_feat/step;
  if (n_feat%step>0) gr++;
  if (KS == 3) {
    int gr_12 = n_feat/12;
    if (n_feat%12>0) gr_12++;

    gr = gr_12*3; 
  }

  //int ih = (height%2)? height+1 : height;
  int ih = height;
  int iw = (width%2)? width+1 : width;

  int g = 0, w = 0, _w = 0, j, h;
  
  //In case we don't need to add padding we can access data vector as 32-bit words
  //Otherwise we need to access array element by element
  ASSERT((step==4),"%s", "Error: features must be grouped to 4");
  if(height==ih && width==iw)
  {
    int nbwords = height*width*sizeof(DATA)/sizeof(uint32_t);
    for (g=0; g<gr; g++){
      uint32_t *src_feat0  = (uint32_t *) &src[g*step*height*width+0*height*width];
      uint32_t *src_feat1  = (uint32_t *) &src[g*step*height*width+1*height*width];
      uint32_t *src_feat2  = (uint32_t *) &src[g*step*height*width+2*height*width];
      uint32_t *src_feat3  = (uint32_t *) &src[g*step*height*width+3*height*width];
      uint32_t *dest_feat0 = (uint32_t *) &dest[g*step*ih*iw+0];
      uint32_t *dest_feat1 = (uint32_t *) &dest[g*step*ih*iw+1*2];
      uint32_t *dest_feat2 = (uint32_t *) &dest[g*step*ih*iw+2*2];
      uint32_t *dest_feat3 = (uint32_t *) &dest[g*step*ih*iw+3*2];

      if(g*step<n_feat) {
        switch((n_feat-g*step)%step)
        {
          case 0:
            w = 0, _w = 0;
            while(w<nbwords){           
              dest_feat0[_w] = src_feat0[w];
              dest_feat1[_w] = src_feat1[w];
              dest_feat2[_w] = src_feat2[w];
              dest_feat3[_w] = src_feat3[w];
              _w+=step; w++;
            }
          break;

          case 1:
            w = 0, _w = 0;
            while(w<nbwords){           
              dest_feat0[_w] = src_feat0[w];
              dest_feat1[_w] = 0;
              dest_feat2[_w] = 0;
              dest_feat3[_w] = 0;
              _w+=step; w++;
            }
          break;

          case 2:
            w = 0, _w = 0;
            while(w<nbwords){           
              dest_feat0[_w] = src_feat0[w];
              dest_feat1[_w] = src_feat1[w];
              dest_feat2[_w] = 0;
              dest_feat3[_w] = 0;
              _w+=step; w++;
            }
          break;

          case 3:
            w = 0, _w = 0;
            while(w<nbwords){           
              dest_feat0[_w] = src_feat0[w];
              dest_feat1[_w] = src_feat1[w];
              dest_feat2[_w] = src_feat2[w];
              dest_feat3[_w] = 0;
              _w+=step; w++;
            }
          break;
        }
      }
      else
      {
        //_w still valid!
        for(w=0; w<nbwords*step;w++)
          dest_feat0[w] = 0;
      }
    }
  }
  else
  {
    for (g=0; g<gr; g++) {
      for (j=0; j<step; j++) {
        uint32_t dest_base_idx = g*step*ih*iw + j*2;
        uint32_t src_base_idx  = g*step*height*width + j*height*width;
        for (h=0; h<ih; h++) {
          for (w=0; w<iw; w++) {
            if( (g*step+j < n_feat) && (w < width && h < height) )
              dest[dest_base_idx + ((h*iw + w)/2)*step*2 + (h*iw + w)%2] = src[src_base_idx + h*width + w];
            else
              dest[dest_base_idx + ((h*iw + w)/2)*step*2 + (h*iw + w)%2] = 0;
          }
        }
      }
    }
  }
  _tprintf_("\tinterlace: %5.3f ms\n", (get_wall_time()-time)/1000);
  return OK;
}


RET deinterlace2float (float* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2]){ 
  _tcreate_(time);

  _dprintf_("[%lu,%lu] deinterlace:\n", stride[0], stride[1]);
  _dprintf_("\t%lu to %lu\n", n_feat, n_feat);
  _dprintf_("\t%lux%lu to %lux%lu\n", height, width, height, width);

  //FIXME: this need to be parametric!
  int step = 4;

  int gr = n_feat/step;
  if (n_feat%4>0) gr++;

  //int ih = (height%2)? height+1 : height;
  int ih = height;
  int iw = (width%2)? width+1 : width;

  int oh = height/stride[1];
  int ow = width/stride[0];

  if(height%stride[1] > 0) oh++;
  if(width%stride[0] > 0) ow++;

  int h, w, j, g;

  //In case we don't need to add padding or we don't need striding
  //we can access data vector as 32-bit words.
  //Otherwise we need to access array element by element
  ASSERT((step==4),"%s", "Error: features must be grouped to 4");
  for (g=0; g<gr; g++) {
    for (j=0; j<step; j++) {
       //FIXME something not merged here...
      if(g*step+j < n_feat){
        uint32_t dest_base_idx  = g*step*oh*ow + j*oh*ow;
        uint32_t src_base_idx   = g*step*ih*iw + j*2;
        uint32_t px=0;
        for (h=0; h<ih; h=h+stride[1]) {
          for (w=0; w<iw; w=w+stride[0]) {
            if(w < width && h < height) {
              dest[dest_base_idx + px] = (float) FIXED2FLOAT(src[src_base_idx + ((h*iw + w)/2)*step*2 + (h*iw + w)%2]);
              px++;
            }
          }
        }
      }
    }
  }

  _tprintf_("\tdeinterlace2float: %5.3f ms\n", (get_wall_time()-time)/1000);
  return OK;
}

RET deinterlace (DATA* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2]){ 
  _tcreate_(time);

  _dprintf_("[%lu,%lu] deinterlace:\n", stride[0], stride[1]);
  _dprintf_("\t%lu to %lu\n", n_feat, n_feat);
  _dprintf_("\t%lux%lu to %lux%lu\n", height, width, height, width);

  //FIXME: this need to be parametric!
  int step = 4;

  int gr = n_feat/step;
  if (n_feat%4>0) gr++;

  //int ih = (height%2)? height+1 : height;
  int ih = height;
  int iw = (width%2)? width+1 : width;

  int oh = height/stride[1];
  int ow = width/stride[0];

  if(height%stride[1] > 0) oh++;
  if(width%stride[0] > 0) ow++;

  int h, w, j, g;

  //In case we don't need to add padding or we don't need striding
  //we can access data vector as 32-bit words.
  //Otherwise we need to access array element by element
  ASSERT((step==4),"%s", "Error: features must be grouped to 4");
  if((stride[0]>1 || stride[1]>1) ||
     (stride[0] != stride[1]) || iw!=width)
  {
    for (g=0; g<gr; g++) {
      for (j=0; j<step; j++) {
	       //FIXME something not merged here...
        if(g*step+j < n_feat){
          uint32_t dest_base_idx  = g*step*oh*ow + j*oh*ow;
          uint32_t src_base_idx   = g*step*ih*iw + j*2;
          uint32_t px=0;
          for (h=0; h<ih; h=h+stride[1]) {
            for (w=0; w<iw; w=w+stride[0]) {
              if(w < width && h < height) {
                dest[dest_base_idx + px] = src[src_base_idx + ((h*iw + w)/2)*step*2 + (h*iw + w)%2];
                px++;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int nbwords = oh*ow/2;
    int _w = 0;
    for (g=0; g<gr; g++){
      //ASSERT((n_feat%4==0),"%s", "n_feat not multiple of 4");
      uint32_t *dest_feat0  = (uint32_t *) &dest[g*step*oh*ow+0*oh*ow];
      uint32_t *dest_feat1  = (uint32_t *) &dest[g*step*oh*ow+1*oh*ow];
      uint32_t *dest_feat2  = (uint32_t *) &dest[g*step*oh*ow+2*oh*ow];
      uint32_t *dest_feat3  = (uint32_t *) &dest[g*step*oh*ow+3*oh*ow];
      uint32_t *src_feat0   = (uint32_t *) &src[g*step*ih*iw+0];
      uint32_t *src_feat1   = (uint32_t *) &src[g*step*ih*iw+1*2];
      uint32_t *src_feat2   = (uint32_t *) &src[g*step*ih*iw+2*2];
      uint32_t *src_feat3   = (uint32_t *) &src[g*step*ih*iw+3*2];
      
      switch(((g+1)*step)%step)
      {
        case 0:
           w = 0, _w = 0;
        while(_w<nbwords){
          dest_feat0[_w] = src_feat0[w];
          dest_feat1[_w] = src_feat1[w];
          dest_feat2[_w] = src_feat2[w];
          dest_feat3[_w] = src_feat3[w];
          _w++; w+=step;
        }
        break;

        case 1:
          w = 0, _w = 0;
      while(_w<nbwords){
        dest_feat0[_w] = src_feat0[w];
        _w++; w+=step;
      }
        break;

        case 2:
          w = 0, _w = 0;
      while(_w<nbwords){
        dest_feat0[_w] = src_feat0[w];
        dest_feat1[_w] = src_feat1[w];
        _w++; w+=step;
      }
        break;

        case 3:
          w = 0, _w = 0;
      while(_w<nbwords){
        dest_feat0[_w] = src_feat0[w];
        dest_feat1[_w] = src_feat1[w];
        dest_feat2[_w] = src_feat2[w];
        _w++; w+=step;
      }
        break;
      }        
    } 
  }

  _tprintf_("\tdeinterlace: %5.3f ms\n", (get_wall_time()-time)/1000);
  return OK;
}

//This interlace produce always even number of elements in a single row
RET deinterlace_even(DATA* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2])
{
  _tcreate_(time);

  _dprintf_("[%lu,%lu] deinterlace_even:\n", stride[0], stride[1]);
  _dprintf_("\t%lu to %lu\n", n_feat, n_feat);
  _dprintf_("\t%lux%lu to %lux%lu\n", height, width, height, width);

  width+=width%2;

  //FIXME: this need to be parametric!
  int step = 4;

  int gr = n_feat/step;
  if (n_feat%4>0) gr++;

  //int ih = (height%2)? height+1 : height;
  int ih = height;
  int iw = (width%2)? width+1 : width;

  int oh = height/stride[1];
  int ow = width/stride[0];

  if(height%stride[1] > 0) oh++;
  if(width%stride[0] > 0) ow++;

  int nbwords = oh*ow/2;
  int _w = 0, w = 0;
  for (int g=0; g<gr; g++){
    //ASSERT((n_feat%4==0),"%s", "n_feat not multiple of 4");
    uint32_t *dest_feat0  = (uint32_t *) &dest[g*step*oh*ow+0*oh*ow];
    uint32_t *dest_feat1  = (uint32_t *) &dest[g*step*oh*ow+1*oh*ow];
    uint32_t *dest_feat2  = (uint32_t *) &dest[g*step*oh*ow+2*oh*ow];
    uint32_t *dest_feat3  = (uint32_t *) &dest[g*step*oh*ow+3*oh*ow];
    uint32_t *src_feat0   = (uint32_t *) &src[g*step*ih*iw+0];
    uint32_t *src_feat1   = (uint32_t *) &src[g*step*ih*iw+1*2];
    uint32_t *src_feat2   = (uint32_t *) &src[g*step*ih*iw+2*2];
    uint32_t *src_feat3   = (uint32_t *) &src[g*step*ih*iw+3*2];
     
    switch(((g+1)*step)%step)
    {
      case 0:
         w = 0, _w = 0;
      while(_w<nbwords){
        //NO gain from this
        // uint32x2x2_t feat0_1 = vld2_u32(&src_feat0[w]);
        // uint32x2x2_t feat2_3 = vld2_u32(&src_feat0[w+2]);
        // vst1_u32(&dest_feat0[_w],feat0_1.val[0]);
        // vst1_u32(&dest_feat1[_w],feat0_1.val[1]);
        // vst1_u32(&dest_feat2[_w],feat2_3.val[0]);
        // vst1_u32(&dest_feat3[_w],feat2_3.val[1]);

        dest_feat0[_w] = src_feat0[w];
        dest_feat1[_w] = src_feat1[w];
        dest_feat2[_w] = src_feat2[w];
        dest_feat3[_w] = src_feat3[w];
        _w++; w+=step;
      }
      break;

      case 1:
        w = 0, _w = 0;
    while(_w<nbwords){
      dest_feat0[_w] = src_feat0[w];
      _w++; w+=step;
    }
      break;

      case 2:
        w = 0, _w = 0;
    while(_w<nbwords){
      dest_feat0[_w] = src_feat0[w];
      dest_feat1[_w] = src_feat1[w];
      _w++; w+=step;
    }
      break;

      case 3:
        w = 0, _w = 0;
    while(_w<nbwords){
      dest_feat0[_w] = src_feat0[w];
      dest_feat1[_w] = src_feat1[w];
      dest_feat2[_w] = src_feat2[w];
      _w++; w+=step;
    }
      break;
    }        
  } 

  _tprintf_("\tdeinterlace_even: %5.3f ms\n", (get_wall_time()-time)/1000);
  return OK;
}*/
