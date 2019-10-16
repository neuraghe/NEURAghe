/******************************************************************************
 *                                                                            *
 *                     Università degli Studi di Cagliari                     *
 *             Dipartimento di Ingegneria Elettrica ed Elettroni              *
 *                                                                            *
 * Engineer:       Stefano Corda - stefanocorda1993@gmail.com                 *
 *                                                                            *
 * Project:        HW convolutional engine                                    *
 * File:           pooling_data_shift_register.sv                             *
 * Description:    Shift register of pooling layer                            * 
 ******************************************************************************/

`include "hwce_types.sv"

module pooling_data_shift_register
#(
  parameter LINEBUFFER_WIDTH = 120,
  parameter CONV_WIDTH = 16
)
(
  input logic						  clk,
  input  logic                                            clk_gated, 
  input  logic                                            rst_n,
  
  input logic [CONV_WIDTH-1:0]                            data,
  input logic                                             write,
  input logic [15:0]                                      half_image_width,
  
  output logic [CONV_WIDTH-1:0]                           current_data   
);

logic [LINEBUFFER_WIDTH-1:0] [CONV_WIDTH-1:0]             acc_data;  

genvar i;


//se il segnale write è alto
//si inserisce nello shift register
//il nuovo dato, traslando verso
//destra i dati già presenti
generate
for(i=0; i<LINEBUFFER_WIDTH;i++)begin 
    always_ff@(posedge clk_gated)begin
        if(write==1)begin
            if(i==0)begin
                acc_data[i]<=data;
            end
            else begin
                acc_data[i]<=acc_data[i-1];
            end
        end
    end
end
endgenerate

   
//l'uscita è sempre in posizione
//half_image_width-1 
always_comb 
    begin
        current_data=acc_data[half_image_width-1];  
    end   

endmodule
