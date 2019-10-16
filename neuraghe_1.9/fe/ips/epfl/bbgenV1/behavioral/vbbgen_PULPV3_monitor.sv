module vbbgen_PULPV3_monitor
(
    input  logic [4:0]     pwell_value_LB        , // 
    input  logic [4:0]     pwell_value_UB        , // 
    input  logic [4:0]     nwell_value_LB        , // 
    input  logic [4:0]     nwell_value_UB        , // 

    input  logic           nwell_clk             , // 
    input  logic           pwell_pos_clk         , // 
    input  logic           pwell_neg_clk         , // 

    output logic           compare_pwell_neg_LB  , // 
    output logic           compare_pwell_neg_UB  , // 
    output logic           compare_nwell_LB      , // 
    output logic           compare_nwell_UB      , // 
    output logic           compare_pwell_pos_LB  , // 
    output logic           compare_pwell_pos_UB    // 
);
    logic enable;

    integer i;

    initial
    begin
            enable = 0;
            compare_pwell_neg_LB  = '0;
            compare_pwell_neg_UB  = '0;
            compare_nwell_LB      = '0;
            compare_nwell_UB      = '0;
            compare_pwell_pos_LB  = '0;
            compare_pwell_pos_UB  = '0;
  #90000000 compare_pwell_neg_LB = 1'b1;
            compare_pwell_pos_LB = 1'b1;
            compare_nwell_LB = 1'b1;
            enable = 1;
    end


    always @(pwell_value_LB or pwell_value_UB or enable)
    begin
        if (enable)
        begin
                   compare_pwell_neg_LB = 1'b0;
                   compare_pwell_pos_LB = 1'b0;
                   for (i=0;i<(pwell_value_LB+pwell_value_UB);i++)
                        #1000000;
                   compare_pwell_neg_LB = 1'b1;
                   compare_pwell_pos_LB = 1'b1;
        end
    end

    always @(nwell_value_LB or nwell_value_UB or enable)
    begin
        if (enable)
        begin
                    compare_nwell_LB = 1'b0;
                    for (i=0;i<(nwell_value_LB+nwell_value_UB);i++)
                        #1000000;
                    compare_nwell_LB = 1'b1;
        end
    end


 
endmodule // vbbgen_monitor_PULPV3
