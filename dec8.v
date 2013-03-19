module dec8(sel, s7, s6, s5, s4, s3, s2, s1, s0, en);
  
  input [2:0] sel;
  input en;
  
  output wire s7, s6, s5, s4, s3, s2, s1, s0;
  
  assign s7 = ((sel == 3'b111) & en);
  assign s6 = ((sel == 3'b110) & en);
  assign s5 = ((sel == 3'b101) & en);
  assign s4 = ((sel == 3'b100) & en);
  assign s3 = ((sel == 3'b011) & en);
  assign s2 = ((sel == 3'b010) & en);
  assign s1 = ((sel == 3'b001) & en);
  assign s0 = ((sel == 3'b000) & en);
  
  
endmodule

