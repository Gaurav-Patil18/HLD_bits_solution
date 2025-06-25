// Problem: 88 - exams/m2014_q4b
module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);
    always@(posedge clk,posedge ar)begin
        if(ar)q<='b0;
        else q<=d;
    end
endmodule
