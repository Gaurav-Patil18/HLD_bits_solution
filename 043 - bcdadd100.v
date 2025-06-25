// Problem: 43 - bcdadd100
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
genvar i;
    wire [100:0]cout_1;
    assign cout_1[0]=cin;
    assign cout=cout_1[100];
    generate
        for(i=0;i<400;i=i+4)begin:x
            bcd_fadd ({a[i+3],a[i+2],a[i+1],a[i]},{b[i+3],b[i+2],b[i+1],b[i]},cout_1[i/4],cout_1[(i/4)+1],{sum[i+3],sum[i+2],sum[i+1],sum[i]} ); 
        end
    endgenerate
endmodule
