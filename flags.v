module flags(
            //Input
            in,
            //Output
            zero, neg, pos
            );
  
  input [15:0] in;
  
  output zero, neg, pos;
  
  wire notzero;
  
  assign zero = ~notzero;
  assign notzero = |in;
  assign neg = in[15];
  assign pos = ~neg & notzero;
  
endmodule