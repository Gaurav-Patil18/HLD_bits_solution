// Problem: 142 - exams/2014_q3fsm
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output reg z
);
parameter a=0,b=1,c=2,d=3,e=4,f=5,g=6;
    reg [2:0]state,next_state;
    wire in=w;
    reg z_int;
    reg q;
    always@(*)begin
        case(state)
        a:next_state=in?d:b;
        b:next_state=in?c:g;
        c:next_state=a;
        d:next_state=in?e:f;
        e:next_state=a;
        f:next_state=a; 
        g:next_state=a;    
        default:next_state=a;    
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin state<=a; q<=0;z<=0; end
        else begin
            q<=(q?q:s)?1:0;
            state<=q?next_state:a;
            z<=z_int;
        end
    end
    
    always@(*)begin
        case(state)
        	a:z_int=0;
        	b:z_int=0;
        	c:z_int=in?1:0;
        	d:z_int=0;
        	e:z_int=in?0:1;
            f:z_int=in?1:0;
            g:z_int=0;    
            default:z_int=0;
        endcase
    end
endmodule
