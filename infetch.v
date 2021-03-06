module infetch(
                //Input
                clk, rst, jumprsel, brjsel, halt, imm, register,
                //Output
                err, pc2, instr
                );
  
  input clk, rst, jumprsel, brjsel, halt;
  input [15:0] imm, register;
  
  output err;
  output [15:0] pc2, instr;
  
  wire [15:0] currPC, nextPC, pcToMod, modPC;
  
  //PC Register
  reg16b pc(
                //Input
                .writeData(nextPC), .writeEn(~halt), .clk(clk), .rst(rst),
                //Output
                .readData(currPC)
                );
  //Instruction Memory
  memory2c imem(
                //Input
                .data_in(16'hBADD), .addr(currPC), .enable(1'b1), .wr(1'b0), .createdump(1'b0), .clk(clk), .rst(rst),
                //Output
                .data_out(instr)
                );
  //16 Bit Full Adder
  claAdder adder(
                //Input
                .A(imm), .B(pcToMod), .Cin(1'b0),
                //Outputs
                .Sum(modPC), .G(), .P(), .Cout(), .Cprev());
  //+2 Incrememtor
  inc_2 incrementor(
                //Input
                .A(currPC),
                //Output
                .sum(nextPC)
                );
  //PC+2/Reg Mux
  sixteenmux2_1 jumpr(
                //Input
                .InA(pc2), .InB(register), .Op(jumprsel), 
                //Output
                .Out(pcToMod)
                );
  //Branch/Jump Mux
  sixteenmux2_1 brj(
                //Input
                .InA(pc2), .InB(modPC), .Op(brjsel), 
                //Output
                .Out(nextPC)
                );
//TEMPORARY ASSIGN
//later will be overflow on 16bFA
assign err = 1'b0;
endmodule
