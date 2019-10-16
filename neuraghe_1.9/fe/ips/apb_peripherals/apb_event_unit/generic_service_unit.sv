`include "defines_event_unit.sv"

module generic_service_unit 
#(
	parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
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
	
	input  logic			   [31:0] signal_i, // generic signal could be an interrupt or an event
	output logic			   [31:0] irq_o
);

    // registers
    logic [0:`REGS_MAX_IDX] [31:0]  regs_q, regs_n;
    
    // internal signals
    logic [4:0] highest_pending_int;

    // APB register interface
    logic [`REGS_MAX_ADR-1:0]       register_adr;
    
    assign register_adr = PADDR[`REGS_MAX_ADR + 1:2];
    // interrupt signaling comb
    // retrieve the highest pending interrupt
    // level-triggered one hot encoded
    always_comb
    begin
        highest_pending_int = 'b0;
        irq_o = 32'b0;

        for (int i = 0; i < 32; i++)
        begin
            if (regs_q[`REG_PENDING][i])
            begin
                highest_pending_int = i;
                break;
            end
        end
        // as long as there are pending interrupts and core has acknowleged, cleared the last interrupt pull irq line high
        if (regs_q[`REG_PENDING] != 'b0)
            irq_o[highest_pending_int] = 1'b1;

    end
    // APB logic: we are always ready to capture the data into our regs
    // not supporting transfare failure
    assign PREADY = 1'b1;
    assign PSLVERR = 1'b0;


    logic [31:00] pending_int;
    // register write logic
    always_comb
    begin
        regs_n = regs_q;

        // clear pending set and clear register after one cycle
        regs_n[`REG_SET_PENDING] = 32'b0;
        regs_n[`REG_CLEAR_PENDING] = 32'b0;

        // update the pending register if new interrupts have arrived
        pending_int = ((regs_q[`REG_ENABLE] & signal_i) | regs_q[`REG_PENDING]);

        // set pending interrupt e.g. software interrupts
        pending_int = pending_int | regs_q[`REG_SET_PENDING];

        // clear pending interrupts
        
        for (int i = 0; i < 32; i++)
        begin
            if (regs_q[`REG_CLEAR_PENDING][i])
                pending_int[i] = 1'b0;
        end
        
        
        // written from APB bus
        if (PSEL && PENABLE && PWRITE)
        begin

            unique case (register_adr)
                `REG_ENABLE:
                    regs_n[`REG_ENABLE] = PWDATA;

                // can be written e.g. for sw interrupts or clearing all pending interrupts
                `REG_PENDING:
                    pending_int = PWDATA;

                `REG_SET_PENDING:
                    regs_n[`REG_SET_PENDING] = PWDATA;

                `REG_CLEAR_PENDING:
                    regs_n[`REG_CLEAR_PENDING] = PWDATA;
            endcase
        end

        regs_n[`REG_PENDING] = pending_int;

    end

    // register read logic
    always_comb
    begin
        PRDATA = 'b0;

        if (PSEL && PENABLE && !PWRITE)
        begin

            unique case (register_adr)
                `REG_ENABLE:
                    PRDATA = regs_q[`REG_ENABLE];

                `REG_PENDING:
                    PRDATA = regs_q[`REG_PENDING];

                default:
                    PRDATA = 'b0;
            endcase
        end
    end

    // synchronouse part
    always_ff @(posedge HCLK, negedge HRESETn)
    begin
        if(~HRESETn)
        begin
            regs_q          <= '{default: 32'b0};
        end
        else
        begin            
            regs_q          <= regs_n;
        end
    end
    

endmodule