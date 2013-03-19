module sixteenmux4_1(InA, InB, InC, InD, Op, Out);
  
  input [15:0] InA, InB, InC, InD;
  input [1:0] Op;
  
  output wire [15:0] Out;
  
  //Bit 15
  mux4_1 bit15(.InA(InA[15]), .InB(InB[15]), .InC(InC[15]), .InD(InD[15]), .S(Op), .Out(Out[15]));
  
  //Bit 14
  mux4_1 bit14(.InA(InA[14]), .InB(InB[14]), .InC(InC[14]), .InD(InD[14]), .S(Op), .Out(Out[14]));
  
  //Bit 13
  mux4_1 bit13(.InA(InA[13]), .InB(InB[13]), .InC(InC[13]), .InD(InD[13]), .S(Op), .Out(Out[13]));
  
  //Bit 12
  mux4_1 bit12(.InA(InA[12]), .InB(InB[12]), .InC(InC[12]), .InD(InD[12]), .S(Op), .Out(Out[12]));
  
  //Bit 11
  mux4_1 bit11(.InA(InA[11]), .InB(InB[11]), .InC(InC[11]), .InD(InD[11]), .S(Op), .Out(Out[11]));
  
  //Bit 10
  mux4_1 bit10(.InA(InA[10]), .InB(InB[10]), .InC(InC[10]), .InD(InD[10]), .S(Op), .Out(Out[10]));
  
  //Bit 9
  mux4_1 bit9(.InA(InA[9]), .InB(InB[9]), .InC(InC[9]), .InD(InD[9]), .S(Op), .Out(Out[9]));
  
  //Bit 8
  mux4_1 bit8(.InA(InA[8]), .InB(InB[8]), .InC(InC[8]), .InD(InD[8]), .S(Op), .Out(Out[8]));
  
  //Bit 7
  mux4_1 bit7(.InA(InA[7]), .InB(InB[7]), .InC(InC[7]), .InD(InD[7]), .S(Op), .Out(Out[7]));
  
  //Bit 6
  mux4_1 bit6(.InA(InA[6]), .InB(InB[6]), .InC(InC[6]), .InD(InD[6]), .S(Op), .Out(Out[6]));
  
  //Bit 5
  mux4_1 bit5(.InA(InA[5]), .InB(InB[5]), .InC(InC[5]), .InD(InD[5]), .S(Op), .Out(Out[5]));
  
  //Bit 4
  mux4_1 bit4(.InA(InA[4]), .InB(InB[4]), .InC(InC[4]), .InD(InD[4]), .S(Op), .Out(Out[4]));
  
  //Bit 3
  mux4_1 bit3(.InA(InA[3]), .InB(InB[3]), .InC(InC[3]), .InD(InD[3]), .S(Op), .Out(Out[3]));
  
  //Bit 2
  mux4_1 bit2(.InA(InA[2]), .InB(InB[2]), .InC(InC[2]), .InD(InD[2]), .S(Op), .Out(Out[2]));
  
  //Bit 1
  mux4_1 bit1(.InA(InA[1]), .InB(InB[1]), .InC(InC[1]), .InD(InD[1]), .S(Op), .Out(Out[1]));
  
  //Bit 0
  mux4_1 bit0(.InA(InA[0]), .InB(InB[0]), .InC(InC[0]), .InD(InD[0]), .S(Op), .Out(Out[0]));
  
endmodule




