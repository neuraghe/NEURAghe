#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <math.h>

#include "convoluzione.h"


int main()
{
    
    unsigned int i,j,o,in,w,k,zero_pad_h, zero_pad_w;
     
   
    unsigned iw = _IW_;
    
    #ifndef NEU_TCN
		  if(CONV_WIDTH == 8)
		      while(iw%(4))
		        iw++;
		  else if(CONV_WIDTH == 16)
		      while(iw%(2))
		        iw++;
		#endif
      
   if(zero_pad_on)
    if(FS_h==1)
      zero_pad_h = 0;
    else
      zero_pad_h = (FS_h-1)/2;
   else
    zero_pad_h = 0;
    
   if(zero_pad_on)
    if(FS_w==1)
      zero_pad_w = 0;
    else
      zero_pad_w = (FS_w-1)/2;
   else
    zero_pad_w = 0;
   
   unsigned int OW= iw - (FS_w-1)*DIL_w*(1-zero_pad_on)*(1-!(_IW_>1));
   unsigned int OH= _IH_ - (FS_h-1)*DIL_h*(1-zero_pad_on)*(1-!(_IH_>1));
   
/*   unsigned int _of = _OF_;*/
/*   unsigned int _if = IF;*/
/*   */
/*   while(_of%N_ROW)*/
/*    _of++;*/
/*   while(_if%N_COL)*/
/*    _if++;*/
   
   DATA *inp = (DATA*)malloc(_IF_*_IH_*_IW_*sizeof(DATA));
   DATA *output = (DATA*)malloc(_OF_*OH*OW*sizeof(DATA));
   DATA *bias = (DATA*)malloc(_OF_*sizeof(DATA));
   DATA *kernel = (DATA*)malloc(FS_h * FS_w * _OF_ * _IF_*sizeof(DATA));
   DATA *input = (DATA*)malloc(_IF_*_IH_*iw*sizeof(DATA));
   DATA *out = (DATA*)malloc(_OF_*OH*(OW-(iw-_IW_))*sizeof(DATA));
   
   short int *file_sim = (short int*)malloc(_OF_*OH*OW/sizediv*sizeof(short int));
   DATA *out_sim = (DATA*)malloc(_OF_*OH*OW*sizeof(DATA));
   DATA *out_sim_post = (DATA*)malloc(_OF_*OH*(OW-(iw-_IW_))*sizeof(DATA));
   

   
//BIAS
    for(o=0; o<_OF_; o++){
      bias[o] = 0;
    }
    
//KERNEL

for(o=0; o<_OF_*_IF_; o++){
    for(w=0; w<FS_h*FS_w; w++){
      if(w<FS_h*FS_w){
        kernel[w + o*FS_h*FS_w] = 0;
      }
    }
  }
  for(o=0; o<_OF_; o++){
    for(i=0; i<_IF_; i++){
      for(w=0; w<FS_h*FS_w; w++){
          kernel[w + i*FS_h*FS_w + o*_IF_*FS_h*FS_w] = //0x7fff; 
                                            //rand()%0xffff; 
                                            rand()%8; 
                                            //(1*w);
                                            //i + o*_IF_;
                                            //1*w;
      }
    }
  }
  
//file write for sim

FILE* w_sw;
 w_sw = fopen("../ddr_emulation/w_sw.txt","w");
 
 for(i=0; i<FS_h*FS_w*_IF_*_OF_; i++){
    fprintf(w_sw,"%d\n",kernel[i]);
  }
  
  fclose(w_sw);
  
 FILE* b_sw;
 b_sw = fopen("../ddr_emulation/b_sw.txt","w");
 
 for(i=0; i<_OF_; i++){
    fprintf(b_sw,"%d\n",bias[i]);
  }
  
  fclose(b_sw);
 
  
#ifdef STAMPA 
   printf("\n kernel \n");
   for(o=0; o<_OF_;o++){
    for(in=0; in<_IF_; in++){
			for(i=0; i<FS_h; i++){
				for(j=0; j<FS_w; j++){
						printf("%x\t", kernel[(i*FS_h)+j+(o*_IF_*FS_h*FS_w)+(in*FS_h*FS_w)]);
				}
				printf("\n");
			}
			printf("\n");
		}
    }
#endif
    
//INPUT 
    for(in=0; in<_IF_;in++){
      for (i=0;i<_IH_*_IW_;i++){
            if(in>_IF_)
              inp[i+in*_IH_*_IW_]=0;
            else
              inp[i+in*_IH_*_IW_]= //i%_IH_;
                               rand()%8;
                               //rand()%2^CONV_WIDTH;
                               //(i*1)%(unsigned int)pow(2,CONV_WIDTH);
                               //in+1;
                               //i+(in*_IH_*_IW_);
                               //i;
            }
    }
    
    printf("%d",(unsigned int)pow(2,CONV_WIDTH));
    
#ifdef STAMPA
    printf("\n input \n");
    for(in=0; in<_IF_;in++){
		for(i=0; i<_IH_; i++){
			for(j=0; j<_IW_; j++){

				printf("%x\t", (unsigned short int)inp[(i*_IW_)+j+(in*_IH_*_IW_)]);
			}
			printf("\n");
		}
		printf("\n");
    }
#endif
   

  preprocessing(inp, input, _IW_, iw, _IH_, _IF_);
  
  //scrivo su file per ddr e sim
   
     FILE* x_ddr;
     x_ddr = fopen("../ddr_emulation/x.txt","w"); ///home/nur/neuraghe/sw/nuraghe_MW/ddr_emulation/x.txt
     
     for(i=0; i<_IF_*_IH_*iw; i++){
        fprintf(x_ddr,"%d\n",input[i]);
      }
      
      fclose(x_ddr);

#ifdef STAMPA
   printf("\ninput post processed\n");   
   for(in=0; in<_IF_;in++){
		for(i=0; i<_IH_; i++){
			for(j=0; j<iw; j++){

				printf("%x\t", (unsigned short int)input[(i*iw)+j+(in*_IH_*iw)]);
			}
			printf("\n");
		}
		printf("\n");
    }
#endif
    

    convoluzione(input, output, kernel, bias, _IF_,  _IH_,  iw,  _OF_,  OH, OW, FS_h, FS_w, zero_pad_h, zero_pad_w, STRIDE, DIL_h, DIL_w, QF, N_COL);
    

    postprocessing(output, out, _IW_, iw, OW, OH, _OF_);

#ifdef STAMPA
    printf("\n out post processed \n");  
    for(o=0; o<_OF_;o++){
        for(i=0; i<OH; i++){
          for(j=0; j<OW-(iw-_IW_); j++){
            printf("%x\t",(unsigned short int)out[o*OH*(OW-(iw-_IW_)) + i*(OW-(iw-_IW_)) + j]);
          }
          printf("\n");
        }
        printf("\n");
      }
#endif
   
   //OUTPUT FILE SIM   
   FILE* fp;
   fp = fopen("../ddr_emulation/y_hw.txt","r"); ///home/nur/neuraghe/sw/nuraghe_MW/ddr_emulation/y_hw.txt
   
   for(i=0; i<_OF_*OW*OH; i++){
      fscanf(fp,"%hd",&file_sim[i]);
    }
    
    fclose(fp);
    
    //FROM INT TO DATA
    if(CONV_WIDTH == 8){
      for(i=0; i<_OF_*OW*OH; i++){
        out_sim[i*2] = file_sim[i];
        out_sim[(i*2)+1] = file_sim[i]>>8;
      }
    }
    else {
      for(i=0; i<_OF_*OW*OH; i++){
        out_sim[i] = file_sim[i];
    }
    }

#ifdef STAMPA
    printf("\n out_sim\n\n");
    for(o=0; o<_OF_;o++){
        for(i=0; i<OH; i++){
          for(j=0; j<OW; j++){
            printf("%x\t",(unsigned short int)out_sim[o*OH*(OW) + i*(OW) + j]);
          }
          printf("\n");
        }
        printf("\n");
      }
#endif
      
    postprocessing(out_sim, out_sim_post, _IW_, iw, OW, OH, _OF_);
    
#ifdef STAMPA
    printf("\n out_sim_post\n\n");
    for(o=0; o<_OF_;o++){
        for(i=0; i<OH; i++){
          for(j=0; j<OW-(iw-_IW_); j++){
            printf("%x\t",(unsigned short int)out_sim_post[o*OH*(OW-(iw-_IW_)) + i*(OW-(iw-_IW_)) + j]);
          }
          printf("\n");
        }
        printf("\n");
      }
#endif
     
     //CONFRONTO 
     print_simvssw(out_sim_post, out, _IW_, iw, OW, OH, _OF_);
     
     printf("\n IHxIW = %dx%d, IF=%d, OF=%d, FS_h=%d, FS_w=%d\n",_IH_,_IW_,_IF_,_OF_,FS_h, FS_w);
     
/*     int dividendo;// = 3;*/
/*     int divisore = 4;*/
/*     int resto,quoziente;*/
/*     for(dividendo=0; dividendo<20; dividendo++){*/
/*      quoziente = dividendo/divisore;*/
/*      resto = dividendo%divisore;*/
/*      printf("\n%d/%d: quoziente: %d, resto: %d\n",dividendo, divisore, quoziente,resto);*/
/*      }*/
/*     */
/*     int shift = 4;*/
/*     shift = shift >> 1;*/
/*     */
/*     printf("\n shift: %d\n",shift);*/
    
    
/*   free(inp);*/
/*   free(output);*/
/*   free(bias);*/
/*   free(kernel);*/
/*   free(input);*/
/*   free(out);*/
/*   free(file_sim);*/
/*   free(out_sim);*/
/*   free(out_sim_post);*/
    return 0;
}


void print(char *str);

/*
██████╗ ██████╗ ███████╗██████╗ ██████╗  ██████╗  ██████╗███████╗███████╗███████╗██╗███╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██╔════╝██╔════╝██╔════╝██║████╗  ██║██╔════╝ 
██████╔╝██████╔╝█████╗  ██████╔╝██████╔╝██║   ██║██║     █████╗  ███████╗███████╗██║██╔██╗ ██║██║  ███╗
██╔═══╝ ██╔══██╗██╔══╝  ██╔═══╝ ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║╚════██║██║██║╚██╗██║██║   ██║
██║     ██║  ██║███████╗██║     ██║  ██║╚██████╔╝╚██████╗███████╗███████║███████║██║██║ ╚████║╚██████╔╝
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════
*/

void preprocessing(DATA* pre, DATA* pre_out, unsigned int IW, unsigned int iw, unsigned int IH, unsigned int IF){
  
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

/*
██████╗  ██████╗ ███████╗████████╗██████╗ ██████╗  ██████╗  ██████╗███████╗███████╗███████╗██╗███╗   ██╗ ██████╗ 
██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝██╔════╝██╔════╝██╔════╝██║████╗  ██║██╔════╝ 
██████╔╝██║   ██║███████╗   ██║   ██████╔╝██████╔╝██║   ██║██║     █████╗  ███████╗███████╗██║██╔██╗ ██║██║  ███╗
██╔═══╝ ██║   ██║╚════██║   ██║   ██╔═══╝ ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║╚════██║██║██║╚██╗██║██║   ██║
██║     ╚██████╔╝███████║   ██║   ██║     ██║  ██║╚██████╔╝╚██████╗███████╗███████║███████║██║██║ ╚████║╚██████╔╝
╚═╝      ╚═════╝ ╚══════╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
*/                                                                                                                 

void postprocessing(DATA* post, DATA* post_out, unsigned int IW, unsigned int iw, unsigned int OW, unsigned int OH, unsigned int OF){
  
  unsigned int o,i,j;
  
  for(o=0; o<OF;o++){
        for(i=0; i<OH; i++){
          for(j=0; j<(OW-(iw-IW)); j++){
            post_out[o*OH*(OW-(iw-IW)) + i*(OW-(iw-IW)) + j] = post[o*OH*OW + i*OW + j];
          }
        }
      }
}


void print_simvssw(DATA* out_sim, DATA* out_sw, unsigned int IW, unsigned int iw, unsigned int OW, unsigned int OH, unsigned int OF){

    int checksum_hw=0, checksum_sw=0;
    int e=0;
    int i;
    

    for (i=0; i<OF*OH*(OW-(iw-IW)); i++){
    
       if (out_sim[i]!=out_sw[i]){
       
         if (e< MAXERR )          //|| hw_out[i] - sw_out[i]>10 || sw_out[i]-hw_out[i] >10)
           printf("%05d SIM: 0x%04x != SW: 0x%04x\n", i, (unsigned short int)out_sim[i] ,(unsigned short int)out_sw[i]);
           
         e++;
       }
       
       else if (i<50)
         printf("          %05d SIM: 0x%04x == SW: 0x%04x\n", i, (unsigned short int)out_sim[i] ,(unsigned short int)out_sw[i]);
      checksum_hw+=out_sim[i];
      checksum_sw+=out_sw[i];
    }
    printf("\ntotal errors: %05d\n", e );
    printf("checksum_sw: %d\n", checksum_sw );
    printf("checksum_hw: %d\n", checksum_hw );
    printf("avg_err: %f\n", (float)(checksum_sw-checksum_hw)/(float)e );
}

/*
███████╗ █████╗ ████████╗██╗   ██╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
███████╗███████║   ██║   ██║   ██║██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
*/                                                                                 

int sat(int mac){
  
  int mac_out;
  
  if((mac & 0xffffff80) == 0xffffff80 | (mac & 0xffffff80) == 0){
	  mac_out = mac;
	  }
	else{
	    if(mac & 0xffff8000)
	      mac_out = 0xffffff80;
	    else
	      mac_out = 0x0000007f;
	  }
	  
	  return mac_out;
}

long long int sat16(long long int mac){
  
  long long int mac_out;
  
 
  
  if((mac & 0xffffffffffff8000) == 0xffffffffffff8000 | (mac & 0xffffffffffff8000) == 0){
	  mac_out = mac;
	  }
	else{
	    if(mac & 0xffffffff80000000)
	      mac_out = 0xffffffffffff8000;
	    else
	      mac_out = 0x0000000000007fff;
	  }
	  
	  
	  return mac_out;
}

/*
 ██████╗ ██████╗ ███╗   ██╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗
██╔════╝██╔═══██╗████╗  ██║██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║
██║     ██║   ██║██╔██╗ ██║██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║
██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║
╚██████╗╚██████╔╝██║ ╚████║ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
*/                                                                                           

void convoluzione(DATA* input, DATA* output, DATA* kernel, DATA* bias,
		unsigned int IF, unsigned int IH, unsigned int IW, unsigned int OF, unsigned int OH, unsigned int OW,
		unsigned int fs_h, unsigned int fs_w, unsigned int zero_pad_h, unsigned int zero_pad_w, unsigned int stride, 
		unsigned int dil_h, unsigned int dil_w, unsigned int qf, unsigned int ncol) {


	int bi; //out[OF*OH*OW];
	int *out = (int*)malloc(OF*OH*OW*sizeof(int));
	DATA current, curr_kern;
	unsigned int if_count = 0;
	unsigned int _MIN_IF = 0;
  
  if(IF<ncol)
    _MIN_IF = IF;
  else{
  	#ifdef NEU_TCN
    	_MIN_IF = ncol;
    #else
    if(fs_w == 5)
			_MIN_IF = ncol;
		if(fs_w == 3 || fs_w == 1)
			_MIN_IF = ncol*3;
	  #endif
  	}
    
     
    if(_MIN_IF!=0){

        if( (IF % _MIN_IF) > 0 )
            IF = (IF/_MIN_IF + 1) * _MIN_IF;         
    }
    printf("\n_MIN_IF: %d\n",_MIN_IF);
	
	int mac;
	
	unsigned int k,i,j;

	unsigned int outf, oh, ow, inpf, k_h, k_w;


	for (outf = 0; outf < OF; outf++) {										//per ogni OF

		//printf("outf = %d\n",outf);

		bi = bias[outf];													//carica i bias per quella OF

		for (oh = 0; oh < OH; oh++) {										//per ogni riga dell'OF
			for (ow = 0; ow < OW; ow++) {									//per ogni colonna dell'OF

				//printf("oh = %d, ow = %d\n", oh,ow);

				mac = bi << qf;       //carica nella mac finale i bias

				for (inpf = 0; inpf < IF; inpf++){							//per ogni IF

					//printf("inpf = %d\n",inpf);

					for (k_h = 0; k_h < fs_h; k_h++){					//per ogni riga del kernel

						//printf("k_h = %d\n",k_h);

						int hin = stride * oh + k_h*dil_h - zero_pad_h;				//calcola la posizione utile in h della IF in dipendenza dalla stride e dallo zero padding

						//printf("posizione hin = %d\n",hin);

						if ((hin >= 0 &&  hin < IH) == 0)					//verifica che non sia fuori dalle dimensioni di riga della IF
							continue;

						for (k_w = 0; k_w < fs_w; k_w++) {				//per ogni colonna del kernel

							//printf("k_w = %d\n",k_w);

							int win = stride * ow + k_w*dil_w - zero_pad_w;			//calcola la posizione utile in h della IF in dipendenza dallo stride e dallo zero padding

							//printf("posizione win = %d\n",win);

							if ((win >= 0 && win < IW) == 0)				//verifica che non sia fuori dalle dimensioni di colonna della IF
								continue;
								
              if(CONV_WIDTH == 8)
							  current = (input[(inpf*IH + hin)*IW + win]== -128)? -127 : input[(inpf*IH + hin)*IW + win];
							else if(CONV_WIDTH == 16)
							  current = input[(inpf*IH + hin)*IW + win];

							curr_kern = kernel[((outf*IF + inpf)*fs_h + k_h)*fs_w + k_w];

							mac += current * curr_kern;
							//printf("\ninput: %x * kernel: %x = mul: %x \n", current, curr_kern, current*curr_kern);
					}
				}
				
				//if(fs==3 || fs==5 || fs==1 || fs==7 || fs==9) {
            if_count++;
            //if(((fs == 3 || fs==1) && if_count == _MIN_IF) || ((fs == 5 || fs == 7 || fs==9) && if_count == _MIN_IF)) {
            if(if_count == _MIN_IF) {
		          //LA SATURAZIONE VA GESTITA PER OGNI IG
		          if(CONV_WIDTH == 8)
		            mac = sat(mac >> qf)  << qf;
		          else if(CONV_WIDTH == 16)
		            mac = sat16(mac >> qf)  << qf;
              if_count = 0;
            }
          //}
    	
			}

				out[(outf*OH + oh)*OW + ow] = mac;						//ogni mac relativa a una finestra di conv costituisce il pxl dell'OF
				
				//printf("\n out[%d] -> %04x\n",(outf*OH + oh)*OW + ow,mac);

		}

		}

	}
	
#ifdef STAMPA
	printf("\n out \n\n");
	for(k=0; k<OF;k++){
    	for(i=0; i<OH; i++){
			for(j=0; j<OW; j++){
					printf("%x\t", (unsigned short int)out[(i*OW)+j+(k*OH*OW)]);
			}
			printf("\n");
		}
    	printf("\n");
    }
 #endif
	
	//shift
	
	for(i=0; i<OF*OH*OW; i++)	
	  output[i] = out[i] >> qf;
	  
#ifdef STAMPA	
	printf("\n out shifted \n\n");
	for(k=0; k<OF;k++){
    	for(i=0; i<OH; i++){
			for(j=0; j<OW; j++){
					printf("%x\t", (unsigned short int)output[(i*OW)+j+(k*OH*OW)]);
			}
			printf("\n");
		}
    	printf("\n");
    }
#endif
	
}
