// Problem: 27 - module_cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire[15:0]sum0,sum1;
    add16 x( a[15:0] , b[15:0] ,1'b0, sum[15:0] ,cout );
    add16 y( a[31:16] , b[31:16] ,1'b0, sum0[15:0]  );
    add16 z( a[31:16] , b[31:16] ,1'b1, sum1[15:0]  );
    assign sum[31:16]=cout?sum1:sum0;
endmodule
