#include <stdio.h>
#include <rt/pulp.h>

int main()
{
  printf("[Core %d] Hello, World!\n", get_core_id());

  return 0;
}
