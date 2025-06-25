// Problem: 140 - exams/ece241_2014_q5a
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter a=0,b=1,c=2;
    reg [1:0]state,next_state;
    always@(posedge clk,posedge areset)begin
        if(areset)state<=0;
        else state<=next_state;
    end
    always@(*)begin
        case(state)
            a:next_state=x?b:a;
            b:next_state=x?c:b;
            c:next_state=x?c:b;
            default:next_state=a;    
        endcase
    end
   
     always@(*)begin
        case(state)
            a:z=0;
            b:z=1;
            c:z=0;
            default:z=0;    
        endcase
    end
endmodule

