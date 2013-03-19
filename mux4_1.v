module mux4_1(InA, InB, InC, InD, S, Out);
  
  input InA, InB, InC, InD;
  input [1:0] S;
  output wire Out;
  
  wire AB, CD;
  
  mux2_1 h0Mux(.InA(InC), .InB(InD), .S(S[0]), .Out(AB));
  mux2_1 l0Mux(.InA(InA), .InB(InB), .S(S[0]), .Out(CD));
  mux2_1 o0Mux(.InA(CD), .InB(AB), .S(S[1]), .Out(Out));
  
endmodule




