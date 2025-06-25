// Problem: 104 - exams/ece241_2014_q7b
module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0]q0,q1,q2;
    reg edge_reg,extention;
    wire fall_edge;
    bcdcount counter0 (clk, reset, c_enable[0],q0);
    bcdcount counter1 (clk, reset, c_enable[1],q1);
    bcdcount counter2 (clk, reset, c_enable[2],q2);

    always@(*)
        begin
            c_enable[0]='d1;
            c_enable[1]=(q0=='d9);
            c_enable[2]=(q1=='d9)&&(q0=='d9);
           
        end
assign  OneHertz=(q0=='d9)&&(q1=='d9)&&(q2=='d9);

endmodule
