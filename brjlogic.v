module brjlogic(
                //Input
                beqz, bnez, bltz, bgez,
                j, jr, jal, jalr,
                rs,
                //Output
                writedatasel, jumprsel, brjsel
                );
                
  //////////////
  //INPUT/OUTPUT
  //////////////
  
  input beqz, bnez, bltz, bgez, j, jr, jal, jalr;
  input [15:0] rs;
  
  output writedatasel, jumprsel, brjsel;
  
  ////////////////
  //INTERNAL WIRES
  ////////////////
  
  wire zero, neg, pos;
  
  flags branchflags(
            //Input
            .in(rs),
            //Output
            .zero(zero), .neg(neg), .pos(pos)
            );
  
  assign brjsel = (beqz & zero) | (bnez & ~zero) | (bltz & neg) | (bgez & (zero | pos)) |
                    j | jr | jal | jalr;
  assign jumprsel = jr | jalr;
  assign writedatasel = jal | jalr;
  
endmodule