module Compressor_4_2(
    input a,
    input b,
    input c,
    input d,
    input cin,
    output sum,
    output carry,
    output cout
    );
    
    wire w;
    
    Full_Adder FA1 (.A(a), .B(b), .Cin(c), .Sum(w), .Carry(cout));
    Full_Adder FA2 (.A(w), .B(d), .Cin(cin), .Sum(sum), .Carry(carry));
    
endmodule

