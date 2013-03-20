module ex(
          //Inputs
          A, B, aluOp, Cin, setEq, setLt, setLe, setCo,
          //Outputs
          Out
          );
  
  //Add output
  
    input  [15:0] A, B;
    input   [3:0] aluOp;
    input         Cin, setEq, setLt,setLe, setCo;
    
    output [15:0] Out;
    
    wire [15:0] aluOut;
    wire Ofl, zero, neg, pos, Cout, set; //?
    
      alu a0(
          // Outputs
          .Out                          (aluOut[15:0]),
          .Ofl                          (Ofl),
          // Inputs
          .A                            (A[15:0]),
          .B                            (B[15:0]),
          .Cin                          (Cin),
          .Op                           (aluOp[3:0]),
          .Cout                         (Cout)
         );
         
      flags f0(
            //Input
            .in                          (aluOut[15:0]),
            //Output
            .zero                        (zero),
            .neg                         (neg),
            .pos                         (pos)
            );
      
      assign set = setEq | setLt | setLe | setCo;
      assign eq = setEq & zero;
      assign lt = setLt & pos;
      assign le = setLe & (zero | pos);      
      assign co = setCo & Cout;
      
      assign setOut = {15'b000000000000000, (eq | lt | le | co)};
      assign Out = set ? setOut : aluOut;

endmodule