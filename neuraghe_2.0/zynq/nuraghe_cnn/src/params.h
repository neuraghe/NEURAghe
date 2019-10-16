/*
 * params.h
 *
 *  Created on: Dec 12, 2016
 *      Author: gderiu
 */

#ifndef SRC_PARAMS_H_
#define SRC_PARAMS_H_

//comment or uncomment the following line to switch between baremetal and linux version
#define BAREMETAL

//uncomment the following line if you want to read instructions for PL cores from a file. It works on linux only
//#define LOAD_INSTR_FROM_FILE //WORK IN PROGRESS

#ifndef BAREMETAL
 #define USE_COLORS
 #define MEM_MAPPING
#else
 #ifdef LOAD_INSTR_FROM_FILE
  #undef LOAD_INSTR_FROM_FILE
 #endif
#endif


#endif /* SRC_PARAMS_H_ */
