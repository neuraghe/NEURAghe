/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __CHIP_H__
#define __CHIP_H__

class Bridge;

class Chip {
public:
	virtual void start(unsigned int cluster, int coreMask) = 0;
};

class MiaChip : public Chip {

public:
	MiaChip(Bridge *bridge);
	void start(unsigned int cluster, int coreMask);

private:
	Bridge *bridge;

};

class Vivosoc2Chip : public Chip {

public:
	Vivosoc2Chip(Bridge *bridge);
	void start(unsigned int cluster, int coreMask);

private:
	Bridge *bridge;

};

#endif