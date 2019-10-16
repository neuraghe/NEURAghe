#ifndef SPATCONV_HW_H
#define SPATCONV_HW_H

#ifdef __cplusplus
extern "C" {
#endif

#include "spatconv.h"

int spatconv_forward_hw(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                     	SIZE out_s[3], SIZE stride[2], SIZE pad[2], bool activate, int qf, int precision8);

int basicBlock_hw(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                    SIZE out_s[3], SIZE stride[2], SIZE pad[2], SIZE pooling_hw, 
                    SIZE pooling_method, bool activate, int qf);

int spatconv_forward_hw_sync(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                     	SIZE out_s[3], SIZE stride[2], SIZE pad[2], bool activate, int qf);

int basicBlock_hw_sync(SPATCONV sc, DATA* input, DATA* output, SOCMAP soc, SIZE in_s[3],
                    SIZE out_s[3], SIZE stride[2], SIZE pad[2], SIZE pooling_hw, 
                    SIZE pooling_method, bool activate);

RET spatconv_merge_hw(DATA* out, DATA** b, SIZE out_s[3], SIZE kernel_size, SIZE stride[2], bool activate, int qf);

RET deinterlace (DATA* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2]);
RET deinterlace_even (DATA* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2]);
RET deinterlace2float(float* dest, DATA* src, int n_feat, int height, int width, SIZE stride[2]);
RET interlace (DATA* dest, DATA* src, int KS, int n_feat, int height, int width);

RET spatconv_wait(SOCMAP soc, int job_id);
RET place_zeros(uint32_t* data, SIZE out_s[3]);

#ifdef __cplusplus
}
#endif
#endif
