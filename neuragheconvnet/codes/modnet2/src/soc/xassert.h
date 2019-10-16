#ifndef ASSERT_H
#define ASSERT_H

#include <stdio.h>

#if !(_RELEASE_)
#define ASSERT(proposition, format, ...)\
    if(!(proposition)){\
        fprintf(stderr, "assertion failed: %s %d", __FILENAME__, __LINE__);\
        fprintf(stderr, "\n");\
        if(format){\
            fprintf(stderr, (format), __VA_ARGS__);\
        }else{\
            fprintf(stderr, "no message passed");\
        }\
        fprintf(stderr, "\n");\
        exit(ERR);\
        return ERR;\
    }
#else
#define ASSERT(proposition, format, ...)
#endif

#endif
