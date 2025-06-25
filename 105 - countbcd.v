// Problem: 105 - countbcd
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    decade_counter counter0(clk,reset,'b1,q[3:0]);
    decade_counter counter1(clk,reset,ena[1],q[7:4]);
    decade_counter counter2(clk,reset,ena[2],q[11:8]);
    decade_counter counter3(clk,reset,ena[3],q[15:12]);
    
    always@(*)
        begin
            ena[1]=(q[3:0]=='d9);
            ena[2]=(q[3:0]=='d9)&&(q[7:4]=='d9);
            ena[3]=(q[3:0]=='d9)&&(q[7:4]=='d9)&&(q[11:8]=='d9);
        end
endmodule

module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input en,
    output [3:0] q);
    always@(posedge clk)
        begin
            if(reset) q<='b0;
            else 
                begin
                    
                    if(en)q<=(q=='d9)?'b0:(q+1);
                end
        end    
endmodule

