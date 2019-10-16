`include "noc_parameters.v"

module axi_ni_receive_decoder (received_burst_length, received_burst_sequence, received_burst_increment, received_burst_precise, received_attributes, received_byte_enables_payload, decoded_LEN, decoded_SIZE, decoded_BURST, decoded_LOCK, decoded_CACHE, decoded_PROT, decoded_WSTRB);

    parameter FLIT_WIDTH = 32;
    parameter BASE_WIDTH = FLIT_WIDTH - `FTYPEWD;
    parameter AXIWDATAWD  = 32;
    `include "axi_parameters.v"
    `include "ni_parameters.v"

    input [`PACKETBURSTLENGTHWD - 1 : 0]      received_burst_length;
    input [`PACKETBURSTSEQWD - 1 : 0]         received_burst_sequence;
    input [`PACKETBURSTINCRWD - 1 : 0]        received_burst_increment;
    input [`PACKETBURSTPRECISEWD - 1 : 0]     received_burst_precise;
    input [`PACKETATTRIBUTEWD - 1 : 0]        received_attributes;
    input [`PACKETBYTEENABLEWD - 1 : 0]       received_byte_enables_payload;
    output [`AXILENWD - 1 : 0]                decoded_LEN;
    output reg [`AXISIZEWD - 1 : 0]           decoded_SIZE;
    output reg [`AXIBURSTWD - 1 : 0]          decoded_BURST;
    output [`AXILOCKWD - 1 : 0]               decoded_LOCK;
    output [`AXICACHEWD - 1 : 0]              decoded_CACHE;
    output [(AXIWDATAWD / 8)- 1 : 0]          decoded_WSTRB;
    output [`AXIPROTWD - 1 : 0]               decoded_PROT;

    always @(received_burst_sequence)
    begin: BURST_decoding
        case (received_burst_sequence) //synopsys parallel_case
            `PACKETBURSTSTRM:
                decoded_BURST <= `AXIBURST_FIXED;
            `PACKETBURSTINCR:
                decoded_BURST <= `AXIBURST_INCR;
            `PACKETBURSTWRAP:
                decoded_BURST <= `AXIBURST_WRAP;
            default:
                decoded_BURST <= `AXIBURST_FIXED;
        endcase
    end

    always @(received_burst_increment)
    begin: SIZE_decoding
        case (received_burst_increment) //synopsys parallel_case
            'h0:
                decoded_SIZE <= `AXISIZE_8bits;
            'h1:
                decoded_SIZE <= `AXISIZE_16bits;
            'h2:
                decoded_SIZE <= `AXISIZE_32bits;
            'h3:
                decoded_SIZE <= `AXISIZE_64bits;
            'h4:
                decoded_SIZE <= `AXISIZE_128bits;
            'h5:
                decoded_SIZE <= `AXISIZE_256bits;
            'h6:
                decoded_SIZE <= `AXISIZE_512bits;
            'h7:
                decoded_SIZE <= `AXISIZE_1024bits;
            default:
                decoded_SIZE <= 0;
        endcase
    end

    assign decoded_WSTRB = received_byte_enables_payload;
    assign decoded_LOCK = received_attributes[`AXILOCKWD + `AXICACHEWD + `AXIPROTWD - 1 : `AXICACHEWD + `AXIPROTWD];
    assign decoded_CACHE = received_attributes[`AXICACHEWD + `AXIPROTWD - 1 : `AXIPROTWD];
    assign decoded_PROT = received_attributes[`AXIPROTWD - 1 : 0];
    assign decoded_LEN = received_burst_length - 'h1;

endmodule
