# NEURAGHE Software Framework
This repository contains the sofware source code for DL application targeted on the NEURAGHE platform.

## Dependencies
### arm compiler
ARM cross compilers must be in your current $PATH: run the command ```arm-linux-gnueabihf``` to check it.

### 3rd party libraries
GSL - GNU Scientific Library  
Independent JPEG Group  
Go to `codes/3rdparty` folder and run `setup-all.sh`.  
This downloads the dependencies and compiles statically linkable libraries.  

Development board Xilinx ZC706 or ZEDBOARD running Linux (tested with Ubuntu and Xillinux).  
To use all the features of the makefile we suggest to connect the board to the ethernet LAN  

## Project structure
Here is a quick overview over the structure (tree -L 2 -d):   
```
├── codes (ResNet-18 application code)
│   ├── 3rdparty (libraries w/ cross compilator build scripts and prebuilt versions)
│   └── modnet2 (the current codebase)
├── tests (contains all the applications to test and use the architecture)
│   ├── conv_test (this application is intended to run a set of conv layers, measure preformance and debug the architecture)
│   └── ... (a lot of them are outdated)
└── zynq (contains the FPGA bistream for Neuraghe)
```
## Creating a new application
You can create a new test application simply doing copy and paste of the helloworld application. The folder and the two source files must have the same name.  
The user application is embedded in a main application and is composed by two functions:  
**cnnMainInit** initalizes the application loading the static data like weights and biases  
**cnnMain** is the core function and should implement the whole net. It takes the input images and returns the result data. This function is run in a loop.  

## Compiling and running on the zynq platform

To compile the application, in the root directory run the command:  
```
make clean all
```
Then you can send the application to your board via ssh:  
```
make load NEURAGHE_BOARD_ADDR=user@hostname NEURAGHE_INSTALL_DIR=<install-directory> 
```

### Environment variables

The makefile uses a set of environment variables to enable some features or switch among debug modes.  
You can set them only once in a bash script, here called sourceme.sh or append them in the make call like in the above command.  

The available env vars and their default values:
```
TIME?= 0      # enables the performance measures and the realted prints 
DEBUG?= 0     # enables the debug prints
RELEASE?= 0   # if RELEASE=1 disables all the debug prints
FIXED?= 0     # to be set to 1 when using neuraghe
NEURAGHE?= 0  # to be set to 1 to use neuraghe
CI?= 0        # enables the print of the classification results
US?= 0        # if set to 1 changes the compilter to aarch64-linux-gnu-gcc which supports the Ultrascale's 64bit architecture
```


```
On the zynq board, once the FPGA is configured, go into `bin` and execute the main application (it needs root privileges):
```
sudo ./main <path-to-weights> <input-image>
```
note: for the `tigercat.jpeg` image there is a results comparison at the end of the computation.<br>

To enable debug prints, recompile the project with `DEBUG` flag enabled:
```
make clean all DEBUG=1
```
Then you can reload the the executable with:
```
make load-main NEURAGHE_BOARD_ADDR=user@hostname NEURAGHE_INSTALL_DIR=<install-directory>
```
To run the whole application on the ARM, and emulate the Neuraghe behaviour in software, disable the `NEURAGHE` flag and recompile the project:
```
make clean all NEURAGHE=0
```
If you want to use weights with different number of bits for the fractional part remember to set che correct value inside `codes\modnet2\src\net\types.h` (QF value).<br>

You can also run the whole application in floating-point precision (use double precision weights) disabling the `FIXED` flag at build time:
```
make clean all NEURAGHE=0 FIXED=0		(for ARM architecture)
make clean all NEURAGHE=0 FIXED=0 ARM=0 	(for x86 architecture)
```

## Convertion scripts



