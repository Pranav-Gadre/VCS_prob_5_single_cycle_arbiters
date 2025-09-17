module single_cycle_arbiter_tb();
    localparam N = 16,
               O = 160;
    
    reg clk,
        reset;
    
    reg  [N-1:0] req_i;
    wire [N-1:0] gnt_o;
    
    initial begin 
        clk = 0;
    end 
    
    always #5 clk = ~clk;
    
    initial begin 
        reset <= 0;
        #N;
        reset <= 1;
        #O;
        reset <= 0;
    end 
    
    task apply_input(
        input [N-1:0] number
        );
    begin 
        req_i <= number;
        @(posedge clk);
    end 
    endtask
    
    initial begin 
        req_i <= 0;
        #O;
        wait(!reset);
        repeat (10) begin 
            apply_input($random);
        end 
    end 
    
    single_cycle_arbiter #(
        .N(N)
        )SINGLE_CYCLE_ARBITER(
        .clk      (    clk     ),  
        .reset    (    reset   ),  
        .req_i    (    req_i   ),  
        .gnt_o    (    gnt_o   )  
    );

endmodule