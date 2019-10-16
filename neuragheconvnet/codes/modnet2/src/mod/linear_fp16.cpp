#include "linear_fp16.h"
#include "spatconv.h"
#include "xassert.h"

#ifdef _ARM_
#include "arm_neon.h"
#define NEON_BLOCK 8
#define PREFETCH_OFFSET 64
#endif

static inline RET linear_fp16_forward_sw_core(int16_t* input, int16_t* output, SIZE in_s, SIZE out_s,
        int16_t* weights, int16_t* bias, int qf) {

#ifdef _ARMtodo_
    // ASSERT(in_s%NEON_BLOCK==0,"%s", "Error: linear kernel, we assume the size of input tensor multiple of 8");
    // ASSERT(out_s%NEON_BLOCK==0,"%s", "Error: linear kernel, we assume the size of output tensor multiple of 8");
    // ASSERT(((uint32_t)output%16)==0,"%s", "Error: linear kernel, we assume the address of the output tensor aligned to 16");
    // ASSERT(((uint32_t)input%16)==0,"%s", "Error: linear kernel, we assume the address of the input tensor aligned to 16");
    // ASSERT(((uint32_t)weights%16)==0,"%s", "Error: linear kernel, we assume the address of the weights tensor aligned to 16");
    // ASSERT(((uint32_t)bias%16)==0,"%s", "Error: linear kernel, we assume the address of the bias tensor aligned to 16");

    #pragma omp parallel for schedule(static,32)
    for (uint32_t hkern = 0; hkern < out_s; hkern+=NEON_BLOCK>>1) {
        int32x4_t mac_out_block;

        int16x4_t bias_block = vld1_s16 (&bias[hkern]);
        int32x4_t bias_blockw = vmovl_s16(bias_block);
        //Shift bias
        bias_blockw = vshlq_n_s32(bias_blockw,qf);

        for (uint32_t iblock = 0; iblock < 2; iblock++){
            int32x4_t mac_block0 = vmovq_n_s32(0);
            int32x4_t mac_block1 = vmovq_n_s32(0);
            ITER hkern_offset0 = (hkern+0+2*iblock)*in_s;
            ITER hkern_offset1 = (hkern+1+2*iblock)*in_s;
            
            __builtin_prefetch(&weights[hkern_offset0 + PREFETCH_OFFSET]);
            __builtin_prefetch(&weights[hkern_offset1 + PREFETCH_OFFSET]);
            __builtin_prefetch(&input[PREFETCH_OFFSET]);
            
            for (uint32_t wkern = 0; wkern < in_s; wkern+=NEON_BLOCK<<1){
                
                int16x8_t w_block0 = vld1q_s16(&weights[hkern_offset0 +wkern]);
                int16x8_t w_block1 = vld1q_s16(&weights[hkern_offset1 +wkern]);
                int16x8_t in       = vld1q_s16(&input[wkern]);

                __builtin_prefetch(&weights[hkern_offset0 +wkern+PREFETCH_OFFSET]);
                __builtin_prefetch(&weights[hkern_offset1 +wkern+PREFETCH_OFFSET]);
                __builtin_prefetch(&input[wkern+PREFETCH_OFFSET]);

                mac_block0 = vmlal_s16(mac_block0, vget_low_s16(in), vget_low_s16(w_block0));
                mac_block1 = vmlal_s16(mac_block1, vget_low_s16(in), vget_low_s16(w_block1));

                mac_block0 = vmlal_s16(mac_block0, vget_high_s16(in), vget_high_s16(w_block0));
                mac_block1 = vmlal_s16(mac_block1, vget_high_s16(in), vget_high_s16(w_block1));

                w_block0 = vld1q_s16(&weights[hkern_offset0 +wkern + NEON_BLOCK]);
                w_block1 = vld1q_s16(&weights[hkern_offset1 +wkern + NEON_BLOCK]);
                in       = vld1q_s16(&input[wkern + NEON_BLOCK]);

                mac_block0 = vmlal_s16(mac_block0, vget_low_s16(in), vget_low_s16(w_block0));
                mac_block1 = vmlal_s16(mac_block1, vget_low_s16(in), vget_low_s16(w_block1));

                mac_block0 = vmlal_s16(mac_block0, vget_high_s16(in), vget_high_s16(w_block0));
                mac_block1 = vmlal_s16(mac_block1, vget_high_s16(in), vget_high_s16(w_block1));
            }

            if(!iblock){
                //Reduction block 0
                int32_t mac0 = 0;
                mac0 += vgetq_lane_s32 (mac_block0, 0);
                mac0 += vgetq_lane_s32 (mac_block0, 1);
                mac0 += vgetq_lane_s32 (mac_block0, 2);
                mac0 += vgetq_lane_s32 (mac_block0, 3);
                mac_out_block = vsetq_lane_s32(mac0,mac_out_block,0);

                //Reduction block 1
                int32_t mac1 = 0;
                mac1 += vgetq_lane_s32 (mac_block1, 0);
                mac1 += vgetq_lane_s32 (mac_block1, 1);
                mac1 += vgetq_lane_s32 (mac_block1, 2);
                mac1 += vgetq_lane_s32 (mac_block1, 3);     
                mac_out_block = vsetq_lane_s32(mac1,mac_out_block,1);
            }
            else{
                //Reduction block 0
                int32_t mac0 = 0;
                mac0 += vgetq_lane_s32 (mac_block0, 0);
                mac0 += vgetq_lane_s32 (mac_block0, 1);
                mac0 += vgetq_lane_s32 (mac_block0, 2);
                mac0 += vgetq_lane_s32 (mac_block0, 3);
                mac_out_block = vsetq_lane_s32(mac0,mac_out_block,2);

                //Reduction block 1
                int32_t mac1 = 0;
                mac1 += vgetq_lane_s32 (mac_block1, 0);
                mac1 += vgetq_lane_s32 (mac_block1, 1);
                mac1 += vgetq_lane_s32 (mac_block1, 2);
                mac1 += vgetq_lane_s32 (mac_block1, 3);     
                mac_out_block = vsetq_lane_s32(mac1,mac_out_block,3);
            }
        }

        //Add Bias
        mac_out_block = vaddq_s32(mac_out_block,bias_blockw);

        //Saturate
        int32x4_t vMAX = vdupq_n_s32(_MAX_);
        mac_out_block = vshrq_n_s32(mac_out_block,qf);
        mac_out_block = vminq_s32(mac_out_block,vMAX);

        //Store
        vst1_s16(&output[hkern], vmovn_s32(mac_out_block));
    }
#else

    /* foreach row in kernel */
    #pragma omp parallel for schedule(static)
    for (ITER hkern = 0; hkern < out_s; hkern++) {
        int32_t mac = ((int32_t)bias[hkern]) << qf;
        for (ITER wkern = 0; wkern < in_s; wkern++) {
            mac += input[wkern] * weights[hkern*in_s + wkern];
        }
        output[hkern] = (int16_t)saturate(mac >> qf, "linear");
    } 
#endif
    return OK;
}

RET linear_fp16_destroy(LINEAR_FP16 lin) {
    free(lin->weights);
    free(lin->bias);
    free(lin);
    return OK;
}

LINEAR_FP16 linear_fp16_create(void) {
    LINEAR_FP16 lin = (LINEAR_FP16) calloc(1, sizeof(struct Linear_fp16));
    return lin;
}

RET linear_fp16_init(LINEAR_FP16 lin, NAME weightsFile, NAME biasFile, SIZE in_s,
        SIZE out_s) {
    SIZE weight_s = out_s * in_s;
    SIZE bias_s = out_s;
    RET res = OK;

    lin->weights = (int16_t*) calloc(weight_s, sizeof(int16_t));
    lin->bias = (int16_t*) calloc(bias_s, sizeof(int16_t));

    res = load_f62tofp16_from_file(lin->weights, weightsFile, weight_s);
    ASSERT(res == OK, "%s", "loading kernel tensor failed");

    res = load_f62tofp16_from_file(lin->bias, biasFile, bias_s);
    ASSERT(res == OK, "%s", "loading bias tensor failed");

    lin->in_s = in_s;
    lin->out_s = out_s;
    return OK;
}

RET linear_fp16_forward(LINEAR_FP16 lin, int16_t* __restrict__ input, int16_t* __restrict__ output, SIZE in_s,
        SIZE out_s) {

    ASSERT(in_s == lin->in_s, "%s", "input size does not match");
    ASSERT(out_s == lin->out_s, "%s", "output size does not match");

    _tcreate_(time);
    linear_fp16_forward_sw_core(input, output, in_s, out_s, lin->weights,
            lin->bias, lin->qf);
    _tprintf_("Fully-Connected time: %5.3f ms\n", (get_wall_time()-time)/1000);

    return OK;
}
