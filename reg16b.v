module reg16b(writeData, readData, writeEn, clk, rst);
  
  input[15:0] writeData;
  input writeEn, clk, rst;
  
  output [15:0] readData;
  
  wire [15:0] data;
  
  //Internal data register
  dff bit15(.q(data[15]), .d(bit15d), .clk(clk), .rst(rst));
  dff bit14(.q(data[14]), .d(bit14d), .clk(clk), .rst(rst));
  dff bit13(.q(data[13]), .d(bit13d), .clk(clk), .rst(rst));
  dff bit12(.q(data[12]), .d(bit12d), .clk(clk), .rst(rst));
  dff bit11(.q(data[11]), .d(bit11d), .clk(clk), .rst(rst));
  dff bit10(.q(data[10]), .d(bit10d), .clk(clk), .rst(rst));
  dff bit9(.q(data[9]), .d(bit9d), .clk(clk), .rst(rst));
  dff bit8(.q(data[8]), .d(bit8d), .clk(clk), .rst(rst));
  dff bit7(.q(data[7]), .d(bit7d), .clk(clk), .rst(rst));
  dff bit6(.q(data[6]), .d(bit6d), .clk(clk), .rst(rst));
  dff bit5(.q(data[5]), .d(bit5d), .clk(clk), .rst(rst));
  dff bit4(.q(data[4]), .d(bit4d), .clk(clk), .rst(rst));
  dff bit3(.q(data[3]), .d(bit3d), .clk(clk), .rst(rst));
  dff bit2(.q(data[2]), .d(bit2d), .clk(clk), .rst(rst));
  dff bit1(.q(data[1]), .d(bit1d), .clk(clk), .rst(rst));
  dff bit0(.q(data[0]), .d(bit0d), .clk(clk), .rst(rst));
  
  
  
  //Factor writeEn in bit q input
  assign bit15d = writeEn ? writeData[15] : data[15];
  assign bit14d = writeEn ? writeData[14] : data[14];
  assign bit13d = writeEn ? writeData[13] : data[13];
  assign bit12d = writeEn ? writeData[12] : data[12];
  assign bit11d = writeEn ? writeData[11] : data[11];
  assign bit10d = writeEn ? writeData[10] : data[10];
  assign bit9d = writeEn ? writeData[9] : data[9];
  assign bit8d = writeEn ? writeData[8] : data[8];
  assign bit7d = writeEn ? writeData[7] : data[7];
  assign bit6d = writeEn ? writeData[6] : data[6];
  assign bit5d = writeEn ? writeData[5] : data[5];
  assign bit4d = writeEn ? writeData[4] : data[4];
  assign bit3d = writeEn ? writeData[3] : data[3];
  assign bit2d = writeEn ? writeData[2] : data[2];
  assign bit1d = writeEn ? writeData[1] : data[1];
  assign bit0d = writeEn ? writeData[0] : data[0];
  
  //If readEn is high, write out the data
  assign readData = data;
  
  
  
endmodule



