/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf_bypass (
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

   wire [15:0] read1Idata, read2Idata;
   // your code
   
   rf register(
           // Outputs
           .read1data(read1Idata), .read2data(read2Idata), .err(err),
           // Inputs
           .clk(clk), .rst(rst), .read1regsel(read1regsel), .read2regsel(read2regsel),
           .writeregsel(writeregsel), .writedata(writedata), .write(write)
           );
           
   assign read1data = ((writeregsel == read1regsel) & write) ? writedata : read1Idata;
   assign read2data = ((writeregsel == read2regsel) & write) ? writedata : read2Idata;

endmodule
// DUMMY LINE FOR REV CONTROL :1:
