`timescale 1ns / 1ps

module Dadda_Multiplier_8x8_tb;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;

    // Output
    wire [15:0] Product;

    // Instantiate the Unit Under Test (UUT)
    Dadda_Multplier_8x8 uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin
        // Monitor signals
        $monitor("Time=%0t : A=%d, B=%d, Product=%d (0x%h)", $time, A, B, Product, Product);

        // Test 1
        A = 8'd0; B = 8'd0;
        #10;

        // Test 2
        A = 8'd5; B = 8'd3;
        #10;

        // Test 3
        A = 8'd12; B = 8'd15;
        #10;

        // Test 4
        A = 8'd255; B = 8'd1;
        #10;

        // Test 5
        A = 8'd128; B = 8'd2;
        #10;

        // Test 6
        A = 8'd255; B = 8'd255;
        #10;

        // End simulation
        $finish;
    end

endmodule
