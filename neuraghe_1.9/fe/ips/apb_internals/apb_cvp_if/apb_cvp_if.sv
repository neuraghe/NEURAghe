module apb_cvp_if
#(
    parameter APB_ADDR_WIDTH = 12
)
(
    input  logic                      HCLK,
    input  logic                      HRESETn,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR,

    output logic                      cvp1_pwr_req,
    output logic                      cvp1_pwr_wr_rd,
    output logic               [28:0] cvp1_pwr_add,
    output logic                [7:0] cvp1_pwr_be,
    output logic               [63:0] cvp1_pwr_data,
    input  logic                      cvp1_pwr_ack,
    input  logic                      cvp1_pwr_error,
    input  logic               [63:0] cvp1_pwr_r_data,
    output logic                      cvp2_pwr_req,
    output logic                      cvp2_pwr_wr_rd,
    output logic               [28:0] cvp2_pwr_add,
    output logic                [7:0] cvp2_pwr_be,
    output logic               [63:0] cvp2_pwr_data,
    input  logic                      cvp2_pwr_ack,
    input  logic                      cvp2_pwr_error,
    input  logic               [63:0] cvp2_pwr_r_data
);

    logic                          rvalid;

    logic                   [63:0] data;
    logic                    [7:0] wstrb;
    logic                          cvp_select;

    logic                          cvp1_pwr_ack_sync0;
    logic                          cvp1_pwr_ack_sync;
    logic                          cvp2_pwr_ack_sync0;
    logic                          cvp2_pwr_ack_sync;

    logic                          cvp1_req;
    logic                          cvp2_req;

    logic [31:0] cvp1_pwr_r_data_32bit;
    logic [31:0] cvp2_pwr_r_data_32bit;

    enum logic [2:0] { IDLE, WAITDATA, CVP1_PHASE1, CVP1_PHASE2, CVP2_PHASE1, CVP2_PHASE2} state, state_next;

    always_ff @(posedge HCLK, negedge HRESETn)
    begin
        if (!HRESETn)
        begin
            cvp1_pwr_ack_sync0 <= 1'b0;
            cvp1_pwr_ack_sync  <= 1'b0;
            cvp2_pwr_ack_sync0 <= 1'b0;
            cvp2_pwr_ack_sync  <= 1'b0;
            state              <= IDLE;
        end
        else
        begin
            cvp1_pwr_ack_sync0 <= cvp1_pwr_ack;
            cvp1_pwr_ack_sync  <= cvp1_pwr_ack_sync0;
            cvp2_pwr_ack_sync0 <= cvp2_pwr_ack;
            cvp2_pwr_ack_sync  <= cvp2_pwr_ack_sync0;
            state              <= state_next;
        end
    end

    always_comb
    begin
        state_next    = IDLE;
        rvalid        = 1'b0;
        cvp1_req      = 1'b0;
        cvp2_req      = 1'b0;
        case(state)
            IDLE:
            begin
                    if (PSEL && PENABLE)
                    begin
                        if (PWRITE)
                        begin
                            if (PADDR[11])
                                state_next = CVP2_PHASE1;
                            else
                                state_next = CVP1_PHASE1;
                        end
                        else
                        begin
                            if (PADDR[11])
                                state_next = CVP2_PHASE1;
                            else
                                state_next = CVP1_PHASE1;
                        end
                    end
                    else
                    begin
                        state_next        = IDLE;
                    end
            end //~IDLE

            CVP1_PHASE1:
            begin
                cvp1_req = 1'b1;
                if (cvp1_pwr_ack_sync)
                begin
                    state_next = CVP1_PHASE2;
                    rvalid = 1'b1;
                end
                else
                begin
                    state_next = CVP1_PHASE1;
                end
            end

            CVP1_PHASE2:
            begin
                if (!cvp1_pwr_ack_sync)
                    state_next = IDLE;
                else
                    state_next = CVP1_PHASE2;
            end

            CVP2_PHASE1:
            begin
                cvp2_req = 1'b1;
                if (cvp2_pwr_ack_sync)
                begin
                    state_next = CVP2_PHASE2;
                    rvalid = 1'b1;
                end
                else
                begin
                    state_next = CVP2_PHASE1;
                end
            end

            CVP2_PHASE2:
            begin
                if (!cvp2_pwr_ack_sync)
                    state_next = IDLE;
                else
                    state_next = CVP2_PHASE2;
            end

            default :
            begin
                state_next    = IDLE;
                rvalid        = 1'b0;
                cvp1_req      = 1'b0;
                cvp2_req      = 1'b0;
            end
        endcase
    end

    assign data  = PADDR[2] ? {PWDATA,32'h0000_0000} : {32'h0000_0000,PWDATA};
    assign wstrb = PADDR[2] ? 8'b1111_0000 : 8'b0000_1111;

    assign cvp1_pwr_wr_rd = cvp1_req ? ~PWRITE             : 1'b0;
    assign cvp1_pwr_add   = cvp1_req ? {21'h0,PADDR[10:3]} : '0;
    assign cvp1_pwr_be    = cvp1_req ? wstrb               : '0;
    assign cvp1_pwr_data  = cvp1_req ? data                : '0;
    assign cvp1_pwr_req   = cvp1_req;

    assign cvp2_pwr_wr_rd = cvp2_req ? ~PWRITE             : 1'b0;
    assign cvp2_pwr_add   = cvp2_req ? {21'h0,PADDR[10:3]} : '0;
    assign cvp2_pwr_be    = cvp2_req ? wstrb               : '0;
    assign cvp2_pwr_data  = cvp2_req ? data                : '0;
    assign cvp2_pwr_req   = cvp2_req;

    assign PREADY        = rvalid;
    assign PRDATA        = (state == CVP2_PHASE1) ? cvp2_pwr_r_data_32bit : cvp1_pwr_r_data_32bit; //FIXME ANTONIO CHECK --> added [31:0] range
    assign PSLVERR       = 1'b0;

    assign cvp1_pwr_r_data_32bit = PADDR[2] ? cvp1_pwr_r_data[63:32] : cvp1_pwr_r_data[31:0];
    assign cvp2_pwr_r_data_32bit = PADDR[2] ? cvp2_pwr_r_data[63:32] : cvp2_pwr_r_data[31:0];
endmodule
