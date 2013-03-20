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
   
   //Error signals
   wire ferr, derr;
   
   ////////////////
   //Fetch Outputs
   ////////////////
   wire [15:0] pc2, instr;
   
   ////////////////
   //Decode Outputs
   ////////////////
   //Fetch Control
   wire pcregsel, brj, halt;
   wire [15:0] fimm, register;
   //Execute Control
   wire sub, seq, slt, sle, sco;
   wire [3:0] aluctl;
   wire [15:0] src1, src2;
   //Memory Control
   wire enable, wr, createdump;
   wire [15:0] data_in;
   //Writeback Control
   wire memalusel;
   
   /////////////////
   //Execute Outputs
   /////////////////
   wire [15:0] exout;
   
   //////////////////
   //Memfetch Outputs
   //////////////////
   wire [15:0] memout;
   
   ///////////////////
   //Writeback Outputs
   ///////////////////
   wire [15:0] wbout;
   
   infetch fetch0(
                //Input
                .clk(clk), .rst(rst), .jumprsel(pcregsel), .brjsel(brj), .halt(halt),
                .imm(fimm), .register(register),
                //Output
                .err(ferr), .pc2(pc2), .instr(instr)
                );
   id decode0(
              //Input
              .clk(clk), .rst(rst), .instr(instr), .pc2(pc2), .write_data(wbout),
              //Output
              .error(derr),
              //Fetch Control
              .pcregsel(pcregsel), .brj(brj), .halt(halt), .fimm(fimm), .register(register),
              //Execute Control
              .sub(sub), .src1(src1), .src2(src2), .aluctl(aluctl),
              .seq(seq), .slt(slt), .sle(sle), .sco(sco),
              //Memory Control
              .enable(enable), .wr(wr), .createdump(createdump), .data_in(data_in),
              //Writeback Control
              .memalusel(memalusel)
              );
   ex execute(
              //Inputs
              .A(src1), .B(src2), .aluOp(aluctl), .Cin(sub),
              .setEq(seq), .setLt(slt), .setLe(sle), .setCo(sco),
              //Outputs
              .Out(exout)
              );
   mem memory0(
              //Inputs
              .clk(clk), .rst(rst), .data_in(data_in), .addr(exout),
              .enable(enable), .wr(wr), .createdump(createdump),
              //Outputs
              .data_out(memout)
              );
   wb writeback(
              //Inputs
              .memalusel(memalusel), .memin(memout), .aluin(exout),
              //Outputs
              .out(wbout)
              );
   assign err = ferr | derr;
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0: