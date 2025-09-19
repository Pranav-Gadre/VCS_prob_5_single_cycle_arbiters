module single_cycle_arbiter #(
    parameter N = 32
    ) (
    input   wire          clk,
    input   wire          reset,
    input   wire [N-1:0]  req_i,
    output  wire [N-1:0]  gnt_o
);

    // Write your logic here...
    integer i;
    reg [N-1:0] dout;
    
    assign gnt_o = dout;
    
    generate 
        if (N == 1) begin : generate_block_1
            always_latch begin 
                if (reset) begin 
                    dout   = 0;
                end else if (clk) begin 
                    dout   = req_i;
                end else begin 
                    dout   = dout;
                end 
            end 
        end else begin : generate_block_2
            always_latch begin 
                if (reset) begin 
                    dout   = 0;
                end else if (clk) begin 
                    dout  = 0;
                    for (i = 0; i <= N-1; i=i+1) begin 
                        if (req_i[i] == 1'b1) begin 
                            dout[i] = 1'b1;
                            break;
                        end 
                    end 
                end else begin 
                    dout   = dout;
                end
            end 
        end
    endgenerate
    

endmodule

