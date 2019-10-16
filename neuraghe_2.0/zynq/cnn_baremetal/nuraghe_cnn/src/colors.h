/*
 * colors.h
 *
 *  Created on: Dec 7, 2016
 *      Author: gderiu
 */

#ifndef SRC_COLORS_H_
#define SRC_COLORS_H_


//#define USE_COLORS

#ifdef USE_COLORS
	#define RED printf("\033[0;31m");
	#define BLACK printf("\033[0;30m");
	#define BLUE printf("\033[0;34m");
	#define GREEN printf("\033[0;32m");
	#define CYAN printf("\033[0;36m");
	#define PURPLE printf("\033[0;35m");
	#define BROWN printf("\033[0;33m");
	#define YELLOW printf("\033[1;33m");
	#define WHITE printf("\033[1;37m");
	#define NC printf("\033[0m");
#else
	#define RED ;
	#define BLACK ;
	#define BLUE ;
	#define GREEN ;
	#define CYAN ;
	#define PURPLE ;
	#define BROWN ;
	#define YELLOW ;
	#define WHITE ;
	#define NC ;
#endif


#endif /* SRC_COLORS_H_ */
