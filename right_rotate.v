module right_rotate(In, Cnt, Out);
  
  input [15:0] In;
  input [3:0] Cnt;
  
  output [15:0] Out;
  
  wire [15:0] r1, r2, r4, r5;
  
  right_rotate1 right1(.In(In), .Cnt(Cnt[0]), .Out(r1));
  
  right_rotate2 right2(.In(r1), .Cnt(Cnt[1]), .Out(r2));
  
  right_rotate4 right4(.In(r2), .Cnt(Cnt[2]), .Out(r4));
  
  right_rotate8 right8(.In(r4), .Cnt(Cnt[3]), .Out(Out));
  
endmodule


