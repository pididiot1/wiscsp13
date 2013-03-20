/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   
   /* your code here */
   
   wire ferr, derr;
   
   infetch fetch(
                //Input
                .clk(clk), .rst(rst), jumprsel, brjsel, halt, imm, register,
                //Output
                .err(ferr), pc2, instr
                );
   id decode(
              //Input
              .clk(clk), .rst(rst), instr, pc2, write_data,
              //Output
              .error(derr),
              //Fetch Control
              pcregsel, brj, halt, fimm, register,
              //Datapath Control
              sub, src1, src2, aluctl, seq, slt, sle, sco,
              //Memory Control
              enable, wr, createdump, data_in,
              //Writeback Control
              memalusel
              );
   ex execute(
              //Inputs
              A, B, aluOp, Cin, setEq, setLt, setLe, setCo,
              //Outputs
              Out
              );
   mem memfetch(
              //Inputs
              .clk(clk), .rst(rst), data_in, addr, enable, wr, createdump,
              //Outputs
              data_out
              );
   wb writeback(
              //Inputs
              memalusel, memin, aluin,
              //Outputs
              out
              );
   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0: