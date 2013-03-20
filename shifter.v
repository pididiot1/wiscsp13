module shifter (In, Cnt, Op, Out);
   
   input [15:0] In;
   input [3:0]  Cnt;
   input [1:0]  Op;
   output [15:0] Out;
   
   wire [15:0] rotl, sl, rr, rgtl;
   
   rotate_left rotL(.In(In), .Cnt(Cnt), .Out(rotl));
   
   shift_left shiftL(.In(In), .Cnt(Cnt), .Out(sl));
   
   right_rotate rightA(.In(In), .Cnt(Cnt), .Out(rr));
   
   right_logical rightL(.In(In), .Cnt(Cnt), .Out(rgtl));
   
   sixteenmux4_1 mux(.InA(rotl), .InB(sl), .InC(rr), .InD(rgtl), .Op(Op), .Out(Out));
   
   
endmodule

