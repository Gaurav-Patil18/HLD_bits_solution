// Problem: 37 - conditional
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]x,y;
    assign x=(a>b)?b:a;
    assign y=(c>d)?d:c;
    assign min=(x>y)?y:x;
    // assign intermediate_result1 = compare? true: false;

endmodule
