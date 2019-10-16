#include <hd/hd_api.h>
#include <stdio.h>

int main() {
  unsigned int entry;

  printf("Entering host side\n");

  if (hd_init()) return -1;

  if (hd_powerOn()) return -1;

  if (hd_loadBinaryFromFs("./fabric.exe", &entry)) return -1;

  if (hd_setBootAddr(HD_CLUSTER_MASK_ALL, HD_CORE_MASK_ALL, entry)) return -1;

#ifdef __STHORM__
  if (hd_fetch(HD_CLUSTER_MASK_ALL, HD_CORE_MASK_ALL)) return -1;
#else
  if (hd_fetch(0x1, HD_CORE_MASK_ALL)) return -1;
#endif

  while(1);

  return 0;
}
