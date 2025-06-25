// Problem: 114 - exams/2014_q4b
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    wire E=KEY[1];
    wire l=KEY[2];
    wire w=KEY[3];
    wire clk=KEY[0];
    wire q0,q1,q2,q3;
    MUXDFF s0(.E(E),.r(SW[0]),.l(l),.w(q1),.clk(clk),.q(q0));
    MUXDFF s1(.E(E),.r(SW[1]),.l(l),.w(q2),.clk(clk),.q(q1));
    MUXDFF s2(.E(E),.r(SW[2]),.l(l),.w(q3),.clk(clk),.q(q2));
    MUXDFF s3(.E(E),.r(SW[3]),.l(l),.w(w),.clk(clk),.q(q3));
    assign LEDR={q3,q2,q1,q0};
endmodule

module MUXDFF (input E,input r,input l,input w,input clk,output reg q);
    always@(posedge clk)
        begin
            q<=l?r:(E?w:q);
        end

endmodule
