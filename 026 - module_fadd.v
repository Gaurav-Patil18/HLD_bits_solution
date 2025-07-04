// Problem: 26 - module_fadd
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire coutx;
    add16 r( a[15:0],b[15:0],1'b0,sum[15:0],coutx);
    add16 q( a[31:16],b[31:16],coutx,sum[31:16]);
endmodule



module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout,sum}=a+b+cin;
endmodule
