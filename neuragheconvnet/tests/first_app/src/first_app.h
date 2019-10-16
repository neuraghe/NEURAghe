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
 * File:        first_app.h                                                  
 * Description: Auto generated project. Edit it as you like                   *
 *                                                                            *
 ******************************************************************************/
#ifndef _first_app_
#define _first_app_

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
