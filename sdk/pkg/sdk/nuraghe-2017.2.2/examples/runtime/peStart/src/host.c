#include <hd/hd_api.h>
#include <stdio.h>

int main() {
  unsigned int entry;
  hd_binaryDesc_t desc;

  printf("Entering host side\n");

  if (hd_init()) return -1;

  if (hd_powerOn()) return -1;

  if (hd_loadBinaryFromFs("./fabric.exe", &desc)) return -1;

  if (hd_configFabric(&desc)) return -1;

#ifdef __STHORM__
  if (hd_fetch(1, HD_CORE_MASK_CONTROLLER)) return -1;
#else
  if (hd_fetch(&desc, 0x1, 0x1)) return -1;
#endif

  while(1);

  return 0;
}
