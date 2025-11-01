module Full_Adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Carry
    );
    
    wire W1, W2, W3;
    
    Half_Adder HA1 (.A(A), .B(B), .Sum(W1), .Carry(W2));
    Half_Adder HA2 (.A(W1), .B(Cin), .Sum(Sum), .Carry(W3));
    assign Carry = W2 | W3;
    
endmodule