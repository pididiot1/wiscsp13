module rotate_left(In, Cnt, Out);
  
  input [15:0] In;
  input [3:0] Cnt;
  
  output [15:0] Out;
  
  wire [15:0] r1, r2, r4, r5;
  
  rotate_left1 left1(.In(In), .Cnt(Cnt[0]), .Out(r1));
  
  rotate_left2 left2(.In(r1), .Cnt(Cnt[1]), .Out(r2));
  
  rotate_left4 left4(.In(r2), .Cnt(Cnt[2]), .Out(r4));
  
  rotate_left8 left8(.In(r4), .Cnt(Cnt[3]), .Out(Out));
  
endmodule
