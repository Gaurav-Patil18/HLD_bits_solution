// Problem: 70 - exams/ece241_2014_q1c
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    wire c;
    assign {c,s}=a+b;
    assign overflow =((a[7]==b[7])&&(s[7]!=a[7]));
endmodule
