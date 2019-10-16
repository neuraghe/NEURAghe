module axi_buffer_rab(clk, rstn, data_out, valid_out, ready_in, valid_in, data_in, ready_out);

    parameter DATA_WIDTH = 32;
    parameter BUFFER_DEPTH = 4;
    parameter LOG_BUFFER_DEPTH = 2;

    input clk;
    input rstn;

    // Downstream port 
    output [DATA_WIDTH - 1 : 0] data_out;
    output valid_out;
    input ready_in;      

    // Upstream port 
    input valid_in;
    input [DATA_WIDTH - 1 : 0] data_in;
    output ready_out;

    // Internal data structures
    reg [LOG_BUFFER_DEPTH - 1 : 0] pointer_in;      // location to which we last wrote
    reg [LOG_BUFFER_DEPTH - 1 : 0] pointer_out;     // location from which we last sent
    reg [LOG_BUFFER_DEPTH : 0] elements;            // number of elements in the buffer
    reg [DATA_WIDTH - 1 : 0] buffer [BUFFER_DEPTH - 1 : 0];

    wire full;

    integer loop1;

    assign full = (elements == BUFFER_DEPTH);

    always @(posedge clk or negedge rstn)
      begin: elements_sequential
        if (rstn == 1'b0)
          elements <= 0;
        else
        begin
          // ------------------
          // Are we filling up?
          // ------------------
          // One out, none in
          if (ready_in && valid_out && (!valid_in || full))
            elements <= elements - 1;
          // None out, one in
          else if ((!valid_out || !ready_in) && valid_in && !full)
            elements <= elements + 1;
          // Else, either one out and one in, or none out and none in - stays unchanged
        end
      end

    always @(posedge clk or negedge rstn)
      begin: buffers_sequential
        if (rstn == 1'b0)
        begin
          for (loop1 = 0 ; loop1 < BUFFER_DEPTH ; loop1 = loop1 + 1)
            buffer[loop1] <= 0;
        end
        else
        begin
          // Update the memory
          if (valid_in && !full)
            buffer[pointer_in] <= data_in;
        end
      end

    always @(posedge clk or negedge rstn)
      begin: sequential
        if (rstn == 1'b0)
        begin
          pointer_out <= 0;
          pointer_in <= 0;
        end
        else
        begin
          // ------------------------------------
          // Check what to do with the input side
          // ------------------------------------
          // We have some input, increase by 1 the input pointer
          if (valid_in && !full)
          begin
            if (pointer_in == $unsigned(BUFFER_DEPTH - 1))
              pointer_in <= 0;
            else
              pointer_in <= pointer_in + 1;
          end
          // Else we don't have any input, the input pointer stays the same

          // -------------------------------------
          // Check what to do with the output side
          // -------------------------------------
          // We had pushed one flit out, we can try to go for the next one
          if (ready_in && valid_out)
          begin
            if (pointer_out == $unsigned(BUFFER_DEPTH - 1))
              pointer_out <= 0;
            else
              pointer_out <= pointer_out + 1;
          end
          // Else stay on the same output location
        end
      end

    // Update output ports
    assign data_out = buffer[pointer_out];
    assign valid_out = (elements != 0);

    assign ready_out = ~full;

endmodule
