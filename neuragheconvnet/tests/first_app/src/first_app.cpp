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
 * File:        first_app.cpp                                                
 * Description: Auto generated project. Edit it as you like                   *
 *                                                                            *
 ******************************************************************************/
#include "first_app.h"

SOCMAP socs[_NCLUSTER_]; // the number of cluster is defined in soc_drivers. ARRUBIU has two clusters, LOSA just one
DATA* wPointer;


/*

conv layers structures here

*/

SPATCONV conv0_param;

SPATCONV conv1_param;


static DATA conv0w[500];

/*
##########################
         INIT MAIN
##########################
*/

void cnnMainInit(VARNAME load_data_dir)
{
  // load_data_dir is the folder where to get the data
  printf("[cnnMainInit] Hello world from the project first_app!\n");
  
  _dprintf_(YELLOW "printed only if DEBUG=1 and RELEASE=0\n" NC);
  _tprintf_(GREEN "printed only if TIME=1\n" NC);
  _rprintf_("printed when RELEASE=0\n");
  _cprintf_(RED "printed when CI=1\n" NC);
  



  
	conv0_param = spatconv_create(); // create the struct
	conv0_param->pout = 20; // number of out features
	conv0_param->pin = 1; // number of input feat
	conv0_param->kern_s[0] = 20; // number of out features
	conv0_param->kern_s[1] = 1;  // number of input feat
	conv0_param->kern_s[2] = 5;  // height of the kernel
	conv0_param->kern_s[3] = 5;  // width of the kernel
	conv0_param->maxog = 4;  // tricky parameter

  
// initializa of conv 0
  load_fixed("/home/nur/NEURAghe/neuragheconvnet/tests/first_app/weights/_Conv0_weights_.bin",12288,wPointer);
	conv1_param->kernel = wPointer;
	wPointer = wPointer + 12288;








  
	conv1_param = spatconv_create(); // create the struct
	conv1_param->pout = 50; // number of out features
	conv1_param->pin = 20; // number of input feat
	conv1_param->kern_s[0] = 50; // number of out features
	conv1_param->kern_s[1] = 20;  // number of input feat
	conv1_param->kern_s[2] = 5;  // height of the kernel
	conv1_param->kern_s[3] = 5;  // width of the kernel
	conv1_param->maxog = 4;  // tricky parameter

// initializa of conv 1

  load_fixed("/home/nur/NEURAghe/neuragheconvnet/tests/first_app/weights/_Conv1_weights_.bin",7657657,wPointer);
	conv1_param->kernel = wPointer;
	wPointer = wPointer + 7657657;






// weights and bias load FC0,1,...

  
/*

conv layer initialization here:
- parameters definition
- data loading

*/

}




/*
##########################
         MAIN
##########################
*/

void cnnMain(DATA* image, float* results)
{
// the host application provides the image data and expects the results of the processing.
printf ("[cnnMain] Hello world from the project first_app!\n");


spatcon_hw(conv0_params, out_pointer, image, );

int id= spatconv_forward_hw(conv0_param, //parameters
socs[0]->in, // input pointer
socs[0]->out, // output pointer
socs[0], // soc on which map the conv 
(SIZE*)in_s_0, // input size feature maps, kw, kh
(SIZE*)out_s_0, // numberf of output features
stride, // only stride 1
pad, // pad=1 do the zero padding
activate, // relu function
_QF_, // the number of decimal bits ex: 10
PRECISION8 //0=16 bits, 1=8bits
);

spatconv_wait(socs[0], id);  


 id= spatconv_forward_hw(conv_params_hw_1, //parameters
socs[0]->out, // input pointer
socs[0]->in, // output pointer
socs[0]->out, // output pointer
socs[0], // soc on which map the conv 
(SIZE*)in_s_1, // input size feature maps, kw, kh
(SIZE*)out_s_1, // numberf of output features
stride, // only stride 1
pad, // pad=1 do the zero padding
activate, // relu function
_QF_, // the number of decimal bits ex: 10
PRECISION8 //0=16 bits, 1=8bits
);

spatconv_wait(socs[0], id);  

     


/*

the net flow goes here

*/

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

