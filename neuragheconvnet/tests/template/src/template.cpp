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
 * File:        {template}.cpp                                                
 * Description: Auto generated project. Edit it as you like                   *
 *                                                                            *
 ******************************************************************************/
#include "{template}.h"

SOCMAP socs[_NCLUSTER_]; // the number of cluster is defined in soc_drivers. ARRUBIU has two clusters, LOSA just one
DATA* wPointer;


/*

conv layers structures here

*/




/*
##########################
         INIT MAIN
##########################
*/

void cnnMainInit(VARNAME load_data_dir)
{
  // load_data_dir is the folder where to get the data
  printf("[cnnMainInit] Hello world from the project {template}!\n");
  
  _dprintf_(YELLOW "printed only if DEBUG=1 and RELEASE=0\n" NC);
  _tprintf_(GREEN "printed only if TIME=1\n" NC);
  _rprintf_("printed when RELEASE=0\n");
  _cprintf_(RED "printed when CI=1\n" NC);
  
  
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
printf ("[cnnMain] Hello world from the project {template}!\n");


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

