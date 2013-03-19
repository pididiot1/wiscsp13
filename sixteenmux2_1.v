module sixteenmux2_1(InA, InB, Op, Out);
  
  input [15:0] InA, InB;
  input Op;
  
  output wire [15:0] Out;
  
  //Bit 15
  mux2_1 bit15(.InA(InA[15]), .InB(InB[15]), .S(Op), .Out(Out[15]));
  
  //Bit 14
  mux2_1 bit14(.InA(InA[14]), .InB(InB[14]), .S(Op), .Out(Out[14]));
  
  //Bit 13
  mux2_1 bit13(.InA(InA[13]), .InB(InB[13]), .S(Op), .Out(Out[13]));
  
  //Bit 12
  mux2_1 bit12(.InA(InA[12]), .InB(InB[12]), .S(Op), .Out(Out[12]));
  
  //Bit 11
  mux2_1 bit11(.InA(InA[11]), .InB(InB[11]), .S(Op), .Out(Out[11]));
  
  //Bit 10
  mux2_1 bit10(.InA(InA[10]), .InB(InB[10]), .S(Op), .Out(Out[10]));
  
  //Bit 9
  mux2_1 bit9(.InA(InA[9]), .InB(InB[9]), .S(Op), .Out(Out[9]));
  
  //Bit 8
  mux2_1 bit8(.InA(InA[8]), .InB(InB[8]), .S(Op), .Out(Out[8]));
  
  //Bit 7
  mux2_1 bit7(.InA(InA[7]), .InB(InB[7]), .S(Op), .Out(Out[7]));
  
  //Bit 6
  mux2_1 bit6(.InA(InA[6]), .InB(InB[6]), .S(Op), .Out(Out[6]));
  
  //Bit 5
  mux2_1 bit5(.InA(InA[5]), .InB(InB[5]), .S(Op), .Out(Out[5]));
  
  //Bit 4
  mux2_1 bit4(.InA(InA[4]), .InB(InB[4]), .S(Op), .Out(Out[4]));
  
  //Bit 3
  mux2_1 bit3(.InA(InA[3]), .InB(InB[3]), .S(Op), .Out(Out[3]));
  
  //Bit 2
  mux2_1 bit2(.InA(InA[2]), .InB(InB[2]), .S(Op), .Out(Out[2]));
  
  //Bit 1
  mux2_1 bit1(.InA(InA[1]), .InB(InB[1]), .S(Op), .Out(Out[1]));
  
  //Bit 0
  mux2_1 bit0(.InA(InA[0]), .InB(InB[0]), .S(Op), .Out(Out[0]));
  
endmodule






