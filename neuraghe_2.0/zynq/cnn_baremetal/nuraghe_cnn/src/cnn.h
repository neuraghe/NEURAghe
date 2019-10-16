

#include "./cnn_layers/types.h"
#include "./cnn_layers/ConvLayer.h"
#include "./cnn_layers/PoolLayer.h"
#include "./cnn_layers/FullLayer.h"
#include "./cnn_layers/SoftmaxLayer.h"
#include "./weights_biases/bias_layer0.h"
#include "./weights_biases/bias_layer1.h"
#include "./weights_biases/bias_full.h"
#include "./weights_biases/bias_softmax.h"
#include "./weights_biases/weights_layer0.h"
#include "./weights_biases/wb1.h"
#include "./weights_biases/weights_full.h"
#include "./weights_biases/weights_softmax.h"
#include "./weights_biases/wb_layer0.h"
#include "./weights_biases/wb_layer1.h"
#include "./images/images.h"
#include "./images/labels.h"
#include "./cnn_layers/DebuggingFunctionSet.h"
#include "./images/mnist_first_image.h"
#include "./colors.h"

void print_stream (short int * stream, int h, int w, int n_feat);
int cnn_exec();
void zeros (short int * array, int len);
void interlace4 (int * s0, int * s1, int * s2, int * s3, int * dest, int len_src_B);
void deinterlace4 (int * d0, int * d1, int * d2, int * d3, int * src, int len_dest_B);
void deinterlace (int * dest, int * src, int n, int len_dest_B);
void interlace   (int * dest, int * src, int n, int len_dest_B);
