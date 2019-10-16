#include <stdint.h>

#define NUM_WEIGHT 122

void weight_loader_11x11(uint32_t weight_tcdm[122/2+1], uint16_t weight_priv[122], int size, int mask) {
  for(int i=0; i<122/2; i++) {
    weight_priv[i*2]   = (uint16_t) ((weight_tcdm[i] & 0xffff0000) >> 16);
    weight_priv[i*2+1] = (uint16_t) (weight_tcdm[i] & 0x0000ffff);
  }
  weight_tcdm[122/2] = 1;
  return;
}
