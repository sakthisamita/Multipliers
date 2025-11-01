`timescale 1ns / 1ps

module Dadda_Multiplier_4x4(
    input [3:0] A,
    input [3:0] B,
    output [7:0] Product
    );
    
    // Partial Products
    assign a0b0 = A[0] & B[0];
    assign a0b1 = A[0] & B[1];
    assign a0b2 = A[0] & B[2];
    assign a0b3 = A[0] & B[3];
    assign a1b0 = A[1] & B[0];
    assign a1b1 = A[1] & B[1];
    assign a1b2 = A[1] & B[2];
    assign a1b3 = A[1] & B[3];
    assign a2b0 = A[2] & B[0];
    assign a2b1 = A[2] & B[1];
    assign a2b2 = A[2] & B[2];
    assign a2b3 = A[2] & B[3];
    assign a3b0 = A[3] & B[0];
    assign a3b1 = A[3] & B[1];
    assign a3b2 = A[3] & B[2];
    assign a3b3 = A[3] & B[3];
    
    wire [11:0] S, C;
    
    // Stage - 1
    Half_Adder HA0 (a0b1, a1b0, S[0], C[0]);
    Full_Adder FA1 (a0b2, a1b1, a2b0, S[1], C[1]);
    Full_Adder FA2 (a0b3, a1b2, a2b1, S[2], C[2]);
    Half_Adder HA3 (a1b3, a2b2, S[3], C[3]);
    
    // Stage - 2
    Half_Adder HA4 (C[0], S[1], S[4], C[4]);
    Full_Adder FA5 (C[1], S[2], a3b0, S[5], C[5]);
    Full_Adder FA6 (C[2], S[3], a3b1, S[6], C[6]);
    Full_Adder FA7 (C[3], a2b3, a3b2, S[7], C[7]);
    
    // Stage - 3
    Half_Adder HA8 (C[4], S[5], S[8], C[8]);
    Full_Adder FA9 (C[5], S[6], C[8], S[9], C[9]);
    Full_Adder FA10 (C[6], S[7], C[9], S[10], C[10]);
    Full_Adder FA11 (C[7], a3b3, C[10], S[11], C[11]);
    
    assign Product = {C[11], S[11], S[10], S[9], S[8], S[4], S[0], a0b0}; 
    
endmodule
