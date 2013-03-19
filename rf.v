/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
   input clk, rst;
   input [2:0] read1regsel;
   input [2:0] read2regsel;
   input [2:0] writeregsel;
   input [15:0] writedata;
   input        write;

   output [15:0] read1data;
   output [15:0] read2data;
   output        err;


   wire [15:0] reg7, reg6, reg5, reg4, reg3, reg2, reg1, reg0;
   wire w7, w6, w5, w4, w3, w2, w1, w0;
   
   //Write Select Decoder
   dec8 writeDecoder(.sel(writeregsel), .s7(w7), .s6(w6), .s5(w5), .s4(w4), .s3(w3), .s2(w2), .s1(w1), .s0(w0), .en(write));
   
   //Read 1 Mux
   sixteenmux8_1 read1(.In0(reg0), .In1(reg1), .In2(reg2), .In3(reg3), .In4(reg4),
                       .In5(reg5), .In6(reg6), .In7(reg7), .sel(read1regsel), .out(read1data));
   //Read 2 Mux
   sixteenmux8_1 read2(.In0(reg0), .In1(reg1), .In2(reg2), .In3(reg3), .In4(reg4),
                       .In5(reg5), .In6(reg6), .In7(reg7), .sel(read2regsel), .out(read2data));
   
   //Instantiating 8 registers
   reg16b register7(.writeData(writedata), .readData(reg7), .writeEn(w7), .clk(clk), .rst(rst));
   reg16b register6(.writeData(writedata), .readData(reg6), .writeEn(w6), .clk(clk), .rst(rst));
   reg16b register5(.writeData(writedata), .readData(reg5), .writeEn(w5), .clk(clk), .rst(rst));
   reg16b register4(.writeData(writedata), .readData(reg4), .writeEn(w4), .clk(clk), .rst(rst));
   reg16b register3(.writeData(writedata), .readData(reg3), .writeEn(w3), .clk(clk), .rst(rst));
   reg16b register2(.writeData(writedata), .readData(reg2), .writeEn(w2), .clk(clk), .rst(rst));
   reg16b register1(.writeData(writedata), .readData(reg1), .writeEn(w1), .clk(clk), .rst(rst));
   reg16b register0(.writeData(writedata), .readData(reg0), .writeEn(w0), .clk(clk), .rst(rst));
   
   

endmodule
// DUMMY LINE FOR REV CONTROL :1:


