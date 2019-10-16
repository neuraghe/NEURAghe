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
#ifndef _hello_world_
#define _hello_world_

#include "neuconvnet.h"
#include "soc_drivers.h"


/*

your code here

*/




void cnnMainInit(VARNAME load_data_dir);
void cnnMain(DATA* image, DATA* results);
void init_platform(char* bitstream);
void free_platform();



#endif
