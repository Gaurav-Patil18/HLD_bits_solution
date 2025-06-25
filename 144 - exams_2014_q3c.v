// Problem: 144 - exams/2014_q3c
module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    parameter a=0,b=1,c=2,d=3,e=4;
    reg[2:0]next_state;
    always@(*)begin
        case(y)
            	a:next_state=x?b:a;
                b:next_state=x?e:b;
                c:next_state=x?b:c;
                d:next_state=x?c:b;
                e:next_state=x?e:d;
                default:next_state=a;   
        endcase
    end
    
    assign z=(y==e)|(y==d);
    assign Y0=next_state[0];

endmodule
