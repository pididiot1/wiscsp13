module mux2_1 (InA, InB, S, Out);
  
  input InA, InB, S;
  output wire Out;
  
  wire S_n, BS, AS_n;
  
  assign S_n = ~S;
  assign AS_n = ~(InA & S_n);
  assign BS = ~(InB & S);
  assign Out = ~(AS_n & BS); 
  
  
endmodule





