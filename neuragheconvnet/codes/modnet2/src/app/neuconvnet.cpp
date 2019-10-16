#include "neuconvnet.h"

#include <sys/time.h>
#include <time.h>
#include <pthread.h> 
#include <semaphore.h>
#include <argp.h>
#include <dirent.h>

#include <netinet/in.h>
#include <unistd.h>

#include <sys/socket.h>
#include <arpa/inet.h>
#include <signal.h>
#include <unistd.h>

#include <sys/stat.h>
#include <time.h>

extern void cnnMainInit(VARNAME load_data_dir);
extern void cnnMain(DATA* image, float* results);
extern void init_platform(char* bitstream);
extern void free_platform();

#define MAX_IMAGES 10

static sem_t free_space;
static sem_t images_in_buffer;
static sem_t finish;
static pthread_mutex_t mutex;

static int images_in_folder;
static int ready_results = 0;

static int linkfd;
static int PORT = 0;

struct image_data
{
	DATA* image_pixels;
	char  image_name[100];	
};

struct results
{
	float* res_fcn;
	int*  top_res;
	double cnn_time;	
};

struct data_res
{
	char  image_name[100];
	double cnn_time;
	unsigned int top_res[5];
};

static struct image_data image_buffer[MAX_IMAGES];
static struct results res_buffer[MAX_IMAGES];
static struct data_res net_data[MAX_IMAGES];

static VARNAME image_dir = { 0 };
static VARNAME image_path = { 0 };
static VARNAME load_data_dir = { 0 };
static VARNAME bitstream = { 0 };
static VARSIZE inSz[3];
static VARSIZE out_classes;

static bool print_class;
static int num_top; 
//static char cnn_name[50];

static char input;
static bool srv_close = false;
static bool loop = false;

static struct argp_option options[] =
{
	{ "weights",   'c',  "weights folder", 0, "Path to weights folder"},
	{ "images",    'i',  "images folder ", 0, "Path to images folder"},
	{ "planes",    'p',  "planes number ", 0, "Input image planes"},
	{ "height",    'h',  "image height  ", 0, "Input image height"},
	{ "width",     'w',  "image width   ", 0, "Input image width"},
	{ "classes",   'o',  "# of classes  ", 0, "Number of output classes"},
	{ "bitstream", 'b',  "bitstream.bin ", 0, "FPGA bitstream"},
	{ "port",      'P',  "Socket Port   ", 0, "Socket port"},
	{ "loop",      'l',                 0, 0, "Loop over the same directory"},
	{ 0 }
};

static int parse_opt(int key, char *arg, struct argp_state *state)
{

	switch (key)
	{
		case 'c':
			sprintf(load_data_dir, "%s", arg);
			break;
		case 'i':
			sprintf(image_path, "%s", arg);
			break;
		case 'p':
			inSz[0] = atoi(arg);
			break;
		case 'h':
			inSz[1] = atoi(arg);
			break;
		case 'w':
			inSz[2] = atoi(arg);
			break;
		case 'o':
			out_classes = atoi(arg);
			break;
		case 'b':
			sprintf(bitstream, "%s", arg);
			break;
		case 'P':
			PORT = atoi(arg);
			break;
		case 'l':
			loop = true;
			break;
		case ARGP_KEY_ARG:
  			argp_error(state, "Too many arguments");
  		case ARGP_KEY_END:
  			if (state->argc < 2)/* Not enough arguments. */
      			argp_error(state, "Not enough arguments");
    		break;
	    default:
      		return ARGP_ERR_UNKNOWN;
	}
	return 0;
} 

static int init_link(int PORT)
{
	int reuse = 1;
  	int listenfd = 0, connfd = 0;
    struct sockaddr_in serv_addr; 

    setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &reuse, sizeof(reuse));

	/* Get the Socket file descriptor */
    if((listenfd = socket(AF_INET, SOCK_STREAM, 0)) == -1 )
    {
        fprintf(stderr, "ERROR: Failed to obtain Socket Descriptor. (errno = %d)\n", errno);
        exit(1);
    }
    else 
        printf("[Server] Obtaining socket descriptor successfully.\n");

    memset(&serv_addr, '0', sizeof(serv_addr));

    /* Fill the client socket address struct */
    serv_addr.sin_family = AF_INET;					// Protocol Family
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);	// AutoFill local address
    serv_addr.sin_port = htons(PORT); 				// Port number

    /* Bind a special Port */
    if( bind(listenfd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == -1 )
	{
        fprintf(stderr, "ERROR: Failed to bind Port. (errno = %d)\n", errno);
        exit(1);
    }
    else {
        printf("[Server] Binded tcp port %d in addr %s sucessfully.\n",
        	   ntohs(serv_addr.sin_port), inet_ntoa(serv_addr.sin_addr));
    }

    listen(listenfd, 10); 

    connfd = accept(listenfd, (struct sockaddr*)NULL, NULL); 

    close(listenfd);

    return connfd;
}

static void init()
{
	sem_init(&free_space, 0, MAX_IMAGES);
	sem_init(&images_in_buffer, 0, 0);
	sem_init(&finish, 0, 0);

   	if(pthread_mutex_init(&mutex, NULL) != 0)
    {
        printf("\n mutex init failed\n");
        exit(1);
    }
	
    if(out_classes == 1000)
    {
    	num_top = 5;
    	print_class = true;
    	sprintf(image_dir, "%s", image_path);
    }
    else
    {
    	if(out_classes == 10)
    	{
	    	num_top = 2;
    		print_class = false;
    		sprintf(image_dir, "%s", image_path);
    	}
    	else
    	{
    		printf("CNN not supported!\n");
    		exit(1);
    	}
    }

	for(unsigned int i=0; i<sizeof(image_buffer)/sizeof(*image_buffer); ++i)  
		image_buffer[i].image_pixels = (DATA *) calloc(inSz[0]*inSz[1]*inSz[2], sizeof(DATA));
	
	for(unsigned int i=0; i<sizeof(res_buffer)/sizeof(*res_buffer); ++i){
		res_buffer[i].res_fcn = (float *) calloc(out_classes, sizeof(float));
		res_buffer[i].top_res = (int *) calloc(num_top, sizeof(int));
	}
	
        //printf("init_platform\n");
	init_platform(bitstream);


	if(PORT)
		linkfd = init_link(PORT);

}

static void free()
{
	for(unsigned int i=0; i<sizeof(image_buffer)/sizeof(*image_buffer); ++i)  	
		free(image_buffer[i].image_pixels);
	
	for(unsigned int i=0; i<sizeof(res_buffer)/sizeof(*res_buffer); ++i){
		free(res_buffer[i].res_fcn);
		free(res_buffer[i].top_res);
	}

	sem_destroy(&free_space);
	sem_destroy(&images_in_buffer);
	sem_destroy(&finish);
	pthread_mutex_destroy(&mutex);
	free_platform();

	if(PORT)
		close(linkfd);
}

static int send_results(int res_ptr)
{
	int local_res = 0;
	//int check = 0;
	uint32_t nb_send = 0;
	//uint32_t nb_recv = 0;

	do {
		pthread_mutex_lock(&mutex);
		local_res = ready_results;
		if (ready_results)
			--ready_results;
		pthread_mutex_unlock(&mutex);

		if(local_res)
		{
			_tprintf_(YELLOW "%s\n" NC, net_data[res_ptr].image_name);
			printTopN(res_buffer[res_ptr].res_fcn, net_data[res_ptr].top_res, out_classes, num_top, print_class);

			nb_send = send(linkfd, &net_data[res_ptr], sizeof(net_data[res_ptr]), 0);
			if(nb_send != sizeof(net_data[res_ptr])) printf("Error sending packet!\n");
			
			//nb_recv = recv(linkfd, &check, 4, 0);
		    //if(nb_recv != 4) printf("Error receiving ack!\n");
		    
    		res_ptr = (res_ptr+1)%MAX_IMAGES;			
			
			if(input == 's')
	    		usleep(300000);
			if(input == 'v')
			    usleep(3000000);
		}

	} while(local_res);

	return res_ptr;

}
int myLOCK=0;
void unlockPL(){
  if (myLOCK==1) {
    remove("/tmp/lockPL.neuraghe");
    _rprintf_ ("Lock released.\n");
  }
}

void  INThandler(int sig)
{
     _rprintf_ ("\nCtrl+C caught!\n");
     
     exit(0);
}

void  SIGABRThandler(int sig)
{
     _rprintf_ ("\nAbort!\n");
     
     exit(0);
}

void  SIGSEGVhandler(int sig)
{
     printf ("\nSegmentation fault error!\n");
     
     exit(1);
}



void lockPL(){
  FILE* fp;
  _rprintf_ ("Acquiring lock...\n");
  myLOCK=0;
  int tries=0;
  do{
    fp = fopen( "/tmp/lockPL.neuraghe", "r" );
    if (fp){
      if (tries==2) {
        printf(YELLOW "\tLock file /tmp/lockPL.neuraghe exists. Delete it if lock troubles occur.\n" NC);
        struct stat filestat;
        stat("/tmp/lockPL.neuraghe",&filestat);
        printf("\t File modify time %s", ctime(&filestat.st_mtime));
      }
      tries++;
      fclose (fp);
      sleep(1);
    }
  } while (fp!=0);

  fp = fopen( "/tmp/lockPL.neuraghe", "w" );

  fclose (fp);
  myLOCK=1;

  _rprintf_ ("Lock acquired.\n");
}


int main(int argc, char* argv[]	) {
	uint eot;
	//Parse input parameters
	struct argp argp = {options, parse_opt, 0, 0};
	if(argp_parse(&argp, argc, argv, 0, 0, 0))
	{
		fprintf(stderr, "Error in parsing input parameters");
		return 1;
	}
	
  atexit(unlockPL);
  signal(SIGABRT, INThandler);
  signal(SIGSEGV, SIGSEGVhandler);
  signal(SIGINT, INThandler);
  lockPL();
        
	//INIT
	init();

	//int check = 0;
	//uint32_t nb_send = 0;
	//uint32_t nb_recv = 0;
	
	/* Scanning the Imgs directory */
	struct dirent** file_list;
    images_in_folder = scandir(image_dir, &file_list, NULL, alphasort);
    if(images_in_folder==-1)
    {
        fprintf(stderr, "Error : Failed to open image directory: %s\n", image_dir);
        exit(1);
    }	

	//Thread create
	pthread_t frame;
	pthread_t cnn;
	void* frame_capture(void*);
	void* cnn_exec(void*);

	if( pthread_create(&frame, NULL, frame_capture, (void*) file_list) != 0) {
		printf("Error creating frame_capture thread!\n");
		return 1;		
	} 
	if( pthread_create(&cnn, NULL, cnn_exec, 0) != 0) {
		printf("Error creating cnn_exec thread!\n");
		return 1;		
	} 

	_tcreate_(main_time);

	if(PORT) {
		while (!srv_close) {
			char local_input = getchar();
			
			switch(local_input) {
				case 'q':
					/* quit */
					srv_close = true;
					break;
				default:
					input = local_input;
					break;
				case '\n':
					break;
			}
		}
	}
	
	pthread_join(frame, NULL);
	pthread_join(cnn, NULL);

	_tprintf_(YELLOW "Main wall time: %5.3f ms\n" NC, (get_wall_time() - main_time) / 1000);

	if(PORT){
		eot = 0xdeadbeef;
		send(linkfd, &eot, sizeof(eot), 0);

		recv(linkfd, &eot, sizeof(eot), 0);
	}

	//Free space
	free();

	unlockPL();

	return OK;
}

void* frame_capture(void* file_list)
{

	int in_ptr = 0;
	//int read_bytes = 0;
	int res_ptr = 0;
	bool frame_close = false;

	struct dirent** namelist = (dirent**)file_list;
	VARNAME image = { 0 };
	int img_size = inSz[0]*inSz[1]*inSz[2];
	int n = 2;		//skip current and parent directories

	//unsigned char jdata[img_size];
	while(!srv_close && !frame_close)
	{	
		_rprintf_(YELLOW "%s\n" NC, namelist[n]->d_name);
		sprintf(image, "%s/%s", image_dir, namelist[n]->d_name);

        	sem_wait(&free_space);

        	if(PORT)
        		res_ptr = send_results(res_ptr);

		source_forward(image, image_buffer[in_ptr].image_pixels, inSz, _QF_);

//	    _tcreate_(time);
//		FILE* fp;
//		fp = fopen(image, "r");
//		assert(fp!=NULL);
//		fread(image_buffer[in_ptr].image_pixels, sizeof(DATA), img_size, fp);
//		fclose(fp);
//		_tprintf_("read from file: %5.3f ms\n", (get_wall_time()-time)/1000);

//	   _tcreate_(time);
//		FILE* fp;
//		sprintf(image, "Imgs/test/txt/%s", namelist[n]->d_name);
//		fp = fopen(image, "w");
//		assert(fp!=NULL);
//		fwrite(image_buffer[in_ptr].image_pixels, sizeof(DATA), img_size, fp);
//		fclose(fp);
//		_tprintf_("read from file: %5.3f ms\n", (get_wall_time()-time)/1000);

		strncpy(net_data[in_ptr].image_name, namelist[n]->d_name, sizeof(net_data[in_ptr].image_name)-1);

		sem_post(&images_in_buffer);

		in_ptr = (in_ptr+1)%MAX_IMAGES;

		n++;
		if(n == images_in_folder){
			if(loop)
				n = 2;
			else
				frame_close = true;
		}	
	}

	sem_post(&images_in_buffer);
	sem_wait(&finish);
	
	if(PORT)
		send_results(res_ptr);

	pthread_exit(0);
}


void* cnn_exec(void*)
{
	int out_ptr = 0;
	//int img_size = inSz[0]*inSz[1]*inSz[2];
	int n = 2;  //remove current and parent directories
	bool cnn_close = false;

	//Network init
//        printf("init\n");
	_tcreate_(init_time);
	cnnMainInit(load_data_dir);
	_tprintf_(YELLOW "Init wall time: %5.3f ms\n" NC, (get_wall_time() - init_time) / 1000);

	while(!srv_close && !cnn_close)
	{	
		sem_wait(&images_in_buffer);

		//Consume item	
		_rprintf_(PURPLE "Start network...\n" NC);

		double cnn_time = get_wall_time();    	
		cnnMain(image_buffer[out_ptr].image_pixels, res_buffer[out_ptr].res_fcn);
		cnn_time = get_wall_time() - cnn_time;
#if defined(__CI__) || defined(_RELEASE_)
		printf("CNN Time:\t%5.3f\t(%lf fps)\n", cnn_time/1000, 1.0/(cnn_time/1000000));
		printf("CNN Check:\t%f\n", checksum_f32(res_buffer[out_ptr].res_fcn,out_classes));
#endif
		net_data[out_ptr].cnn_time = cnn_time;

		_rprintf_(PURPLE "Complete...\n" NC);

		printTopN(res_buffer[out_ptr].res_fcn, net_data[out_ptr].top_res, out_classes, num_top, print_class);
		
		pthread_mutex_lock(&mutex);

		++ready_results;
		
		pthread_mutex_unlock(&mutex);

		sem_post(&free_space);

		out_ptr = (out_ptr+1)%MAX_IMAGES;

		n++;
		if(n == images_in_folder){
			if(!loop)
				cnn_close = true;
		}
	}


	double cnn_time = get_wall_time();  

	cnnMain(image_buffer[out_ptr].image_pixels, res_buffer[out_ptr].res_fcn);
	cnn_time = get_wall_time() - cnn_time;
	_tprintf_(YELLOW "%s -> CNN wall time: %5.3f ms FPS: %lf\n" NC, net_data[out_ptr].image_name, cnn_time/1000, 1.0/(cnn_time/1000000));
#ifdef __CI__
	printf("CNN Time:\t%5.3f\t(%lf fps)\n", cnn_time/1000, 1.0/(cnn_time/1000000));
	printf("CI-Check:\t%f\n", checksum_f32(res_buffer[out_ptr].res_fcn,out_classes));
#endif
	net_data[out_ptr].cnn_time = cnn_time;

	_rprintf_(PURPLE "Complete...\n" NC);

	printTopN(res_buffer[out_ptr].res_fcn, net_data[out_ptr].top_res, out_classes, num_top, print_class);
	
	pthread_mutex_lock(&mutex);

	++ready_results;
	
	pthread_mutex_unlock(&mutex);

	sem_post(&free_space);
	sem_post(&finish);

	pthread_exit(0);
}
