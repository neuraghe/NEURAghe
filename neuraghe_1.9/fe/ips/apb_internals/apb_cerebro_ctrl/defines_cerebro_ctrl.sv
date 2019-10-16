////////////////////////////////////////////////////////////////////////////////
// Company:        IIS @ ETHZ - Federal Institute of Technology Zurich        //
//                                                                            //
// Engineer:       Florian Glaser, glaserf@ethz.ch                            //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
//                                                                            //
//                                                                            //
// Create Date:    20/10/2014                                                 //
// Design Name:    Multi-functional platform based on a SAR ADC               //
// Module Name:    defines_cerebro_ctrl.sv                                    //
// Project Name:   VivoSoC                                                    //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    File for all defintions of the system                      //
//                                                                            //
//                                                                            //
// Revision:                                                                  //
// Revision v0.1 - File Created                                               //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// APB
`define W_APB_ADDR     15
`define W_APB_DATA     32

// broadcast offsets
`define BRDCST_OFFS 15

// configuration bus
`define NUM_ANA_IPS    4
`define NUM_ANA_CHS    8
`define W_CONF_DATA    16
`define W_CONF_OFFS    7

// SAR ADC defines
`define W_SAR_DATA          32
`define W_SAR_RAWDATA       17
`define W_SAR_FIFO          5
`define THRESH_SIGN_COMP    23
`define INT_EN_WATERMARK    26
`define INT_EN_THRESH_LOW   27
`define INT_EN_THRESH_HIGH  28
`define INT_CLR_WATERMARK   29
`define INT_CLR_THRESH_LOW  30
`define INT_CLR_THRESH_HIGH 31
`define CLR_OVFLW           2