module id(
          //Input
          clk, rst, instr, pc2, write_data,
          //Output
          error,
          //Fetch Control
          pcregsel, brj, halt, fimm, register,
          //Datapath Control
          sub, src1, src2, aluctl, seq, slt, sle, sco,
          //Memory Control
          enable, wr, createdump, data_in,
          //Writeback Control
          memalusel
          );
          
  //////////////
  //INPUT/OUTPUT
  //////////////
  
  //proc inputs
  input clk, rst;
  //infetch inputs
  input [15:0] instr, pc2;
  //wb inputs
  input [15:0] write_data;
  
  //proc outputs
  output error;
  //infetch outputs
  output pcregsel, brj, halt;
  output [15:0] fimm, register;
  //ex outputs
  output sub, seq, slt, sle, sco;
  output [3:0] aluctl;
  output [15:0] src1, src2;  
  //mem outputs
  output enable, wr, createdump;
  output [15:0] data_in;
  //wb outputs
  output memalusel;
  
  ////////////////
  //INTERNAL WIRES
  ////////////////
  
  //Decoder -> Register File
  wire rfwr;
  wire [2:0] rsAddr, rtAddr, rdAddr;  
  //Decoder -> Extender
  wire op;
  wire [1:0] immsel;
  //Decoder -> Reg/Imm Mux
  wire immregsel, src1sel;
  //Decoder -> Src2 Inv
  wire src2inv;
  //Decoder -> Branch/Jump
  wire beqz, bnez, bltz, bgez, j, jr, jal, jalr;
  //Register File -> Reg/Imm Mux
  wire [15:0] rt;
  //Register File -> Inverter
  wire [15:0] rs;
  //Register File -> Error
  wire rfErr;
  //Extender -> Reg/Imm Mux
  wire [15:0] imm;
  //Extender -> Error
  wire extErr;
  //Reg/Imm Mux -> Inv
  wire [15:0] src1i, src2i;
  //Write data mux
  wire writedatasel;
  wire [15:0] rfwrite_data;
  //Flags -> Branch/Jump
  wire zero, notzero, neg, posz;
  
  idecoder instructiondecoder(
            //Input
            .instr(instr),
            //Output
            //id reg controls
            .rfwr(rfwr), .rsAddr(rsAddr), .rtAddr(rtAddr), .rdAddr(rdAddr),
            //id ext controls
            .op(op), .immsel(immsel),
            //id reg/imm controls
            .immregsel(immregsel), .src1sel(src1sel),
            //id inv controls
            .src2inv(src2inv),
            //id br/jmp controls
            .beqz(beqz), .bnez(bnez), .bltz(bltz), .bgez(bgez),
            //infetch controls
            .j(j), .jr(jr), .jal(jal), .jalr(jalr), .halt(halt),
            //ex controls
            .sub(sub), .aluctl(aluctl), .seq(seq), .slt(slt), .sle(sle), .sco(sco),
            //mem controls
            .enable(enable), .wr(wr), .createdump(createdump),
            //wboutputs
            .memalusel(memalusel)
            );
  rf_bypass rf(
           // Outputs
           .read1data(rs), .read2data(rt), .err(rfErr),
           // Inputs
           .clk(clk), .rst(rst), .read1regsel(rsAddr), .read2regsel(rtAddr), 
           .writeregsel(rdAddr), .writedata(rfwrite_data), .write(rfwr)
           );
  ext extender(
            //Input
            .instr(instr[10:0]), .select(immsel), .op(op),
            //Output
            .imm(imm), .err(extErr)
            );
  sixteenmux2_1 regimm(
            //Input
            .InA(rt), .InB(imm), .Op(immregsel), 
            //Output
            .Out(src2i)
            );
  sixteenmux2_1 zerosel(
            //Input
            .InA(rs), .InB(16'b0), .Op(src1sel), 
            //Output
            .Out(src1i)
            );
  sixteenmux2_1 writedatamux(
            //Input
            .InA(write_data), .InB(pc2), .Op(writedatasel), 
            //Output
            .Out(rfwrite_data)
            );
  brjlogic branching(
            //Input
            .beqz(beqz), .bnez(bnez), .bltz(bltz), .bgez(bgez),
            .j(j), .jr(jr), .jal(jal), .jalr(jalr),
            .rs(rs),
            //Output
            .writedatasel(writedatasel), .jumprsel(pcregsel), .brjsel(brj)
            );
            
  assign data_in = rt;
  
  //Invert outputs if necessary
  assign src1 = sub ? ~src1i : src1i;
  assign src2 = src2inv ? ~src2i : src2i;
  assign fimm = imm;
  assign data_in = rt;
endmodule