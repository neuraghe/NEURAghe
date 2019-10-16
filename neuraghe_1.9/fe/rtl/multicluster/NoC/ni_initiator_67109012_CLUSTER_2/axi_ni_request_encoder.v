`include "noc_parameters.v"

module axi_ni_request_encoder(araddr, awaddr, aburst, alen, asize, wstrb, write_select, burst_length, burst_increment, burst_sequence, burst_precise, byte_enables, command, address);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIRDATAWD = 32;
    parameter AXIWDATAWD = 32;
    parameter AXIARADDRWD = 32;
    parameter AXIAWADDRWD = 32;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    function integer log2(input integer value);
    begin
        value = value - 1;
        for (log2 = 0; value > 0; log2 = log2 + 1)
            value = value >> 1;
    end
    endfunction

    input [AXIARADDRWD - 1 : 0]               araddr;
    input [AXIAWADDRWD - 1 : 0]               awaddr;
    input [`AXIBURSTWD - 1 : 0]               aburst;
    input [`AXILENWD - 1 : 0]                 alen;
    input [`AXISIZEWD - 1 : 0]                asize;
    input [(AXIWDATAWD / 8) - 1 : 0]          wstrb;
    input                                     write_select;
    output [`PACKETBURSTLENGTHWD - 1 : 0]     burst_length;
    output reg [`PACKETBURSTINCRWD - 1 : 0]   burst_increment;
    output reg [`PACKETBURSTSEQWD - 1 : 0]    burst_sequence;
    output                                    burst_precise;
    output reg [`PACKETBYTEENABLEWD - 1 : 0]  byte_enables;
    output [`PACKETCOMMANDWD - 1 : 0]         command;
    output reg [`PACKETADDRESSWD - 1 : 0]     address;

    // Not strictly needed, but avoids a synthesis issue with the synthesis of the loop for byte enables
    wire [(2 ** `AXISIZEWD) - 1 : 0] ben_index;

    integer loop;

    always @(aburst)
    begin: burst_sequence_encoding
        case (aburst) //synopsys parallel_case
            `AXIBURST_FIXED:
                burst_sequence <= `PACKETBURSTSTRM;
            `AXIBURST_INCR:
                burst_sequence <= `PACKETBURSTINCR;
            `AXIBURST_WRAP:
                burst_sequence <= `PACKETBURSTWRAP;
            default:
                burst_sequence <= `PACKETBURSTINCR;
          endcase
        end

    always @(asize)
    begin: burst_increment_encoding
        case (asize) //synopsys parallel_case
            `AXISIZE_8bits:
                burst_increment <= 'h0;
            `AXISIZE_16bits:
                burst_increment <= 'h1;
            `AXISIZE_32bits:
                burst_increment <= 'h2;
            `AXISIZE_64bits:
                burst_increment <= 'h3;
            `AXISIZE_128bits:
                burst_increment <= 'h4;
            `AXISIZE_256bits:
                burst_increment <= 'h5;
            `AXISIZE_512bits:
                burst_increment <= 'h6;
            `AXISIZE_1024bits:
                burst_increment <= 'h7;
            default:
                burst_increment <= 'h0;
        endcase
    end

    always @(wstrb or asize or araddr or write_select or ben_index)
    begin: byte_enables_encoding
        if (write_select)
            byte_enables = wstrb;
        else
        begin
            byte_enables = 0;
            for (loop = 0; loop < 2 ** (2 ** `AXISIZEWD); loop = loop + 1)
                if (loop < ben_index)
                    byte_enables = byte_enables | (1'b1 <<< (loop + araddr[(log2(AXIRDATAWD / 16)) : 0])); //TODO if 8 bits??
        end
    end

    always @(araddr or awaddr or write_select or burst_increment)
    begin: address_encoding
        if (write_select)
        begin
            for (loop = 0; loop < AXIAWADDRWD; loop = loop + 1)
                if (loop < burst_increment)
                    address[loop] = 1'b0;
                else
                    address[loop] = awaddr[loop];
        end
        else
        begin
            for (loop = 0; loop < AXIARADDRWD; loop = loop + 1)
                if (loop < burst_increment)
                    address[loop] = 1'b0;
                else
                    address[loop] = araddr[loop];
        end
    end

    assign burst_precise = 1'b1;
    assign command = (write_select == 1'b1 ? `PACKETCMDWRNP : `PACKETCMDREAD);
    assign ben_index = 1'b1 << asize;
    assign burst_length = alen + 'h1;

endmodule
