/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Eric Flamand (eric.flamand@iis.ee.ethz.ch)
 */

#ifndef __RT_NAME_ALLOC_H__
#define __RT_NAME_ALLOC_H__

typedef unsigned char RefCountT;
typedef unsigned char RefSizeT;

typedef struct {
        RefCountT RefCount;	/* Number of references for this name */
        RefSizeT  Size;		/* Size of the name, no null termination is assumed */
} __attribute__ ((__packed__)) AllocNameT;

static inline char *GetName(AllocNameT *allocName) {
	return (char *)allocName + sizeof(AllocNameT);
}

/*
	Add a new page of size Size to the Alloc Page Table
	Size should be representable as a RefSizeT
*/
int PageNameAdd(unsigned char *Page, unsigned int Size);


/*
	Insert Name into Alloc Page Table, in case it exists increase its ref count and
	return the existing pointer.  On failure returns null
*/
AllocNameT *InsertName(const char *Name);

/*
	Remove Name pointer from Alloc Page Table. If after removing it's Ref Count reaches 0 deallocate
	it completly from Alloc Page Table.
	Return 1 on succes, 0 on failure
*/
int RemoveName(AllocNameT *Name);

/*
	Copies Name string (if exist) into Buffer with null appended at the end (printf ready)
	Returns Buffer
*/
char *NameImage(AllocNameT *Name, char *Buffer);

#ifdef NAME_ALLOC_DUMP
/*
	Dump the whole content of Alloc Page Table
*/
void DumpAllNamePages();
#endif

#endif
