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
#include "hello_world.h"

SOCMAP socs[2];
DATA* wPointer;



/*
##########################
         INIT MAIN
##########################
*/

void cnnMainInit(VARNAME load_data_dir)
{
  // load_data_dir is the folder where to get the data
  printf("[cnnMainInit] Hello world!\n");
  
  _dprintf_(YELLOW "printed only if DEBUG=1 and RELEASE=0\n" NC);
  _tprintf_(GREEN "printed only if TIME=1\n" NC);
  _rprintf_("printed when RELEASE=0\n");
  _cprintf_(RED "printed when CI=1\n" NC);

}




/*
##########################
         MAIN
##########################
*/

void cnnMain(DATA* image, float* results)
{
// the host application provides the image data and expects the results of the processing.
printf ("[cnnMain] Hello world!\n");

}






/*
##########################
         STUFF
##########################
*/

void init_platform(char* bitstream){ // called in codes/modnet2/src/app/neuconvnet.cpp
  init_soc(socs, &wPointer, _MAXMEM_, 0, bitstream);
}

void free_platform(){
  munmap_soc(socs);
  int i;	
  for (i=0; i<_NCLUSTER_; i++)
    free(socs[i]);
}

