#ifndef __OMP_H__
#define __OMP_H__

#include "pulp.h"
#include <rt/rt_api.h>

typedef unsigned int omp_lock_t;

int omp_get_thread_num(void);

typedef int               kmp_int32;
typedef void (*kmpc_micro)              ( kmp_int32 * global_tid, kmp_int32 * bound_tid, void *args);

typedef struct ident {
    kmp_int32 reserved_1;   /**<  might be used in Fortran; see above  */
    kmp_int32 flags;        /**<  also f.flags; KMP_IDENT_xxx flags; KMP_IDENT_KMPC identifies this union member  */
    kmp_int32 reserved_2;   /**<  not really used in Fortran any more; see above */
#if USE_ITT_BUILD
                            /*  but currently used for storing region-specific ITT */
                            /*  contextual information. */
#endif /* USE_ITT_BUILD */
    kmp_int32 reserved_3;   /**< source[4] in Fortran, do not use for C++  */
    char const *psource;    /**< String describing the source location.
                            The string is composed of semi-colon separated fields which describe the source file,
                            the function and a pair of line numbers that delimit the construct.
                             */
} ident_t;

typedef kmp_int32 kmp_critical_name[8];

#ifdef OLD_KMPC_FORK_CALL
void __kmpc_fork_call(ident_t *loc, kmp_int32 argc, kmpc_micro microtask, ...);
#else
void __kmpc_fork_call(ident_t *loc, kmp_int32 argc, kmpc_micro microtask, int **args);
#endif

#endif
