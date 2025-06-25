// Problem: 96 - edgedetect2
module top_module (
    input clk,
    input [7:0] in,
    output reg[7:0] anyedge
);
    reg [7:0]pedge_reg;
    always@(posedge clk)begin
        pedge_reg<=in;
        anyedge<=(pedge_reg) ^ ( in);
    end
endmodule
