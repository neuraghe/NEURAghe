/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 *                                                                            *
 * Project:     NEURAGHE - Accelerator for Convolutional neural network       *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <fcntl.h>
#include <ctype.h>
#include <termios.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <string.h>

int main (int argc, char **argv){
  
  FILE *fp;
  int *bin;
  int sz, nsz;
  
  int i;
  int fname_len;
  
  char *fname;
  char *fname_h;
  
   if (argc==3) {
   
    fname_len= strlen(argv[1]);
    fname = (char *) malloc(fname_len);
    strcpy(fname,argv[1]);
    
    fname_len= strlen(argv[2]);
    fname_h = (char *) malloc(fname_len);    
    strcpy(fname_h,argv[2]);
  
  }
  else {
  
    printf ("\tError: filename missing.\n");
    printf ("\tUsage: zynq_setup src_file dst_file\n");
    return 1;
    
  }
  


  if((fp = fopen(fname, "r")) == NULL) {
    printf("\tERROR!!! Unable to read input PULP binary.\n");
    return 1;
  }

  fseek(fp, 0L, SEEK_END);
  sz = ftell(fp);
  fseek(fp, 0L, SEEK_SET);
  bin    = (int *) malloc(sz*sizeof(char));
  
  if((nsz = fread(bin, sizeof(char), sz, fp)) != sz)
    printf("\tERROR!!! Read only %d bytes in binary.\n", nsz);
  fclose(fp);


  if((fp = fopen(fname_h, "w")) == NULL) {
    printf("\tERROR!!! Unable to read input PULP binary.\n");
    printf ("\tUsage: zynq_setup src_file dst_file\n");
    return 1;
  }
  fprintf(fp, "#define CODE_SIZE %ld //number of instructions\n",nsz/sizeof(int));
  
  fprintf (fp, "int l2_code[] = { ");
  
  for (i=0; i<nsz/sizeof(int)-1; i++) {       
    fprintf(fp, "%d, ",bin[i]);
  }
  
  fprintf(fp, "%d};",bin[i]);
  
  
  
  fclose(fp);
  
  printf ("File %s successful created!\n", fname_h);
  printf ("\t#instructions: %ld\n", nsz/sizeof(int));
  
  return 0;
}
