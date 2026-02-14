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
  
  function automatic [N-1:0] recu_arbit;
    input [N-1:0] i_num;
    input integer index; 
    begin 
      if (index == 0) begin 
        recu_arbit = ~i_num[index];
      end else begin 
        recu_arbit = ~i_num[index] & recu_arbit(i_num, index-1);
      end 
    end 
  endfunction
  
  always @ (*) begin 
    for (i = N-1; i >= 0; i = i-1) begin 
      res[i] = req_i[i];
      // stitching the above statement with the help of loop for each bit of output.
      
      if (i >= 1) begin 
        res[i] = res[i] & recu_arbit(req_i, i-1);
      
      //for (j = i-1; j >= 0; j = j-1) begin 
      //  res[i] = res[i] & (~req_i[j]);
      //end 
      end 
    end 
  end 

endmodule

