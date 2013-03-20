module alu (A, B, Cin, Op, Out, Ofl, Cout);
   
    input [15:0] A;
    input [15:0] B;
    input Cin;
    input [3:0] Op;
    output [15:0] Out;
    output Ofl;
    output Cout;

    wire [15:0] aAndB, aXorB, aOrB, sumAB, addOut, shiftOut, Inter, slbiOut, btrOut;
    wire Clast, Cprev;

    claAdder adder(.Sum(sumAB), .G(aAndB), .P(aOrB), .Cout(Cout), .Cprev(Cprev), .A(A), .B(B), .Cin(Cin));

    assign aXorB[0] = A[0] ^ B[0];
    assign aXorB[1] = A[1] ^ B[1];
    assign aXorB[2] = A[2] ^ B[2];
    assign aXorB[3] = A[3] ^ B[3];
    assign aXorB[4] = A[4] ^ B[4];
    assign aXorB[5] = A[5] ^ B[5];
    assign aXorB[6] = A[6] ^ B[6];
    assign aXorB[7] = A[7] ^ B[7];
    assign aXorB[8] = A[8] ^ B[8];
    assign aXorB[9] = A[9] ^ B[9];
    assign aXorB[10] = A[10] ^ B[10];
    assign aXorB[11] = A[11] ^ B[11];
    assign aXorB[12] = A[12] ^ B[12];
    assign aXorB[13] = A[13] ^ B[13];
    assign aXorB[14] = A[14] ^ B[14];
    assign aXorB[15] = A[15] ^ B[15];

    assign Ofl = (Op[2] & ~Op[1] & ~Op[0]) ? (Clast ^ Cprev) : 1'b0;
    
    // 00: SUM; 01: OR; 10: XOR 11: AND
    sixteenmux4_1 muxA(.Out(addOut), .InA(sumAB), .InB(aOrB), .InC(aXorB), .InD(aAndB), .Op(Op[1:0]));
    shifter  shift(.In(A), .Cnt(B[3:0]), .Op(Op[1:0]), .Out(shiftOut));
    assign slbiOut = {A[7:0], B[7:0]};
    assign btrOut  = {A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15]};
    assign Inter = Op[2] ? shiftOut : addOut;
    assign oddShift = Op[0] ? btrOut : slbiOut;
    assign Out   = Op[3] ? oddShift : Inter;

endmodule
