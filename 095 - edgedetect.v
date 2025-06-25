// Problem: 95 - edgedetect
module top_module (
    input clk,
    input [7:0] in,
    output reg[7:0] pedge
);
    reg [7:0]pedge_reg;
    always@(posedge clk)begin
        pedge_reg<=in;
        pedge<=(~pedge_reg) &(in);
    end
endmodule
