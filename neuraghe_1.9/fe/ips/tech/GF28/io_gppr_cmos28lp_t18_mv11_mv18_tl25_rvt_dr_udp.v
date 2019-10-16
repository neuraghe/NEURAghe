primitive udp_oe (out, a, b);
   output out;
   input  a, b;

   table

// a  b  :  out
//
   1  1  :   1 ;  //oe enabled
   1  0  :   0 ;  //oe disabled
   1  x  :   0 ;  //oe disabled
   0  ?  :   0 ;  //oe disabled

   endtable
endprimitive // udp_oe
primitive udp_sns_pin_rr_lvds (y, y_int, sns, dvdd, vdd);
   output y;
   input  y_int, sns, dvdd, vdd;

   table
// y_int sns dvdd vdd : y
//
	1	1	1	1	:	1;
	0	1	1	1	:	0;
	?	?	?	0	:	0;

   endtable
endprimitive // udp_sns_pin_rr_lvds

primitive udp_retls (out, a, b);
   output out;
   input  a, b;

   table

// a  b  :  out
//
   0  1  :   0 ;  //
   1  0  :   1 ;  //

   endtable
endprimitive // udp_retls

primitive udp_lat_rto (out, dvdd, in, hold, NOTIFIER);
   output out;
   input  dvdd, in, hold, NOTIFIER;
   reg    out;

   table

// dvdd in hold NOT : Qt : Qt+1
//
   1  1  1   ?    : ?  :  1  ; // 
   1  0  1   ?    : ?  :  0  ; // 
   1  ?  0   ?    : ?  :  -  ; // with pessimism
   0  ?  ?   ?    : ?  :  x  ; // no power 
   x  ?  ?   ?    : ?  :  x  ; // unknown power 
   ?  ?  ?   *    : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_lat_rto
primitive udp_odt_detect (out, a, b);
   output out;
   input  a, b;

   table

// a  b  :  out
//
   0  1  :   1 ;  //
   1  0  :   1 ;  //
	0	0	:	 0 ; 
	0	x	:	 0 ; 
	x	0	:	 0 ; 
	1	1	:	 0 ; 
	1	x	:	 0 ; 
	x	1	:	 0 ;
   endtable
endprimitive // udp_odt_detect

primitive udp_diff_pad (pad, padp, padn);
   output pad;
   input  padp, padn;
table
// padp padn  : pad
   1     0   : 1;
   0     1   : 0;
   endtable
endprimitive

primitive udp_bias_mux (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table
// in0 in1  sel :  out
//
   1    ?    0  :   1 ;
   0    ?    0  :   0 ;
   ?    1    1  :   1 ;
   ?    0    1  :   0 ;

   endtable
endprimitive

primitive udp_io_mux (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table
// in0 in1  sel :  out
//
   1    ?    0  :   1 ;
   0    ?    0  :   0 ;
   ?    1    1  :   1 ;
   ?    0    1  :   0 ;
   0    0    x  :   0 ;
   1    1    x  :   1 ;

   endtable
endprimitive  // udp_io_mux
