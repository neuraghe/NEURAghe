#include "omp.h"

int main()
{
  #pragma omp parallel
  {
    printf("Thread ID = %d\n", omp_get_thread_num());
  }

  return 0;
}
