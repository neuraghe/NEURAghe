`include "noc_parameters.v"

module ni_flit_type(flit_sequence, flit_counter, num_flit_to_transmit, flit_type);

   input [`FTYPEWD - 1 : 0] flit_sequence;
   input [`COUNTERFLITWD - 1 : 0] flit_counter;
   input [`COUNTERFLITWD - 1 : 0] num_flit_to_transmit;
   output [`FTYPEWD - 1 : 0] flit_type;
   reg [`FTYPEWD - 1 : 0] flit_type;

	always @(flit_sequence or flit_counter or num_flit_to_transmit)
		begin: flit_type_gen
			case (flit_sequence) //synopsys parallel_case
				`ENC_HEAD:
					if (flit_counter == 0)
						flit_type <= `ENC_HEAD;
					else
						flit_type <= `ENC_PAYL;
				`ENC_TAIL:
					if (flit_counter == (num_flit_to_transmit - 1))
						flit_type <= `ENC_TAIL;
					else
						flit_type <= `ENC_PAYL;
				`ENC_PAYL:
					flit_type <= `ENC_PAYL;
				`ENC_SING:
					if (flit_counter == 0 && flit_counter == (num_flit_to_transmit - 1))
						flit_type <= `ENC_SING;
					else
						begin
							if (flit_counter == 0)
								flit_type <= `ENC_HEAD;
							else
								begin
									if (flit_counter == (num_flit_to_transmit - 1))
										flit_type <= `ENC_TAIL;
									else
										flit_type <= `ENC_PAYL;
								end
						end
				default:
					begin
						flit_type <= `ENC_TAIL;
					end
			endcase
		end
endmodule
