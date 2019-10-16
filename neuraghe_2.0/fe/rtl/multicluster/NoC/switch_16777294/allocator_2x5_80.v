///////////////////////////////////////////////////////////////////////////////
// Copyright 2009 iNoCs                                                      //
//                                                                           //
// name         /home/chester/Desktop/prj/XPIPES_fresh/inocs/flow/rtl/verilog/switch_16777294/allocator_2x5_80.v                                     //
// author       Federico Angiolini - angiolini@inocs.com                     //
// author       Antonio Pullini - pullini@inocs.com                          //
// info         switch arbitration logic.  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
//                    Automatically generated - don't edit                   //
//           File generated for topology: noc18_4sw_80bits_run0           //
///////////////////////////////////////////////////////////////////////////////

`include "noc_parameters.v"

module allocator_2x5_80(clk, rst, which_port, select, VALID_out, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out, busy_in, FLIT_in_0, VALID_in_0, FWDAUX1_in_0, FLIT_in_1, VALID_in_1, FWDAUX1_in_1, shift_ctl);

    input  clk;
    input  rst;
    input  busy_in;
    input  [2 : 0] which_port;
    output VALID_out;
    wire   VALID_out;
    output [1 : 0] select, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out;
    wire   [1 : 0] select, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out;
    output shift_ctl;
    wire   shift_ctl;
    input  [79 : 0] FLIT_in_0;
    input  VALID_in_0;
    input  FWDAUX1_in_0;
    input  [79 : 0] FLIT_in_1;
    input  VALID_in_1;
    input  FWDAUX1_in_1;

    reg    [1 : 0] last_sel;
    wire   [1 : 0] last_sel_next;
`ifdef RROBIN_SWITCH_POLICY
    wire   [1 : 0] priority_next, pending_request_next;
    reg    [1 : 0] priority, pending_request;
`endif
    wire   [1 : 0] accept, not_accept, is_request, tail, single, want, sel_int, grant, payload, match, request, not_dummy;
    wire   avail;
`ifdef RROBIN_SWITCH_POLICY
    wire   [1 : 0] grant1, grant2, carry1, carry2;
`endif
`ifdef FIXEDPRI_SWITCH_POLICY
    wire   [0 : 0] pass;
`endif
    wire   [1 : 0] head, res_h, res_p, res_t, res_s, busy_buff;
    
    assign is_request = {VALID_in_1, VALID_in_0};
    assign not_dummy = is_request;
    
    // Is this a head, payload, tail or single flit?
    // (If a head or single,) does it want to go to our output port?
    assign res_h = {(FLIT_in_1[`FTYPEWD - 1 : 0] == `ENC_HEAD), (FLIT_in_0[`FTYPEWD - 1 : 0] == `ENC_HEAD)};
    assign res_p = {(FLIT_in_1[`FTYPEWD - 1 : 0] == `ENC_PAYL), (FLIT_in_0[`FTYPEWD - 1 : 0] == `ENC_PAYL)};
    assign res_t = {(FLIT_in_1[`FTYPEWD - 1 : 0] == `ENC_TAIL), (FLIT_in_0[`FTYPEWD - 1 : 0] == `ENC_TAIL)};
    assign res_s = {(FLIT_in_1[`FTYPEWD - 1 : 0] == `ENC_SING), (FLIT_in_0[`FTYPEWD - 1 : 0] == `ENC_SING)};
    
    //Check this output port's ID
    assign match = {(FLIT_in_1[3 + `FTYPEWD - 1 : `FTYPEWD] == which_port), (FLIT_in_0[3 + `FTYPEWD - 1 : `FTYPEWD] == which_port)};
    
    // Build an "array" replicating the busy status for every input
    assign busy_buff = {2{busy_in}};
    
    // Now evaluate whether this is a *meaningful* head, payload, tail or single
    assign head = res_h & not_dummy;
    assign payload = res_p & not_dummy;
    assign tail = res_t & not_dummy;
    assign single = res_s & not_dummy;
    
    assign request = (head | single) & match;
    
    // See if this flit is wanting to go through this output port,
    // either because it's following a previously accepted head or
    // because it's a head or single wanting this output port
    assign want = (request | last_sel) & not_dummy;
    
    // We can accept new packets only if no open packet is pending and
    // if there is buffering available
    assign avail = (~| last_sel) & !busy_in;
    
    // Arbitrate among the inputs
`ifdef RROBIN_SWITCH_POLICY
    // Dally, pp. 354-356
    assign grant1 = {(request[1] & ( priority[1] | carry1[0] ) & avail), (request[0] & priority[0] & avail)};
    assign carry1 = {((~request[1]) & (~pending_request[1]) & (carry1[0] | priority[1])), ((~request[0]) & (~pending_request[0]) & priority[0])};
    assign grant2 = {(request[1] & ( priority[1] | carry2[0] ) & avail), (request[0] & (priority[0] | carry1[1]) & avail)};
    assign carry2 = {((~request[1]) & (~pending_request[1]) & (carry1[0] | priority[1])), ((~request[0]) & (~pending_request[0]) & (carry1[1] | priority[0]))};
    assign grant = grant1 | grant2;
    assign priority_next = {(grant[0] | (priority[1] & ( !(| grant) ))), (grant[1] | ( priority[0]  & ( !(| grant) ) ) )};
    assign pending_request_next = ((pending_request | request) & (~grant));
`elsif FIXEDPRI_SWITCH_POLICY
    // Dally, p. 353
    assign pass = avail & !request[0];
    assign grant = request & {pass, avail};
`endif
    
    // Tell the muxing logic what flit we want to let in
    assign select = grant | (last_sel & not_dummy);
    
    // Feedback: did we let this flit in or not?
    assign sel_int = grant | last_sel;
    assign accept = want & sel_int & (~busy_buff);
    assign not_accept = want & ((~sel_int) | busy_buff);
    
    // Without waiting for the arbitration, there is a valid output if:
    // - A new flit is coming for the previously arbitrated port, OR
    // - No port holds the arbitration and at least one valid request is there.
    assign VALID_out = ((last_sel & not_dummy) || ((request & not_dummy) && !(| last_sel)));
    assign BWDAUX1_out = not_accept;
    assign BWDAUX2_out = 1'b0;
    assign BWDAUX3_out = 1'b0;
    
    // Close open packets when tails arrive and are acknowledged, or if they are single-flit
    // The input port is ours if:
    // - We just granted an incoming head (not just a single), OR
    // - We already owned that port AND we did not receive a valid tail
    assign last_sel_next = ((grant & head) | (last_sel & (~tail | ~accept)));
    //TODO try: busy_buff instead of ~accept
    
    // If we're granting this flit, then it's a head or single flit and we must
    // operate the shifting logic to trim one PATH field away from it
    assign shift_ctl = (| grant);
    
    always @ (posedge clk `RESET_SENSITIVITY)
    begin: flip_flops
      if (rst == `RESET_ACTIVE_VALUE)
        begin
          last_sel <= 1'b0;
`ifdef RROBIN_SWITCH_POLICY
          priority <= 1'b1;
          pending_request <= 1'b0;
`endif
        end
      else
        begin
          last_sel <= last_sel_next;
`ifdef RROBIN_SWITCH_POLICY
          priority <= priority_next;
          pending_request <= pending_request_next;
`endif
        end
    end

endmodule
