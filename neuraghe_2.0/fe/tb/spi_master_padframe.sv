`define SPI_STD     2'b00
`define SPI_QUAD_TX 2'b01
`define SPI_QUAD_RX 2'b10


module spi_master_padframe
(
	//PAD TO CORE
	
	// PAD MODES FROM CORE
	input  logic [1:0] padmode_spi_master,
	

	// TO SPI MASTER
	input  logic spi_master_csn,
	input  logic spi_master_sck,
	output logic spi_master_sdi0,
	output logic spi_master_sdi1,
	output logic spi_master_sdi2,
	output logic spi_master_sdi3,
	input  logic spi_master_sdo0,
	input  logic spi_master_sdo1,
	input  logic spi_master_sdo2,
	input  logic spi_master_sdo3,
	
	inout  logic MSPI_SIO0_PAD,
	inout  logic MSPI_SIO1_PAD,
	inout  logic MSPI_SIO2_PAD,
	inout  logic MSPI_SIO3_PAD,
	inout  logic MSPI_CSN_PAD,
	inout  logic MSPI_SCK_PAD
);


	logic master_dio0_en;
  	logic master_dio1_en;
  	logic master_dio2_en;
  	logic master_dio3_en;
  	logic master_output;  
  	logic master_cs_in;  
  	logic master_sck_in; 
  	logic master_dio0_in;
  	logic master_dio1_in;
  	logic master_dio2_in;
  	logic master_dio3_in;
  	logic master_cs_out;
  	logic master_sck_out;
  	logic master_dio0_out;
  	logic master_dio1_out;
  	logic master_dio2_out;
  	logic master_dio3_out;
  	
  	logic always_input;
  	logic always_output;
  	logic always_clock;
  	logic always_reset;
  	logic no_hyst;
  	
  	logic padmode_testio;
  	logic hyst;
  	logic lowemi;
  	
	assign padmode_testio = 1'b0;
	assign hyst           = 1'b0;
	assign lowemi         = 1'b0;


  // DIGITAL PAD CELLS
  	
  	

  
  /////////////////////////////////////////////////////////////////////////////////////////////////
  ////                                                                                         ////
  ////  SPI MASTER                                                                             ////
  ////                                                                                         ////
  /////////////////////////////////////////////////////////////////////////////////////////////////
  //MASTER SDIO0 
  BD4SCARUDQPCZ_SF_1V8_FC_LIN I_spi_master_sdio0_IO
  	( 
  		.ZI(master_dio0_in), 
  		.A(master_dio0_out), 
  		.EN(master_dio0_en), 
  		.TA(), 
  		.TEN(), 
  		.TM(padmode_testio),
  		//----------------------------------------------------------------//
  		// ACTIVE LOW signals to Pull Up (PU) and Pull Down (PD) the PAD
  		.PUN(1'b1), 
  		.PDN(1'b1),
  		.PUN15K(1'b1),
  		//----------------------------------------------------------------//
  		.HYST(hyst), 
  		.LOWEMI(lowemi), 
  		.IO(MSPI_SIO0_PAD)
  		);

  //MASTER SDIO1
  BD4SCARUDQPCZ_SF_1V8_FC_LIN I_spi_master_sdio1_IO
  	( 
  		.ZI(master_dio1_in), 
  		.A(master_dio1_out), 
  		.EN(master_dio1_en), 
  		.TA(), 
  		.TEN(), 
  		.TM(padmode_testio),
  		//----------------------------------------------------------------//
  		// ACTIVE LOW signals to Pull Up (PU) and Pull Down (PD) the PAD
  		.PUN(1'b1), 
  		.PDN(1'b1),
  		.PUN15K(1'b1),
  		//----------------------------------------------------------------//
  		.HYST(hyst), 
  		.LOWEMI(lowemi), 
  		.IO(MSPI_SIO1_PAD)
  		);
  
  //MASTER SDIO2 
  BD4SCARUDQPCZ_SF_1V8_FC_LIN I_spi_master_sdio2_IO
  	( 
  		.ZI(master_dio2_in), 
  		.A(master_dio2_out), 
  		.EN(master_dio2_en), 
  		.TA(), 
  		.TEN(), 
  		.TM(padmode_testio),
  		//----------------------------------------------------------------//
  		// ACTIVE LOW signals to Pull Up (PU) and Pull Down (PD) the PAD
  		.PUN(1'b1), 
  		.PDN(1'b1),
  		.PUN15K(1'b1),
  		//----------------------------------------------------------------//
  		.HYST(hyst), 
  		.LOWEMI(lowemi), 
  		.IO(MSPI_SIO2_PAD)
  		);
  
  //MASTER SDIO3
  BD4SCARUDQPCZ_SF_1V8_FC_LIN I_spi_master_sdio3_IO
  	( 
  		.ZI(master_dio3_in), 
  		.A(master_dio3_out), 
  		.EN(master_dio3_en), 
  		.TA(), 
  		.TEN(), 
  		.TM(padmode_testio),
  		//----------------------------------------------------------------//
  		// ACTIVE LOW signals to Pull Up (PU) and Pull Down (PD) the PAD
  		.PUN(1'b1), 
  		.PDN(1'b1),
  		.PUN15K(1'b1),
  		//----------------------------------------------------------------//
  		.HYST(hyst), 
  		.LOWEMI(lowemi), 
  		.IO(MSPI_SIO3_PAD)
  		);
  
  //MASTER CSN
  BD4SCARUDQPCZ_SF_1V8_FC_LIN I_spi_master_csn_IO
  	( 
  		.ZI(master_cs_in), 
  		.A(master_cs_out), 
  		.EN(master_output), 
  		.TA(), 
  		.TEN(), 
  		.TM(padmode_testio),
  		//----------------------------------------------------------------//
  		// ACTIVE LOW signals to Pull Up (PU) and Pull Down (PD) the PAD
  		.PUN(pu_master),   // ------> PULL UP THE CSN PAD 
  		.PDN(1'b1),  
  		.PUN15K(1'b1),
  		//----------------------------------------------------------------//
  		.HYST(hyst), 
  		.LOWEMI(lowemi), 
  		.IO(MSPI_CSN_PAD)
  		);

  //MASTER SCK
  BD4SCARUDQPCZ_SF_1V8_FC_LIN I_spi_master_sck_IO
  	( 
  		.ZI(master_sck_in), 
  		.A(master_sck_out), 
  		.EN(master_output), 
  		.TA(), 
  		.TEN(), 
  		.TM(padmode_testio),
  		//----------------------------------------------------------------//
  		// ACTIVE LOW signals to Pull Up (PU) and Pull Down (PD) the PAD
  		.PUN(1'b1),    
  		.PDN(pd_master),  
  		.PUN15K(1'b1),
  		//----------------------------------------------------------------//
  		.HYST(hyst), 
  		.LOWEMI(lowemi), 
  		.IO(MSPI_SCK_PAD)
  		);
  /////////////////////////////////////////////////////////////////////////////////////////////////

  
  assign always_input  = 1'b1;
  assign always_output = ~always_input;
  
  assign always_clock  = 1'b0; //enables permanently hyst on clock pins
  assign always_reset  = 1'b0; //enables permanently hyst on reset pins
  
  assign no_hyst = 1'b1;
  
  always_comb
  begin
		master_cs_out   = spi_master_csn;
		master_sck_out  = spi_master_sck;  				

  		case (padmode_spi_master)
  			`SPI_STD:
  			begin
  				master_dio0_en  = always_output;  // dio0 -> SDO output
  				master_dio1_en  = always_input;   // dio1 -> SDI input
  				master_dio2_en  = always_input;  // not used 
  				master_dio3_en  = always_input;  // not used
  				master_output   = always_output; // csn and sck are output
  				spi_master_sdi0 = master_dio1_in;
  				spi_master_sdi1 = 1'b0;
  				spi_master_sdi2 = 1'b0;
  				spi_master_sdi3 = 1'b0;
  				master_dio0_out = spi_master_sdo0;
  				master_dio1_out = 1'b0;
  				master_dio2_out = 1'b0;
  				master_dio3_out = 1'b0;
  			end
  			`SPI_QUAD_TX:
  			begin
  				master_dio0_en = always_output;  // dio0 -> SDO0 output
  				master_dio1_en = always_output;  // dio1 -> SDO1 output
  				master_dio2_en = always_output;  // dio2 -> SDO2 output
  				master_dio3_en = always_output;  // dio3 -> SDO3 output
  				master_output   = always_output; // csn and sck are output
  				spi_master_sdi0 = 1'b0;
  				spi_master_sdi1 = 1'b0;
  				spi_master_sdi2 = 1'b0;
  				spi_master_sdi3 = 1'b0;
  				master_dio0_out = spi_master_sdo0;
  				master_dio1_out = spi_master_sdo1;
  				master_dio2_out = spi_master_sdo2;
  				master_dio3_out = spi_master_sdo3;
  			end
  			`SPI_QUAD_RX:
  			begin
  				master_dio0_en = always_input;  // dio0 -> SDI0 input
  				master_dio1_en = always_input;  // dio1 -> SDI1 input
  				master_dio2_en = always_input;  // dio2 -> SDI2 input
  				master_dio3_en = always_input;  // dio3 -> SDI3 input
  				master_output   = always_output; // csn and sck are output
  				spi_master_sdi0 = master_dio0_in;
  				spi_master_sdi1 = master_dio1_in;
  				spi_master_sdi2 = master_dio2_in;
  				spi_master_sdi3 = master_dio3_in;
  				master_dio0_out = 1'b0;
  				master_dio1_out = 1'b0;
  				master_dio2_out = 1'b0;
  				master_dio3_out = 1'b0;
  			end
  			default:
  			begin
  				master_dio0_en = always_input;  // dio0 -> SDI0 input
  				master_dio1_en = always_input;  // dio1 -> SDI1 input
  				master_dio2_en = always_input;  // dio2 -> SDI2 input
  				master_dio3_en = always_input;  // dio3 -> SDI3 input
  				master_output   = always_output; // csn and sck are output
  				spi_master_sdi0 = 1'b0;
  				spi_master_sdi1 = 1'b0;
  				spi_master_sdi2 = 1'b0;
  				spi_master_sdi3 = 1'b0;
  				master_dio0_out = 1'b0;
  				master_dio1_out = 1'b0;
  				master_dio2_out = 1'b0;
  				master_dio3_out = 1'b0;
  			end
  		endcase
	end
endmodule


