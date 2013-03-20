module wb(
          //Inputs
          memalusel, memin, aluin,
          //Outputs
          out
          );
          
  input memalusel;
  input [15:0] memin, aluin;
  
  output [15:0] out;
  
  sixteenmux2_1 writebackmux(
            //Input
            .InA(aluin), .InB(memin), .Op(memalusel), 
            //Output
            .Out(out)
            );
  
endmodule