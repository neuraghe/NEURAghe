//#define NEU_TCN

#define CONV_WIDTH 16

#define MAXERR 20
//#define STAMPA

#if (CONV_WIDTH == 8)
  typedef char DATA;
  #define sizediv 2
#elif (CONV_WIDTH == 16)
	typedef short int DATA;
	#define sizediv 1
#endif

#define _IH_           30
#define _IW_           30

#define _IF_           36
#define _OF_           40

#define FS           3

#define zero_pad_on  1
#define STRIDE       1
#define DIL          1
#define QF           4

#ifdef NEU_TCN
	#define N_COL        12
	#define N_ROW        4
#else
	#define N_COL        4
	#define N_ROW        4
#endif

#if _IH_ > 1
  #define FS_h      FS
  #define DIL_h     DIL
#else
   #define FS_h       1
  #define DIL_h       1
#endif

#if _IW_ > 1
  #define FS_w      FS
  #define DIL_w     DIL
#else
  #define FS_w        1 
  #define DIL_w       1     
#endif  

int main(void);
void preprocessing(DATA* pre, DATA* pre_out, unsigned int IW, unsigned int iw, unsigned int IH, unsigned int IF);
void postprocessing(DATA* post, DATA* post_out, unsigned int IW, unsigned int iw, unsigned int OW, unsigned int OH, unsigned int OF);
void print_simvssw(DATA* out_sim, DATA* out_sw, unsigned int IW, unsigned int iw, unsigned int OW, unsigned int OH, unsigned int OF);
int sat(int mac);
long long int sat16(long long int mac);
void convoluzione(DATA* input, DATA* output, DATA* kernel, DATA* bias, unsigned int IF, unsigned int IH, unsigned int IW, unsigned int OF, unsigned int OH, unsigned int OW, unsigned int fs_h, unsigned int fs_w, unsigned int zero_pad_h, unsigned int zero_pad_w, unsigned int stride,  unsigned int dil_h, unsigned int dil_w, unsigned int qf, unsigned int ncol);
