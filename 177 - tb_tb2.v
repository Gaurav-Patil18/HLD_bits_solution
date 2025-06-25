// Problem: 177 - tb/tb2
module top_module();
    reg clk,in,out;
    reg[2:0]s;
 q7 uut(clk,in,s, out);
    initial begin
        s=2;
        in=0;
        #10 s=6;
        #10 s=2;in=1;
        #10 s=7;in=0;
        #10 s=0;in=1;
        #30 in=0;    
    end
    
    initial begin
                clk=0;
        forever #5 clk=~clk;
    end
endmodule
