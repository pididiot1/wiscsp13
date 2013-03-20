module inc_2(
              //Input
              A,              
              //Output
              sum
              );
    
    output [15:0] sum;
    input  [15:0] A;
    wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
    fullAdder zero  (.sum(sum[0]),.cout(c0),.a(A[0]),.b(1'b0),.cin(1'b0)); 
    fullAdder one   (.sum(sum[1]),.cout(c1),.a(A[1]),.b(1'b1),.cin(c0));
    fullAdder two   (.sum(sum[2]),.cout(c2),.a(A[2]),.b(1'b0),.cin(c1));
    fullAdder three (.sum(sum[3]),.cout(c3),.a(A[3]),.b(1'b0),.cin(c2));
    fullAdder four  (.sum(sum[4]),.cout(c4),.a(A[4]),.b(1'b0),.cin(c3));
    fullAdder five  (.sum(sum[5]),.cout(c5),.a(A[5]),.b(1'b0),.cin(c4));
    fullAdder six   (.sum(sum[6]),.cout(c6),.a(A[6]),.b(1'b0),.cin(c5));
    fullAdder seven (.sum(sum[7]),.cout(c7),.a(A[7]),.b(1'b0),.cin(c6));
    fullAdder eight (.sum(sum[8]),.cout(c8),.a(A[8]),.b(1'b0),.cin(c7));
    fullAdder nine  (.sum(sum[9]),.cout(c9),.a(A[9]),.b(1'b0),.cin(c8));
    fullAdder ten   (.sum(sum[10]),.cout(c10),.a(A[10]),.b(1'b0),.cin(c9));
    fullAdder eleven(.sum(sum[11]),.cout(c11),.a(A[11]),.b(1'b0),.cin(c10));
    fullAdder twelve(.sum(sum[12]),.cout(c12),.a(A[12]),.b(1'b0),.cin(c11));
    fullAdder thirteen(.sum(sum[13]),.cout(c13),.a(A[13]),.b(1'b0),.cin(c12));
    fullAdder fourteen(.sum(sum[14]),.cout(c14),.a(A[14]),.b(1'b0),.cin(c13));
    fullAdder fifteen (.sum(sum[15]),.cout(c15),.a(A[15]),.b(1'b0),.cin(c14));
    /*    
    halfAdder zero     (.sum(sum[0]),.cout(c0),.a(A[0]), .cin(1'b0)); 
    halfAdder one      (.sum(sum[1]),.cout(c1),.a(A[1]), .cin(1'b1)); 
    halfAdder two      (.sum(sum[2]),.cout(c2),.a(A[2]), .cin(c1)); 
    halfAdder three    (.sum(sum[3]),.cout(c3),.a(A[3]), .cin(c2)); 
    halfAdder four     (.sum(sum[4]),.cout(c4),.a(A[4]), .cin(c3)); 
    halfAdder five     (.sum(sum[5]),.cout(c5),.a(A[5]), .cin(c4)); 
    halfAdder six      (.sum(sum[6]),.cout(c6),.a(A[6]), .cin(c5)); 
    halfAdder seven    (.sum(sum[7]),.cout(c7),.a(A[7]), .cin(c6)); 
    halfAdder eight    (.sum(sum[8]),.cout(c8),.a(A[8]), .cin(c7)); 
    halfAdder nine     (.sum(sum[9]),.cout(c9),.a(A[9]), .cin(c8)); 
    halfAdder ten      (.sum(sum[10]),.cout(c10),.a(A[10]), .cin(c9)); 
    halfAdder eleven   (.sum(sum[11]),.cout(c11),.a(A[11]), .cin(c10)); 
    halfAdder twelve   (.sum(sum[12]),.cout(c12),.a(A[12]), .cin(c11)); 
    halfAdder thirteen (.sum(sum[13]),.cout(c13),.a(A[13]), .cin(c12)); 
    halfAdder fourteen (.sum(sum[14]),.cout(c14),.a(A[14]), .cin(c13)); 
    halfAdder fifteen  (.sum(sum[15]),.cout(c15),.a(A[15]), .cin(c14)); 
    */        
endmodule
