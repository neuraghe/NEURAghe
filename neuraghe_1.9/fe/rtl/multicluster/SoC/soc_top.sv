`include "ulpsoc_defines.sv"

module soc_top 
#(
    parameter AXI_ADDR_WIDTH        = 32,
    parameter AXI_DATA_WIDTH        = 64,
    parameter AXI_USER_WIDTH        = 6,
    parameter AXI_ID_WIDTH          = 4
)
(
    input  logic          clk,    // Clock
    input   logic         rst_n,  // Asynchronous reset active low
    AXI_BUS.Slave         data_slave_EXT,
    output logic  [3:0]   eoc_o,
    input  logic  [3:0]   fetch_en_i
);




    AXI_BUS
    #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH)
    )
    data_master[3:0](), instr_master[3:0](), data_slave[3:0](), data_master_L2_MEM();

    UNICAD_MEM_BUS_64  l2_mem_bus();

    noc_interconnect_wrap
    #(
       .AXI_ADDR_WIDTH      ( 32                ),
       .AXI_DATA_WIDTH      ( 64                ),
       .AXI_ID_WIDTH        (  4                ),
       .AXI_USER_WIDTH      (  6                )
    )
    NOC_i
    (
        .clk                (  clk              ),
        .rst                (  ~rst_n           ),

        .data_master_CL0    (  data_master[0]   ),
        .instr_master_CL0   (  instr_master[0]  ),
        .data_slave_CL0     (  data_slave[0]    ),

        .data_master_CL1    (  data_master[1]   ),
        .instr_master_CL1   (  instr_master[1]  ),
        .data_slave_CL1     (  data_slave[1]    ),

        .data_master_CL2    (  data_master[2]   ),
        .instr_master_CL2   (  instr_master[2]  ),
        .data_slave_CL2     (  data_slave[2]    ),

        .data_master_CL3    ( data_master[3]   ),
        .instr_master_CL3   ( instr_master[3]  ),
        .data_slave_CL3     ( data_slave[3]    ),

        .data_master_L2_MEM (  data_master_L2_MEM ),
        .data_slave_EXT     (  data_slave_EXT     )
    );


    genvar i;
    generate

    for(i=0;i<4;i++)
    begin : CLUSTER

        

        dummy_ulpcluster
        #(
            // AXI PARAMETERS
            .AXI_ADDR_WIDTH    (AXI_ADDR_WIDTH), // 32,
            .AXI_DATA_WIDTH    (AXI_DATA_WIDTH), // 64,
            .AXI_USER_WIDTH    (AXI_USER_WIDTH), // 6,
            .AXI_ID_WIDTH      (AXI_ID_WIDTH), // 10,
            .CLUSTER_ID        (i) // 0
        )
        dummy_ulpcluster_i
        (
           .clk_i          (  clk             ),
           .rst_ni         (  rst_n           ),

           .cluster_id_i   (  i               ),

           .fetch_en_i     (  fetch_en_i[i]   ),

           .eoc_o          (  eoc_o[i]        ),

           .data_slave     (  data_slave[i]   ),

           .instr_master   (  instr_master[i] ),

           .data_master    (  data_master[i]  )
        );
    end
    endgenerate







    axi_mem_if_wrap
    #(
        .AXI_ADDRESS_WIDTH(AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH(AXI_DATA_WIDTH),
        .AXI_ID_WIDTH(AXI_ID_WIDTH),
        .AXI_USER_WIDTH(AXI_USER_WIDTH),
        .MEM_ADDR_WIDTH(16),
        .BUFF_DEPTH_SLAVE(4)
    )
    L2_mem_if_i
    (
        .clk_i(clk),
        .rst_ni(rst_n),

        .axi_slave(data_master_L2_MEM),

        .mem_master(l2_mem_bus)
    );


    sram_1p_sr_sw
    #(
        .ADDR_WIDTH ( 16               ),
        .DATA_WIDTH ( AXI_DATA_WIDTH   ),
        .BE_WIDTH   ( AXI_DATA_WIDTH/8 )
    )
    L2_MEM_MODEL
    (
        .clk     (clk ),
        .rst_n   (rst_n),

        .CEN     (l2_mem_bus.csn),
        .A       (l2_mem_bus.add),
        .WEN     (l2_mem_bus.wen),
        .D       (l2_mem_bus.wdata),
        .BEN     (l2_mem_bus.ben),

        .Q       (l2_mem_bus.rdata)
    );



endmodule
