// Problem: 115 - exams/ece241_2013_q12
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0]q;
    always@(posedge clk)
        begin
        q<=enable?{q[6:0],S}:q;
        end
    assign Z=q[{A,B,C}];
endmodule
