// Problem: 113 - exams/m2014_q4k
module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg[3:0]r;
    always@(posedge clk)
        begin
            if(resetn=='b0) r<='b0;
            else r<={r[2:0],in};
        end
    assign out=r[3];
endmodule
