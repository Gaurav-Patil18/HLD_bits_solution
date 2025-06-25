// Problem: 68 - adder3
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
genvar i;
    assign {cout[0],sum[0]}=a[0]+b[0]+cin;
    generate
        for(i=1;i<3;i=i+1)begin:z
            assign {cout[i],sum[i]}=a[i]+b[i]+cout[i-1];
        end
    endgenerate
endmodule
