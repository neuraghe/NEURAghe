`include "noc_parameters.v"

module out_buffer(clk, rst, FLIT_out, VALID_out, FWDAUX1_out, BWDAUX1_in, BWDAUX2_in, BWDAUX3_in, write, data_in, full);

    parameter FLIT_WIDTH = 32;
    parameter OUT_BUFFER_DEPTH = 4;
    parameter LOG_OUT_BUFFER_DEPTH = 2;

    input clk;
    input rst;

    // Downstream port (towards the following switch/NI)
    output [FLIT_WIDTH - 1 : 0] FLIT_out;
    output VALID_out;
    output FWDAUX1_out;    // REPLAY on ACK_NACK, unused otherwise
    input BWDAUX1_in;      // ACK on ACK_NACK, STALL on STALL_GO and T_ERROR
    input BWDAUX2_in;      // ACK_VALID on ACK_NACK, unused otherwise
    input BWDAUX3_in;      // unused

    // Upstream port (towards the container)
    input write;
    input [FLIT_WIDTH - 1 : 0] data_in;
    output full;

    // Internal data structures
    reg [LOG_OUT_BUFFER_DEPTH - 1 : 0] pointer_in;      // location to which we last wrote
    reg [LOG_OUT_BUFFER_DEPTH - 1 : 0] pointer_out;     // location from which we last sent
`ifdef ACK_NACK
    reg [LOG_OUT_BUFFER_DEPTH - 1 : 0] pointer_ackwait; // location with last ACKed flit
    reg is_replay;
`endif
    reg [LOG_OUT_BUFFER_DEPTH : 0] elements;            // number of elements in the buffer
    reg [FLIT_WIDTH - 1 : 0] buffer [OUT_BUFFER_DEPTH - 1 : 0];

    integer loop1;

    always @(posedge clk `RESET_SENSITIVITY)
      begin: elements_sequential
        if (rst == `RESET_ACTIVE_VALUE)
          elements <= 0;
        else
        begin
          // ------------------
          // Are we filling up?
          // ------------------
          // One out, none in
`ifdef ACK_NACK
          if (BWDAUX1_in && BWDAUX2_in && (!write || full))
`else
          if (!BWDAUX1_in && VALID_out && (!write || full))
`endif
            elements <= elements - 1;
          // None out, one in
`ifdef ACK_NACK
          else if ((!BWDAUX1_in || !BWDAUX2_in) && write && !full)
`else
          else if ((!VALID_out || BWDAUX1_in) && write && !full)
`endif
            elements <= elements + 1;
          // Else, either one out and one in, or none out and none in - stays unchanged
        end
      end

    always @(posedge clk `RESET_SENSITIVITY)
      begin: buffers_sequential
        if (rst == `RESET_ACTIVE_VALUE)
        begin
          for (loop1 = 0 ; loop1 < OUT_BUFFER_DEPTH ; loop1 = loop1 + 1)
            buffer[loop1] <= 0;
        end
        else
        begin
          // Update the memory
          if (write && !full)
            buffer[pointer_in] <= data_in;
        end
      end

    always @(posedge clk `RESET_SENSITIVITY)
      begin: sequential
        if (rst == `RESET_ACTIVE_VALUE)
        begin
          pointer_out <= 0;
          pointer_in <= 0;
`ifdef ACK_NACK
          pointer_ackwait <= 0;
          is_replay <= 0;
`endif
        end
        else
        begin
          // ------------------------------------
          // Check what to do with the input side
          // ------------------------------------
          // We have some input, increase by 1 the input pointer
          if (write && !full)
          begin
            if (pointer_in == $unsigned(OUT_BUFFER_DEPTH - 1))
              pointer_in <= 0;
            else
              pointer_in <= pointer_in + 1;
          end
          // Else we don't have any input, the input pointer stays the same

`ifdef ACK_NACK
          // ------------------------------------------------
          // Check what to do with the retransmission pointer
          // ------------------------------------------------
          // An ACK, increase by 1 the retransmission pointer
          if (BWDAUX1_in && BWDAUX2_in)
          begin
            if (pointer_ackwait == (OUT_BUFFER_DEPTH - 1))
              pointer_ackwait <= 0;
            else
              pointer_ackwait <= pointer_ackwait + 1;
          end
          // Else nothing new or NACK, the retransmission pointer stays the same
`endif
          // -------------------------------------
          // Check what to do with the output side
          // -------------------------------------
`ifdef ACK_NACK
          // A NACK, so shift back to the first flit waiting for an ACK
          if (!BWDAUX1_in && BWDAUX2_in)
          begin
            pointer_out <= pointer_ackwait;
            is_replay <= 1;
          end
          // Nothing new or ACK, we can push out new flits (if any)
          else
          begin
            // We had pushed one flit out, we can try to go for the next one
            if (VALID_out)
            begin
              if (pointer_out == (OUT_BUFFER_DEPTH - 1))
                pointer_out <= 0;
              else
                pointer_out <= pointer_out + 1;
            end
            // Else stay on the same output location
            is_replay <= 0;
          end
`else
          // We had pushed one flit out, we can try to go for the next one
          if (!BWDAUX1_in && VALID_out)
          begin
            if (pointer_out == $unsigned(OUT_BUFFER_DEPTH - 1))
              pointer_out <= 0;
            else
              pointer_out <= pointer_out + 1;
          end
          // Else stay on the same output location
`endif
        end
      end

    // Update output ports
    assign FLIT_out = buffer[pointer_out];
`ifdef ACK_NACK
    assign VALID_out = (pointer_out != pointer_in || is_replay);
`else
    assign VALID_out = (elements != 0);
`endif
`ifdef ACK_NACK
    assign FWDAUX1_out = is_replay;
`endif
    assign full = (elements == OUT_BUFFER_DEPTH);

endmodule
