// Problem: 28 - module_addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
 	wire cout;
    wire [31:0]x;
    assign x={32{sub}}^b;
    add16 z( a[15:0] , x[15:0] ,sub, sum[15:0] ,cout );
    add16 y( a[31:16] , x[31:16] ,cout, sum[31:16]  );
endmodule
