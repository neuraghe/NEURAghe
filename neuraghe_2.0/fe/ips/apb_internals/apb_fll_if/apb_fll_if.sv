module apb_fll_if
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

    output logic                      fll1_req,
    output logic                      fll1_wrn,
    output logic                [1:0] fll1_add,
    output logic               [31:0] fll1_data,
    input  logic                      fll1_ack,
    input  logic               [31:0] fll1_r_data,
    output logic                      fll2_req,
    output logic                      fll2_wrn,
    output logic                [1:0] fll2_add,
    output logic               [31:0] fll2_data,
    input  logic                      fll2_ack,
    input  logic               [31:0] fll2_r_data
);

    logic                          rvalid;

    logic                   [31:0] data;
    logic                          cvp_select;

    logic                          fll1_ack_sync0;
    logic                          fll1_ack_sync;
    logic                          fll2_ack_sync0;
    logic                          fll2_ack_sync;

    logic                          fll1_valid;
    logic                          fll2_valid;

    enum logic [2:0] { IDLE, WAITDATA, CVP1_PHASE1, CVP1_PHASE2, CVP2_PHASE1, CVP2_PHASE2} state,state_next;

    always_ff @(posedge HCLK, negedge HRESETn)
    begin
        if (!HRESETn)
        begin
            fll1_ack_sync0 <= 1'b0;
            fll1_ack_sync  <= 1'b0;
            fll2_ack_sync0 <= 1'b0;
            fll2_ack_sync  <= 1'b0;
            state          <= IDLE;
        end
        else
        begin
            fll1_ack_sync0 <= fll1_ack;
            fll1_ack_sync  <= fll1_ack_sync0;
            fll2_ack_sync0 <= fll2_ack;
            fll2_ack_sync  <= fll2_ack_sync0;
            state          <= state_next;
        end
    end

    always_comb
    begin
        state_next    = IDLE;
        rvalid        = 1'b0;
        fll1_req      = 1'b0;
        fll2_req      = 1'b0;
        fll1_valid    = 1'b0;
        fll2_valid    = 1'b0;

        case(state)
        IDLE:
        begin
            if (PSEL && PENABLE)
            begin
                if (PADDR[5])
                begin
                    fll2_valid = 1'b1;
                    state_next = CVP2_PHASE1;
                end
                else
                begin
                    fll1_valid = 1'b1;
                    state_next = CVP1_PHASE1;
                end
            end
            else
            begin
                    state_next        = IDLE;
            end
        end

        CVP1_PHASE1:
        begin
            if (fll1_ack_sync)
            begin
                fll1_req   = 1'b0;
                fll1_valid = 1'b0;
                state_next = CVP1_PHASE2;
                rvalid = 1'b1;
            end
            else
            begin
                fll1_req   = 1'b1;
                fll1_valid = 1'b1;
                state_next = CVP1_PHASE1;
            end
        end

        CVP1_PHASE2:
        begin
            if (!fll1_ack_sync)
                state_next = IDLE;
            else
                state_next = CVP1_PHASE2;
        end

        CVP2_PHASE1:
        begin
            if (fll2_ack_sync)
            begin
                fll2_req   = 1'b0;
                fll2_valid = 1'b0;
                state_next = CVP2_PHASE2;
                rvalid     = 1'b1;
            end
            else
            begin
                fll2_req   = 1'b1;
                fll2_valid = 1'b1;
                state_next = CVP2_PHASE1;
            end
        end

        CVP2_PHASE2:
        begin
            if (!fll2_ack_sync)
                state_next = IDLE;
            else
                state_next = CVP2_PHASE2;
        end
        endcase
    end


    assign fll1_wrn   = fll1_valid ? ~PWRITE    : 1'b0;
    assign fll1_add   = fll1_valid ? PADDR[4:3] : '0;
    assign fll1_data  = fll1_valid ? PWDATA     : '0;

    assign fll2_wrn   = fll2_valid ? ~PWRITE    : 1'b0;
    assign fll2_add   = fll2_valid ? PADDR[4:3] : '0;
    assign fll2_data  = fll2_valid ? PWDATA     : '0;

    assign PREADY        = rvalid;
    assign PRDATA        = (state == CVP2_PHASE1) ? fll2_r_data[31:0] : fll1_r_data[31:0];
    assign PSLVERR       = 1'b0;

endmodule
