#include <stdint.h>

#define NUM_WEIGHT 10 

// 5x5 masks
static uint16_t mask_5x5_0 [10] = {
  0, 0, 1,
  0, 0, 1,
  1, 1, 2,
  0
};
static uint16_t mask_5x5_1 [10] = {
  1, 0, 0,
  1, 0, 0,
  2, 1, 1,
  0
};
static uint16_t mask_5x5_2 [10] = {
  1, 1, 2,
  0, 0, 1,
  0, 0, 1,
  0
};
static uint16_t mask_5x5_3 [10] = {
  2, 1, 1,
  1, 0, 0,
  1, 0, 0,
  0
};

// 7x7 masks
static uint16_t mask_7x7_0 [10] = {
  0, 0, 1,
  0, 0, 1,
  1, 1, 2,
  0
};
static uint16_t mask_7x7_1 [10] = {
  1, 0, 1,
  1, 0, 1,
  2, 1, 2,
  0
};
static uint16_t mask_7x7_2 [10] = {
  1, 0, 0,
  1, 0, 0,
  2, 1, 1,
  0
};
static uint16_t mask_7x7_3 [10] = {
  1, 1, 2,
  0, 0, 1,
  1, 1, 2,
  0
};
static uint16_t mask_7x7_4 [10] = {
  2, 1, 2,
  1, 0, 1,
  2, 1, 2,
  0
};
static uint16_t mask_7x7_5 [10] = {
  2, 1, 1,
  1, 0, 0,
  2, 1, 1,
  0
};
static uint16_t mask_7x7_6 [10] = {
  1, 1, 2,
  0, 0, 1,
  0, 0, 1,
  0
};
static uint16_t mask_7x7_7 [10] = {
  2, 1, 2,
  1, 0, 1,
  1, 0, 1,
  0
};
static uint16_t mask_7x7_8 [10] = {
  2, 1, 2,
  1, 0, 0,
  1, 0, 0,
  0
};

// 11x11 masks
static uint16_t mask_11x11_0 [10] = {
  0, 0, 0,
  0, 0, 0,
  0, 0, 0,
  0
};
static uint16_t mask_11x11_1 [10] = {
  0, 0, 1,
  0, 0, 1,
  0, 0, 1,
  0
};
static uint16_t mask_11x11_2 [10] = {
  1, 0, 0,
  1, 0, 0,
  1, 0, 0,
  0
};
static uint16_t mask_11x11_3 [10] = {
  0, 0, 0,
  0, 0, 0,
  0, 0, 0,
  0
};
static uint16_t mask_11x11_4 [10] = {
  0, 0, 0,
  0, 0, 0,
  1, 1, 1,
  0
};
static uint16_t mask_11x11_5 [10] = {
  0, 0, 1,
  0, 0, 1,
  1, 1, 2,
  0
};
static uint16_t mask_11x11_6 [10] = {
  1, 0, 0,
  1, 0, 0,
  2, 1, 1,
  0
};
static uint16_t mask_11x11_7 [10] = {
  0, 0, 0,
  0, 0, 0,
  1, 1, 1,
  0
};
static uint16_t mask_11x11_8 [10] = {
  1, 1, 1,
  0, 0, 0,
  0, 0, 0,
  0
};
static uint16_t mask_11x11_9 [10] = {
  1, 1, 2,
  0, 0, 1,
  0, 0, 1,
  0
};
static uint16_t mask_11x11_a [10] = {
  2, 1, 1,
  1, 0, 0,
  1, 0, 0,
  0
};
static uint16_t mask_11x11_b [10] = {
  1, 1, 1,
  0, 0, 0,
  0, 0, 0,
  0
};
static uint16_t mask_11x11_c [10] = {
  0, 0, 0,
  0, 0, 0,
  0, 0, 0,
  0
};
static uint16_t mask_11x11_d [10] = {
  0, 0, 1,
  0, 0, 1,
  0, 0, 1,
  0
};
static uint16_t mask_11x11_e [10] = {
  1, 0, 0,
  1, 0, 0,
  1, 0, 0,
  0
};
static uint16_t mask_11x11_f [10] = {
  0, 0, 0,
  0, 0, 0,
  0, 0, 0,
  0
};

void weight_loader_3x3(uint32_t weight_tcdm[10/2+1], uint16_t weight_priv[10], int size, int mask) {
  for(int i=0; i<10/2; i++) {
    weight_priv[i*2]   = ((uint16_t) ((weight_tcdm[i] & 0xffff0000) >> 16) ) >> ( (size<=3) ? 0 :
      (size==5) ? ( (mask==0) ? mask_5x5_0[i*2]   : (mask==1) ? mask_5x5_1[i*2]   : (mask==2) ? mask_5x5_2[i*2]   : mask_5x5_3[i*2]  ) :
      (size==7) ? ( (mask==0) ? mask_7x7_0[i*2]   : (mask==1) ? mask_7x7_1[i*2]   : (mask==2) ? mask_7x7_2[i*2]   : mask_7x7_3[i*2]  ) :
      (size==9) ? 0 :
      ( (mask==0)  ? mask_11x11_0[i*2]   : (mask==1)  ? mask_11x11_1[i*2]   : (mask==2)  ? mask_11x11_2[i*2]   : (mask==3)  ? mask_11x11_3[i*2]   :
        (mask==4)  ? mask_11x11_4[i*2]   : (mask==5)  ? mask_11x11_5[i*2]   : (mask==6)  ? mask_11x11_6[i*2]   : (mask==7)  ? mask_11x11_7[i*2]   :
        (mask==8)  ? mask_11x11_8[i*2]   : (mask==9)  ? mask_11x11_9[i*2]   : (mask==10) ? mask_11x11_a[i*2]   : (mask==11) ? mask_11x11_b[i*2]   :
        (mask==12) ? mask_11x11_c[i*2]   : (mask==13) ? mask_11x11_d[i*2]   : (mask==14) ? mask_11x11_e[i*2]   : mask_11x11_f[i*2] ) );
    weight_priv[i*2+1] = ((uint16_t) (weight_tcdm[i] & 0x0000ffff)         ) >> ( (size<=3) ? 0 :
      (size==5) ? ( (mask==0) ? mask_5x5_0[i*2+1] : (mask==1) ? mask_5x5_1[i*2+1] : (mask==2) ? mask_5x5_2[i*2+1] : mask_5x5_3[i*2+1]) :
      (size==7) ? ( (mask==0) ? mask_7x7_0[i*2+1] : (mask==1) ? mask_7x7_1[i*2+1] : (mask==2) ? mask_7x7_2[i*2+1] : mask_7x7_3[i*2+1]) :
      (size==9) ? 0 :
      ( (mask==0)  ? mask_11x11_0[i*2+1] : (mask==1)  ? mask_11x11_1[i*2+1] : (mask==2)  ? mask_11x11_2[i*2+1] : (mask==3)  ? mask_11x11_3[i*2+1] :
        (mask==4)  ? mask_11x11_4[i*2+1] : (mask==5)  ? mask_11x11_5[i*2+1] : (mask==6)  ? mask_11x11_6[i*2+1] : (mask==7)  ? mask_11x11_7[i*2+1] :
        (mask==8)  ? mask_11x11_8[i*2+1] : (mask==9)  ? mask_11x11_9[i*2+1] : (mask==10) ? mask_11x11_a[i*2+1] : (mask==11) ? mask_11x11_b[i*2+1] :
        (mask==12) ? mask_11x11_c[i*2+1] : (mask==13) ? mask_11x11_d[i*2+1] : (mask==14) ? mask_11x11_e[i*2+1] : mask_11x11_f[i*2+1] ) );
  }
  weight_tcdm[10/2] = 1;
  return;
}
