// Problem: 151 - exams/2013_q2bfsm
module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output reg f,
    output reg g
); 
    parameter a=0,b=1,c=2,d=3,e=4,f_int=5,g_int=6,h=7,i=8,j=9;
    reg [3:0]state,next_state;
    always@(*)begin
        case(state)
            a:next_state=b;
            b:next_state=j;
            j:next_state=x?c:f_int;
            c:next_state=x?c:d;
            d:next_state=x?e:f_int;
            e:next_state=y?h:g_int;
            f_int:next_state=x?c:f_int;
            g_int:next_state=y?h:i;
            h:next_state=h;
            i:next_state=i;
            default:next_state=a;    
        endcase
    end
    always@(posedge clk)begin
        if(!resetn)state<=a;
        else state<=next_state;
    end
    always@(*)begin
        f=(state==b);
        g=(state==e)|(state==g_int)|(state==h);
    end

endmodule
