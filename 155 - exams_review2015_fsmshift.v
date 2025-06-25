// Problem: 155 - exams/review2015_fsmshift
module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg[2:0]cnt;
    always@(posedge clk)begin
        if(reset)cnt<='b0;
        else cnt<=(cnt=='d4)?'d4:(cnt+1);
    end
    assign shift_ena=(cnt!='d4);
endmodule
