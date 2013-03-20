module inc_2_bench();
  
  reg [15:0] A;
  
  wire [15:0] sum;
  
  inc_2 inc_2DUT(
              //Input
              .A(A),              
              //Output
              .sum(sum)
              );
              
              
  initial begin
    A = 15'b0;
    #20 $stop;
  end
  
  always #2 A = A + 2;
  
endmodule
