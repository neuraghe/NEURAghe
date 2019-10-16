
#include "pulp.h"

#define L2_HEAP_BASE		L2_MEM_BASE_ADDR + 0x9000
#define L1_HEAP_BASE		TCDM_BASE_ADDR


/* VL FEAT memory type used by vl_malloc_init */
enum vl_mem_type_ {L1, L2} ;
typedef enum vl_mem_type_ vl_mem_type ;

VL_EXPORT void * memset(void * s, int c, size_t n);
//VL_EXPORT void *vl_malloc (size_t n) ;
//VL_EXPORT void *vl_calloc (size_t n, size_t size);
//VL_EXPORT void *vl_free (void *ptr);
