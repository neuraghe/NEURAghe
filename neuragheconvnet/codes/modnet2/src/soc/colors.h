/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 *                                                                            *
 * Project:     NURAGHE - Accelerator for Convolutional neural network        *
 * File:      colors.h                                                                *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/

#ifndef SRC_COLORS_H_
#define SRC_COLORS_H_



#ifdef USE_COLORS
	#define RED    "\x1B[31m"
	#define BLACK  "\x1B[30m"
	#define BLUE   "\x1B[34m"
	#define GREEN  "\x1B[32m"
	#define CYAN   "\x1B[36m"
	#define PURPLE "\x1B[35m"
	#define YELLOW "\x1B[33m"
	#define WHITE  "\x1B[37m"

	#define LRED    "\x1B[91m"
	#define LBLUE   "\x1B[94m"
	#define LGREEN  "\x1B[92m"
	#define LCYAN   "\x1B[96m"
	#define LPURPLE "\x1B[95m"
	#define LYELLOW "\x1B[93m"

	#define NC      "\x1B[0m"
#else
	#define RED    ""
	#define BLACK  ""
	#define BLUE   ""
	#define GREEN  ""
	#define CYAN   ""
	#define PURPLE ""
	#define BROWN  ""
	#define YELLOW ""
	#define WHITE  ""

	#define LRED    ""
	#define LBLUE   ""
	#define LGREEN  ""
	#define LCYAN   ""
	#define LPURPLE ""
	#define LYELLOW ""

	#define NC     "" 
#endif


#endif /* SRC_COLORS_H_ */
