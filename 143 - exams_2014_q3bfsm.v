// Problem: 143 - exams/2014_q3bfsm
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter a=0,b=1,c=2,d=3,e=4;
    reg[2:0]state,next_state;
    always@(*)begin
        case(state)
            	a:next_state=x?b:a;
                b:next_state=x?e:b;
                c:next_state=x?b:c;
                d:next_state=x?c:b;
                e:next_state=x?e:d;
                default:next_state=a;   
        endcase
    end
    always@(posedge clk)begin
        if(reset)    state<=a;
        else	state<=next_state;
   	end
    assign z=(state==e)|(state==d);
endmodule
