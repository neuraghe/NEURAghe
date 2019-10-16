/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     NURAGHE - Accelerator for Convolutional neural network        *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/
#ifndef CNN_H_
#define CNN_H_

#include "types.h"

#include "ConvLayer.h"
#include "PoolLayer.h"
#include "FullLayer.h"
#include "SoftmaxLayer.h"


#include "../weights_biases/wb_layer0.h"
#include "../weights_biases/wb_layer1.h"

#include "../weights_biases/bias_full.h"
#include "../weights_biases/weights_full.h"

#include "../weights_biases/bias_softmax.h"
#include "../weights_biases/weights_softmax.h"

#include "../images/images.h"
#include "../images/labels.h"

#include "../cnn_layers/DebuggingFunctionSet.h"
#include "../images/mnist_first_image.h"

#include "../colors.h"


#endif
