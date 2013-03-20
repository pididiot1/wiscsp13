//Zero Extension
module right_logical8(In, Cnt, Out);
  
  input [15:0] In;
  input Cnt;
  
  output wire [15:0] Out;
  
  //Bit 15
  mux2_1 bit15(.InA(In[15]), .InB(1'b0), .S(Cnt), .Out(Out[15]));
  
  //Bit 14
  mux2_1 bit14(.InA(In[14]), .InB(1'b0), .S(Cnt), .Out(Out[14]));
  
  //Bit 13
  mux2_1 bit13(.InA(In[13]), .InB(1'b0), .S(Cnt), .Out(Out[13]));
  
  //Bit 12
  mux2_1 bit12(.InA(In[12]), .InB(1'b0), .S(Cnt), .Out(Out[12]));
  
  //Bit 11
  mux2_1 bit11(.InA(In[11]), .InB(1'b0), .S(Cnt), .Out(Out[11]));
  
  //Bit 10
  mux2_1 bit10(.InA(In[10]), .InB(1'b0), .S(Cnt), .Out(Out[10]));
  
  //Bit 9
  mux2_1 bit9(.InA(In[9]), .InB(1'b0), .S(Cnt), .Out(Out[9]));
  
  //Bit 8
  mux2_1 bit8(.InA(In[8]), .InB(1'b0), .S(Cnt), .Out(Out[8]));
  
  //Bit 7
  mux2_1 bit7(.InA(In[7]), .InB(In[15]), .S(Cnt), .Out(Out[7]));
  
  //Bit 6
  mux2_1 bit6(.InA(In[6]), .InB(In[14]), .S(Cnt), .Out(Out[6]));
  
  //Bit 5
  mux2_1 bit5(.InA(In[5]), .InB(In[13]), .S(Cnt), .Out(Out[5]));
  
  //Bit 4
  mux2_1 bit4(.InA(In[4]), .InB(In[12]), .S(Cnt), .Out(Out[4]));
  
  //Bit 3
  mux2_1 bit3(.InA(In[3]), .InB(In[11]), .S(Cnt), .Out(Out[3]));
  
  //Bit 2
  mux2_1 bit2(.InA(In[2]), .InB(In[10]), .S(Cnt), .Out(Out[2]));
  
  //Bit 1
  mux2_1 bit1(.InA(In[1]), .InB(In[9]), .S(Cnt), .Out(Out[1]));
  
  //Bit 0
  mux2_1 bit0(.InA(In[0]), .InB(In[8]), .S(Cnt), .Out(Out[0]));
  
endmodule








