module idecoder(
                //Input
                instr,
                //Output
                //id reg controls
                rfwr, rsAddr, rtAddr, rdAddr,
                //id ext controls
                op, immsel,
                //id reg/imm controls
                immregsel,
                //id inv controls
                src2inv,
                //id br/jmp controls
                bezq, bnez, bltz, bgez,
                //ex controls
                sub, setctl, aluctl,
                //mem controls
                enable, wr, createdump,
                //wboutputs
                memalusel
                );
  parameter HALT = 5'b00000,
            NOP  = 5'b00001,
            ADDI = 5'b01000,
            SUBI = 5'b01001,
            XORI = 5'b01010,
            ANDNI = 5'b01011,
            ROLI = 5'b10100,
            SLLI = 5'b10101,
            RORI = 5'b10110,
            SRLI = 5'b10111,
            ST = 5'b10000,
            LD = 5'b10001,
            
            STU = 5'b10011,
            
            BTR = 5'b11001,
            ADD = 5'b11011,
            SUB = 5'b11011,
            XOR = 5'b11011,
            ANDN = 5'b11011,
            ROL = 5'b11010,
            SLL = 5'b11010,
            ROR = 5'b11010,
            SRL = 5'b11010,
            SEQ = 5'b11100,
            SLT = 5'b11101,
            SLE = 5'b11110,
            
            SCO = 5'b11111,
            
            BEQZ = 5'b01100,
            BNEZ = 5'b01101,
            BLTZ = 5'b01110,
            BGEZ = 5'b01111,
            
            LBI = 5'b11000,
            SLBI = 5'b10010,
            
            J = 5'b00100,
            JR = 5'b00101,
            JAL = 5'b00110,
            JALR = 5'b00111,
            
            SIIC = 5'b00010,
            RTI = 5'b00011;
  
  
  input [15:0] instr;
  
  //id reg controls
  output reg rfwr;
  output reg [2:0] rsAddr, rtAddr, rdAddr;
  //id ext controls
  output reg op;
  output reg [1:0] immsel;
  //id reg/imm controls
  output immregsel;
  //id inv controls
  output reg src2inv;
  //id br/jmp controls
  output reg bezq, bnez, bltz, bgez;
  //ex controls
  output reg sub;
  output reg [1:0] setctl;
  output reg [2:0] aluctl;
  //mem controls
  output reg enable, wr, createdump;
  //wboutputs
  output reg memalusel;
  
  //Controlling logic
  always@(*) begin
    //Set default values to avoid additional flops
    rfwr = 0; rsAddr = 3'b0; rtAddr = 3'b0; rdAddr = 3'b0;
    op = 0; immsel = 2'b0;
    immregsel = 0;
    src2inv = 0;
    bezq = 0; bnez = 0; bltz = 0; bgez = 0;
    sub = 0; setctl = 2'b0; aluctl = 3'b0;
    enable = 0; wr = 0; createdump = 0;
    memalusel = 0;
    case(instr[15:11])
      
      
      
    endcase
  end
  
endmodule