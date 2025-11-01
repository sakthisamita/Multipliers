`timescale 1ns / 1ps

module Dadda_Multiplier_4x4_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Output
    wire [7:0] Product;

    // Instantiate the DUT (Device Under Test)
    Dadda_Multiplier_4x4 uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin
        // Display header
        $display("Time\tA\tB\tProduct");

        // Monitor signals
        $monitor("%g\t%d\t%d\t%d", $time, A, B, Product);

        // Test cases
        A = 4'd0;  B = 4'd0;  #10;
        A = 4'd2;  B = 4'd3;  #10;
        A = 4'd7;  B = 4'd4;  #10;
        A = 4'd9;  B = 4'd5;  #10;
        A = 4'd15; B = 4'd15; #10;
        A = 4'd12; B = 4'd3;  #10;
        A = 4'd6;  B = 4'd10; #10;

        // Finish simulation
        $finish;
    end

endmodule
