module mux_16w_2_1(Out, A, B, Sel);

    output [15:0] Out;
    input  [15:0] A, B;
    input  Sel;

    assign Out[0] = Sel ? B[0] : A[0]; 
    assign Out[1] = Sel ? B[1] : A[1]; 
    assign Out[2] = Sel ? B[2] : A[2]; 
    assign Out[3] = Sel ? B[3] : A[3]; 
    assign Out[4] = Sel ? B[4] : A[4]; 
    assign Out[5] = Sel ? B[5] : A[5]; 
    assign Out[6] = Sel ? B[6] : A[6]; 
    assign Out[7] = Sel ? B[7] : A[7]; 
    assign Out[8] = Sel ? B[8] : A[8]; 
    assign Out[9] = Sel ? B[9] : A[9]; 
    assign Out[10] = Sel ? B[10] : A[10]; 
    assign Out[11] = Sel ? B[11] : A[11]; 
    assign Out[12] = Sel ? B[12] : A[12]; 
    assign Out[13] = Sel ? B[13] : A[13]; 
    assign Out[14] = Sel ? B[14] : A[14]; 
    assign Out[15] = Sel ? B[15] : A[15]; 

endmodule
