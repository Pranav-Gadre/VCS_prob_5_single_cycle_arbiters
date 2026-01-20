module single_cycle_arbiter #(
  parameter N = 32
) (
  input   wire          clk,
  input   wire          reset,
  input   wire [N-1:0]  req_i,
  output  wire [N-1:0]  gnt_o
);

  // Write your logic here...
  integer i, j;
  reg [N-1:0] res;
  
  assign gnt_o = (reset) ? 'd0 : res;
  
  always @ (*) begin 
    for (i = N-1; i >= 0; i = i-1) begin 
      res[i] = req_i[i];
      if (i >= 1) begin 
        for (j = i-1; j >= 0; j = j-1) begin 
          res[i] = res[i] & (~req_i[j]);
        end 
      end 
    end 
  end 

endmodule

