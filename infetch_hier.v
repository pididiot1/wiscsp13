/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
//`timescale 1ns/1ns

module infetch_hier();
   
   initial begin
     #10000 $stop;
   end
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 clk;                    // From c0 of clkrst.v
   wire                 err;                    // From p0 of proc.v
   wire                 rst;                    // From c0 of clkrst.v
   // End of automatics
   clkrst c1(/*AUTOINST*/
             // Outputs
             .clk                       (clk),
             .rst                       (rst),
             // Inputs
             .err                       (err));
   
    infetch fetchDUT(
                //Input
                .clk(clk), .rst(rst), .jumprsel(1'b0), .brjsel(1'b0), .halt(1'b0),
                .imm(16'b0), .register(16'b0),
                //Output
                .err(), .pc2(), .instr()
                );                         
   

endmodule

// DUMMY LINE FOR REV CONTROL :0:


