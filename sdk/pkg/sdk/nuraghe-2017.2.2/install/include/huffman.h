/* 
 * huffman.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Code derivative from http://huffman.sourceforge.net
 * Copyright (C) 2003  Douglas Ryan Richardson
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#ifndef HUFFMAN_H
#define HUFFMAN_H

#ifndef NULL
#define NULL ( (void *) 0)
#endif

#define MAX_SYMBOLS 256

static unsigned int ntohl(
	unsigned int netlong
) {
	unsigned int out = ((netlong & 0x000000ff) << 24 ) |
                       ((netlong & 0x0000ff00) <<  8 ) |
                       ((netlong & 0x00ff0000) >>  8 ) |
                       ((netlong & 0xff000000) >> 24 );
    return out;
}

typedef struct huffman_node_tag {
	unsigned char isLeaf;
	unsigned long count;
	struct huffman_node_tag *parent;

	union
	{
		struct
		{
			struct huffman_node_tag *zero, *one;
		};
		unsigned char symbol;
	};
} huffman_node;

typedef struct huffman_code_tag {
	/* The length of this code in bits. */
	unsigned long numbits;

	/* The bits that make up this code. The first
	   bit is at position 0 in bits[0]. The second
	   bit is at position 1 in bits[0]. The eighth
	   bit is at position 7 in bits[0]. The ninth
	   bit is at position 0 in bits[1]. */
	unsigned char *bits;
} huffman_code;

static unsigned long numbytes_from_numbits (
	unsigned long numbits
) {
	return numbits / 8 + (numbits % 8 ? 1 : 0);
}

/*
 * get_bit returns the ith bit in the bits array
 * in the 0th position of the return value.
 */
static unsigned char get_bit(
	unsigned char* bits,
	unsigned long i
) {
	return (bits[i / 8] >> i % 8) & 1;
}

static void reverse_bits(
	unsigned char* bits,
	unsigned long numbits
) {
	unsigned long numbytes = numbytes_from_numbits(numbits);
	unsigned char *tmp = (unsigned char*) malloc(numbytes);
	unsigned long curbit;
	long curbyte = 0;
	
	// memset(tmp, 0, numbytes);
	for(int i=0; i<numbytes; i++)
		tmp[i] = 0;

	for(curbit = 0; curbit < numbits; ++curbit)
	{
		unsigned int bitpos = curbit % 8;

		if(curbit > 0 && curbit % 8 == 0)
			++curbyte;
		
		tmp[curbyte] |= (get_bit(bits, numbits - curbit - 1) << bitpos);
	}

	// memcpy(bits, tmp, numbytes);
	for(int i=0; i<numbytes; i++)
		bits[i] = tmp[i];
	free(tmp);
}

typedef huffman_node* SymbolFrequencies[MAX_SYMBOLS];
typedef huffman_code* SymbolEncoder[MAX_SYMBOLS];

static huffman_node *new_leaf_node(
    unsigned char symbol
) {
    huffman_node *p = (huffman_node*) malloc(sizeof(huffman_node));
    p->isLeaf = 1;
    p->symbol = symbol;
    p->count = 0;
    p->parent = 0;
    return p;
}

static huffman_node *new_nonleaf_node(
    unsigned long count,
    huffman_node  *zero,
    huffman_node  *one
) {
    huffman_node *p = (huffman_node*) malloc(sizeof(huffman_node));
    p->isLeaf = 0;
    p->count = count;
    p->zero = zero;
    p->one = one;
    p->parent = 0;
    
    return p;
}

static void free_huffman_tree(
    huffman_node *subtree
) {
    if(subtree == NULL)
        return;

    if(!subtree->isLeaf) {
        free_huffman_tree(subtree->zero);
        free_huffman_tree(subtree->one);
    }
    
    free(subtree);
}

static int memread (
    const unsigned char *buf,
    unsigned int        buflen,
    unsigned int        *pindex,
    void                *bufout,
    unsigned int        readlen
) {
    // assert(buf && pindex && bufout);
    // assert(buflen >= *pindex);
    if(buflen < *pindex)
        return 1;
    if(readlen + *pindex >= buflen)
        return 1;
    unsigned char *buf_index = buf + *pindex;
    // was a memcpy
    for (int i=0; i<readlen; i++)
        ((char *) bufout)[i] = buf_index[i];  
    *pindex += readlen;
    return 0;
}

static huffman_node* build_huffman_tree (
    const unsigned char *encoded_buf,
    unsigned int        encoded_buf_len,
    unsigned int        *pindex,
    unsigned int        *pDataBytes
) {
    huffman_node *root = new_nonleaf_node(0, NULL, NULL);
    unsigned int count;
    
    /* Read the number of entries.
       (it is stored in network byte order). */
    if(memread(encoded_buf, encoded_buf_len, pindex, &count, sizeof(count)))
    {
        free_huffman_tree(root);
        return NULL;
    }

    count = ntohl(count);

    /* Read the number of data bytes this encoding represents. */
    if(memread(encoded_buf, encoded_buf_len, pindex, pDataBytes, sizeof(*pDataBytes)))
    {
        free_huffman_tree(root);
        return NULL;
    }

    *pDataBytes = ntohl(*pDataBytes);

    /* Read the entries. */
    while(count-- > 0)
    {
        unsigned int curbit;
        unsigned char symbol;
        unsigned char numbits;
        unsigned char numbytes;
        unsigned char *bytes;
        huffman_node *p = root;

        if(memread(encoded_buf, encoded_buf_len, pindex, &symbol, sizeof(symbol)))
        {
            free_huffman_tree(root);
            return NULL;
        }

        if(memread(encoded_buf, encoded_buf_len, pindex, &numbits, sizeof(numbits)))
        {
            free_huffman_tree(root);
            return NULL;
        }
        
        numbytes = (unsigned char)numbytes_from_numbits(numbits);
        bytes = (unsigned char*)malloc(numbytes);
        if(memread(encoded_buf, encoded_buf_len, pindex, bytes, numbytes))
        {
            free(bytes);
            free_huffman_tree(root);
            return NULL;
        }

        /*
         * Add the entry to the Huffman tree. The value
         * of the current bit is used switch between
         * zero and one child nodes in the tree. New nodes
         * are added as needed in the tree.
         */
        for(curbit = 0; curbit < numbits; ++curbit)
        {
            if(get_bit(bytes, curbit))
            {
                if(p->one == NULL)
                {
                    p->one = curbit == (unsigned char)(numbits - 1)
                        ? new_leaf_node(symbol)
                        : new_nonleaf_node(0, NULL, NULL);
                    p->one->parent = p;
                }
                p = p->one;
            }
            else
            {
                if(p->zero == NULL)
                {
                    p->zero = curbit == (unsigned char)(numbits - 1)
                        ? new_leaf_node(symbol)
                        : new_nonleaf_node(0, NULL, NULL);
                    p->zero->parent = p;
                }
                p = p->zero;
            }
        }
        
        free(bytes);
    }

    return root;
}

int huffman_decode(
    const unsigned char *encoded_buf,
    unsigned int        encoded_buf_len,
    unsigned char       **decoded_buf,
    unsigned int        *decoded_buf_len
);

#endif
