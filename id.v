module id(clk, rst);
  
  input clk, rst;
  
  rf_bypass rf(
           // Outputs
           read1data, read2data, err,
           // Inputs
           .clk(clk), .rst(rst), read1regsel, read2regsel, writeregsel, writedata, write
           );
  
endmodule