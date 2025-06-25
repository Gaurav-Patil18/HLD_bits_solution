// Problem: 154 - exams/review2015_fsmseq
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
parameter a=0,b=1,c=2,d=3,e=4;
    reg [3:0]state,next_state;
    always@(*)begin
        case(state)
            a:next_state=data?b:a;
            b:next_state=data?c:a;
            c:next_state=data?c:d;
            d:next_state=data?e:a;
            e:next_state=e;
            default:next_state=a;  
        endcase
    end
                
   always@(posedge clk)begin
       if(reset)state<=a;
       else state<=next_state;
   end
            assign start_shifting=(state==e);
endmodule
