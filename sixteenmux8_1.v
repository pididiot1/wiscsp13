module sixteenmux8_1(In0, In1, In2, In3, In4, In5, In6, In7, sel, out);
  
  input [15:0] In0, In1, In2, In3, In4, In5, In6, In7;
  input [2:0] sel;
  
  output [15:0] out;
  
  wire [15:0] high, low;
  
  sixteenmux4_1 upper(.InA(In4), .InB(In5), .InC(In6), .InD(In7), .Op(sel[1:0]), .Out(high));
  sixteenmux4_1 lower(.InA(In0), .InB(In1), .InC(In2), .InD(In3), .Op(sel[1:0]), .Out(low));
  
  assign out = (sel[2] ? high : low);
  
endmodule

