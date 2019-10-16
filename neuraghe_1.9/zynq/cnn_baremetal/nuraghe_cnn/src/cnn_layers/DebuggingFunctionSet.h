/*
 * DebuggingFunctionSet.h
 *
 *  Created on: May 30, 2016
 *      Author: alessandro
 */
/***********************************************************************************
 *                                                                                 *
 *                   EOLAB @ DIEE - University of Cagliari                         *
 *                          Via Marengo, 2, 09123                                  *
 *                       Cagliari - phone 070 675 5009                             *
 *                                                                                 *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it                 *
 *                                                                                 *
 * Project:     Convolutional neural network                                       *
 * File:        DebuggingFunctionSet.h                                             *
 * Description: Header declaring some useful debugging procedures                  *
 *                                                                                 *
 ***********************************************************************************/

#ifndef DEBUGGINGFUNCTIONSET_H_
#define DEBUGGINGFUNCTIONSET_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "types.h"

void print_features(data_t *features, int n, int height, int width);
void print_relative_errors(data_t *features, int n);
void print_full(data_t *features, int dim);

#endif /* DEBUGGINGFUNCTIONSET_H_ */
