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
    always @ (*) begin 
      for (i = 0; i <= N-1; i=i+1) begin 
        if (req_i[i]) begin 
        // Left shift by (N-i) and then check if all bits are zero,
        // by using reduction NOR operator.
          dout[i] = (~|(req_i << (N-i))) ? 1 : 0;
        end else begin
          dout[i] = req_i[i];
        end
      end 
    end 
  endgenerate

endmodule

