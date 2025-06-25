// Problem: 42 - adder100i
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
genvar i;
    wire [100:0]cout_1;
    assign cout_1[0]=cin;
    assign cout=cout_1[100:1];
    generate
        for(i=0;i<100;i=i+1)begin:x
            add1 y(a[i],b[i],cout_1[i],cout_1[i+1],sum[i]);
        end
    endgenerate
endmodule

module add1(input a,
           input b,
           input cin,
           output cout,
           output sum);
    assign {cout,sum}=a+b+cin;
endmodule

