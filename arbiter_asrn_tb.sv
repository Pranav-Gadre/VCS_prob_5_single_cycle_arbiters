module arbiter_asrn_tb();
    localparam N = 16,
               O = 160;
    
    reg clk,
        reset;
    
    reg  [N-1:0] req_i;
    wire [N-1:0] gnt_o;
    
    
    
    single_cycle_arbiter #(
        .N(N)
        )SINGLE_CYCLE_ARBITER(
        .clk      (    clk     ),  
        .reset    (    reset   ),  
        .req_i    (    req_i   ),  
        .gnt_o    (    gnt_o   )  
    );

endmodule