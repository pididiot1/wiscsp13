module flags(
            //Input
            in,
            //Output
            zero, notzero, neg, posz
            );
  
  input [15:0] in;
  
  output zero, notzero, neg, posz;
  
  assign zero = ~notzero;
  assign notzero = |in;
  assign neg = in[15];
  assign posz = ~neg;
  
endmodule