////////////////////////////////////////////////
// Extender module extends the immediate field
// the input, instr.
// 
// select 00 = 5 bit
//        01 = 8 bit
//        10 = 11 bit
//
// op     0 = zext
//        1 = sext
////////////////////////////////////////////////
module ext(
            //Input
            instr, select, op, 
            //Output
            imm, err
            );
  
  input op;
  input [1:0] select;
  input [10:0] instr;
  
  output err;
  output [15:0] imm;
  
  wire [15:0] zext5, sext5, imm5, zext8, sext8, imm8, zext11, sext11, imm11;
  
  sixteenmux4_1 extmux(.InA(imm5), .InB(imm8), .InC(imm11), .InD(16'hBADD), .Op(select), .Out(imm));
  
  
  //5 bit extends
  assign zext5 = {{11{1'b0}}, instr[4:0]};
  assign sext5 = {{11{instr[4]}}, instr[4:0]};
  assign imm5 = op ? sext5 : zext5;
  
  //8 bit extends
  assign zext8 = {{8{1'b0}}, instr[7:0]};
  assign sext8 = {{8{instr[7]}}, instr[7:0]};
  assign imm8 = op ? sext8 : zext8;
  
  //11 bit extends
  assign zext11 = {{5{1'b0}}, instr[10:0]};
  assign sext11 = {{5{instr[10]}}, instr[10:0]};
  assign imm11 = op ? sext11 : zext11;
  
  //Assign err
  assign err = (imm == 16'hBADD);
  
endmodule