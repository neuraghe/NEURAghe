#ifndef SPATCONV_H
#define SPATCONV_H

#ifdef __cplusplus
extern "C" {
#endif

#include "types.h"
#include "soc_drivers.h"

typedef struct Spatconv* SPATCONV;

SPATCONV spatconv_create(void);

RET spatconv_init(SPATCONV sc, NAME weightsFile, NAME biasFile, SIZE pin,
		SIZE pout, SIZE kern_s[2], DATA** wPointer);

RET spatconv_forward_sw(SPATCONV sc, DATA* input, DATA* output, SIZE in_s[3],
                     	SIZE out_s[3], SIZE stride[2], SIZE pad[2], bool activate = false, int ncol=4, int qf=10, int precision8=0);

RET zero_pad(DATA* input, DATA* output, SIZE in_s[3], SIZE pad[2]);

RET spatconv_merge(DATA* out, DATA** b, SIZE out_s[3], SIZE kernel_size, SIZE stride[2], bool activate);

RET spatconv_destroy(SPATCONV sc);

RET spatconv_sw_8(DATA* input, DATA* output, DATA* kernel,
		DATA* bias, SIZE in_s[3], SIZE out_s[3], SIZE kern_s[2], SIZE dil[2], SIZE pad[2],
		SIZE stride[2], bool activate = false, int ncol=4, int qf=4);

RET spatconv_sw_16(DATA* input, DATA* output, DATA* kernel,
		DATA* bias, SIZE in_s[3], SIZE out_s[3], SIZE kern_s[2], SIZE dil[2], SIZE pad[2],
		SIZE stride[2], bool activate = false, int ncol=4, int qf=4);

static inline long long int saturate(long long int mac, const char* module = NULL)
{

	if(mac > _MAX_) {
		_dprintf_(RED "%s mac: %lld -> %llx _MAX_: %d  _MIN_: %d  res: %d\n" NC, module, mac, mac, _MAX_, _MIN_, _MAX_);
		return _MAX_;	
	}
	
	if(mac < _MIN_){
		_dprintf_(RED "%s mac: %lld -> %llx _MAX_: %d  _MIN_: %d  res: %d\n" NC, module, mac, mac, _MAX_, _MIN_, _MIN_);
		return _MIN_;
	}
	
	//printf("mac: %lld -> %llx _MAX_: %lld  _MIN_: %lld  res: %lld\n", mac, mac, _MAX_, _MIN_, mac);
    return mac;

}

static inline int sat_8(int mac)
{	

	int mac_out;
  
  	if((mac & 0xffffff80) == 0xffffff80 || (mac & 0xffffff80) == 0){
	  mac_out = mac;
	  }
	else{
	    if(mac < 0) // & 0xffff8000)
	      mac_out = 0xffffff80;
	    else
	      mac_out = 0x0000007f;
	  }
	  
	  return mac_out;
}

static inline long long int sat_16(long long int mac)
{	

	long long int mac_out;
  
  	if((mac & 0xffffffffffff8000ul) == 0xffffffffffff8000ul || (mac & 0xffffffffffff8000ul) == 0){
	  mac_out = mac;
	  }
	else{
	    if(mac < 0) // & 0xffffffffffff8000ul)
	      mac_out = 0xffffffffffff8000ul;
	    else
	      mac_out = 0x0000000000007ffful;
	  }
	  
	  return mac_out;
}

/*
static inline int sat(int mac)
{	

	int mac_out;
  
  	if((mac & 0xffffffffffff8000) == 0xffffffffffff8000 || (mac & 0xffffffffffff8000) == 0){
	  mac_out = mac;
	  }
	else{
	    if(mac & 0xffffffff80000000)
	      mac_out = 0xffffffffffff8000;
	    else
	      mac_out = 0x0000000000007fff;
	  }
	  
	  return mac_out;
}
*/

struct Spatconv {
	DATA* kernel;
	DATA* bias;
	VARSIZE pin;
	VARSIZE pout;
	VARSIZE kern_s[4];
	VARSIZE maxog;
	VARSIZE dil[2];

	//TODO: move here SOCMAP that are at the moment passed as argument.
	//Note: in this way we can have same API for spatconv_forward.
	//
	//Neuraghe_map dev_map;
	//
	//Where the structure will be defined as follow inside soc_driver.h:
	//	 	
	//	//One Map for each layer!
	//	typedef struct Neuraghe_map_s {
	//		void* dev_in;
	//		void* dev_out;
	//		void* dev_w;
	//	} Neuraghe_map;
	//	
	//  //Neuraghe Device Control
	// 	struct Socmap {
	// 		int* soc_addr;
	// 		int* soc_cntr_addr;
	// 		int* ddr_addr;
	// 		int* ps7_slcr_addr;
	// 		Neuraghe_map *dev_maps;
	// 	};
	//
	//  typedef struct Socmap* SOCMAP;
	//  typedef SOCMAP Neuraghe_dev;
	//
};


#ifdef __cplusplus
}
#endif
#endif
