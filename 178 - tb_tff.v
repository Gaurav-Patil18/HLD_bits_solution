// Problem: 178 - tb/tff
module top_module ();
    reg clk,reset,t,q;
    tff uut(clk,reset,t,q);
    initial begin 
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
        reset=1;
        #10 reset=0; t=1;
        #10 t=0;
    end
endmodule
