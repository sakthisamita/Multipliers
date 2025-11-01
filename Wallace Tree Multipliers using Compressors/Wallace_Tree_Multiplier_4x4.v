`timescale 1ns / 1ps

module Wallace_Tree_Multiplier_4x4(
    input [3:0] A,
    input [3:0] B,
    output [7:0] Product
    );
    
    wire [14:1] S, C;
    wire a0b0, a0b1, a0b2, a0b3, a1b0, a1b1, a1b2, a1b3, a2b0, a2b1, a2b2, a2b3, a3b0, a3b1, a3b2, a3b3, C3out;
    
    and (a0b0, A[0], B[0]);
    and (a0b1, A[0], B[1]);
    and (a0b2, A[0], B[2]);
    and (a0b3, A[0], B[3]);
    and (a1b0, A[1], B[0]);
    and (a1b1, A[1], B[1]);
    and (a1b2, A[1], B[2]);
    and (a1b3, A[1], B[3]);
    and (a2b0, A[2], B[0]);
    and (a2b1, A[2], B[1]);
    and (a2b2, A[2], B[2]);
    and (a2b3, A[2], B[3]);
    and (a3b0, A[3], B[0]);
    and (a3b1, A[3], B[1]);
    and (a3b2, A[3], B[2]);
    and (a3b3, A[3], B[3]);  
    
    // Reduction Stage
    Half_Adder HA1 (a0b1, a1b0, S[1], C[1]);
    Full_Adder FA2 (a0b2, a1b1, a2b0, S[2], C[2]);
    Compressor_4_2 CMP3 (a0b3, a1b2, a2b1, a3b0, 1'b0, S[3], C[3], C3out); 
    Full_Adder FA4 (a1b3, a2b2, a3b1, S[4], C[4]);
    Half_Adder HA5 (a2b3, a3b2, S[5], C[5]);  
    
    // Final Adder Stage - 1
    Half_Adder HA6 (S[2], C[1], S[6], C[6]);
    Full_Adder FA7 (S[3], C[2], C[6], S[7], C[7]);
    Full_Adder FA8 (S[4], C3out, C[3], S[8], C[8]);
    Full_Adder FA9 (S[5], C[4], C[8], S[9], C[9]);
    Full_Adder FA10 (a3b3, C[5], C[9], S[10], C[10]);
    
    // Final Adder Stage - 2
    Half_Adder HA11 (S[8], C[7], S[11], C[11]);
    Half_Adder HA12 (S[9], C[11], S[12], C[12]);
    Half_Adder HA13 (S[10], C[12], S[13], C[13]);
    Half_Adder HA14 (C[10], C[13], S[14], C[14]);
    
    assign Product = {S[14], S[13], S[12], S[11], S[7], S[6], S[1], a0b0};
    
endmodule
