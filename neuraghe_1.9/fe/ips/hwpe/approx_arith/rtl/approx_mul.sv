/******************************************************************************
 *                                                                            *
 *          ERC Multitherman Lab @ DEI - University of Bologna                *
 *                      Viale Pepoli 3/2 - 40136                              *
 *                     Bologna - phone 0512092759                             *
 *                                                                            *
 * Engineers:      Bi Danyu, Chen Shiyi (approx. arithmetic student project)  *
 *                 Francesco Conti - f.conti@unibo.it                         *
 *                                                                            *
 * Project:        ETM approximate multiplier                                 *
 * File:           approx_mul_smart.sv                                        *
 * Description:    Error Tolerant Multiplier, see:                            *
 *                   Khaing Yin Kyaw, Wang Ling Goh, and Kiat Seng Yeo        *
 *                   Low-Power High-Speed Multiplier For Error­ Tolerant      *
 *                     Application,                                           *
 *                   2010 IEEE International Conference of Electron Devices   *
 *                     and Solid-State Circuits (EDSSC)                       *
 *                                                                            *
 ******************************************************************************/

module approx_mul
#(
   parameter N=6,             // number of bits of input x,y
   parameter SPLIT=2          // last approximate bit
)
(
   input  logic           approx,
   input  logic [N-1:0]   x,
   input  logic [N-1:0]   y,     
   output logic [2*N-1:0] p
);

   generate
      logic [2*N-1:0] p_imprecise;
      logic [2*N-1:0] p_precise;
   
      logic [2*N-1:0] p_00;
      logic [2*N-1:0] p_01;
      logic [2*N-1:0] p_01_t;
      logic [2*N-1:0] p_10;
      logic [2*N-1:0] p_10_t;
      logic [2*N-1:0] p_11;
   
      // x0, x1, y0, y1 are split and gated
      logic [N-SPLIT-1:0] x0_precise;
      logic [N-SPLIT-1:0] y0_precise;
   
      logic [N-1:SPLIT]   x1_precise;
      logic [N-1:SPLIT]   y1_precise;
      logic [N-1:SPLIT]   x1_ungated;
      logic [N-1:SPLIT]   y1_ungated;

      if (SPLIT != 0) begin
         logic [SPLIT-1:0]   x0_approx;
         logic [SPLIT-1:0]   y0_approx;
         assign x0_precise [SPLIT-1:0] = (approx==1'b1) ? 0 : x[SPLIT-1:0];
         assign y0_precise [SPLIT-1:0] = (approx==1'b1) ? 0 : y[SPLIT-1:0];
         assign x0_approx  [SPLIT-1:0] = (approx==1'b0) ? 0 : x[SPLIT-1:0];
         assign y0_approx  [SPLIT-1:0] = (approx==1'b0) ? 0 : y[SPLIT-1:0];
         etm #(
            .N(SPLIT)
         )
         etm_i (
            .x(x0_approx   [SPLIT-1:0]  ),
            .y(y0_approx   [SPLIT-1:0]  ),
            .p(p_imprecise [2*SPLIT-1:0])
         );
      end
      if(N-2*SPLIT>0) begin
         assign x0_precise [N-SPLIT-1:SPLIT] = 0;
         assign y0_precise [N-SPLIT-1:SPLIT] = 0;
      end

      assign x1_precise [N-1:SPLIT] = (approx==1'b1) ? 0 : x[N-1:SPLIT];
      assign y1_precise [N-1:SPLIT] = (approx==1'b1) ? 0 : y[N-1:SPLIT];
      assign x1_ungated [N-1:SPLIT] = x[N-1:SPLIT];
      assign y1_ungated [N-1:SPLIT] = y[N-1:SPLIT];
   
      // mul_00, mul_01 and mul_10 use gated inputs
      if (SPLIT != 0) begin
         mul #(
            .N(SPLIT)
         )
         mul_00_i (
            .s (2'b00),
            .x (x0_precise [SPLIT-1:0]  ),
            .y (y0_precise [SPLIT-1:0]  ),
            .p (p_00       [2*SPLIT-1:0])
         );
      end
      assign p_00[2*N-1:2*SPLIT] = 0;
   
      mul #(
         .N(N-SPLIT)
      )
      mul_01_i (
         .s (2'b01),
         .x (x0_precise [N-SPLIT-1:0]    ),
         .y (y1_precise [N-1:SPLIT]      ),
         .p (p_01_t     [2*N-SPLIT-1:SPLIT])
      );
      assign p_01[N+SPLIT-1:SPLIT] = p_01_t;
      if (SPLIT != 0) begin
         assign p_01[SPLIT-1:0] = 0;
      end
      assign p_01[2*N-1:N+SPLIT] = 0;
   
      mul #(
         .N(N-SPLIT)
      )
      mul_10_i (
         .s (2'b10),
         .x (x1_precise [N-1:SPLIT]      ),
         .y (y0_precise [N-SPLIT-1:0]    ),
         .p (p_10_t     [2*N-SPLIT-1:SPLIT])
      );
      assign p_10[N+SPLIT-1:SPLIT] = p_10_t;
      if (SPLIT != 0) begin
         assign p_10[SPLIT-1:0] = 0;
      end
      assign p_10[2*N-1:N+SPLIT] = 0;
   
      // mul_11 uses ungated inputs
      mul #(
         .N(N-SPLIT)
      )
      mul_11_i (
         .s (2'b11),
         .x (x1_ungated [N-1:SPLIT]    ),
         .y (y1_ungated [N-1:SPLIT]    ),
         .p (p_11       [2*N-1:2*SPLIT])
      );
      if (SPLIT != 0) begin
         assign p_11[2*SPLIT-1:0] = 0;
      end
   
      // final sum - precise mode
      always_comb
         p_precise <= p_11 + p_10 + p_01 + p_00;
   
      // etm fully-imprecise module
   
   endgenerate

   assign p_imprecise[2*N-1:2*SPLIT] = p_11 [2*N-1:2*SPLIT];

   assign p = (approx==1'b1) ? p_imprecise : p_precise;

endmodule

