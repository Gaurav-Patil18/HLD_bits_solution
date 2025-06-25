// Problem: 139 - exams/ece241_2013_q8
module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output reg z ); 
    
	parameter a=0,b=1,c=2;
    reg[1:0]state,next_state;
    
    always@(*)begin
        if(state==b)next_state=(!x)?c:b;
        else if(state==c)next_state=(!x)?a:b;
        else next_state=(!x)?a:b;
    end
    
    always@(posedge clk,negedge aresetn)begin
        if(!aresetn)state<=a;
        else state<=next_state;
    end
    
     always@(*)begin
         if(state==c)z=(!x)?0:1;
        else z=0;
    end
endmodule
