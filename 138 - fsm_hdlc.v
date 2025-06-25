// Problem: 138 - fsm_hdlc
module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter a=0,b=1,c=2,d=3,e=4;
    reg[3:0]state,next_state;
    reg [2:0]cnt;
    always@(*)begin
        case(state)
         a:next_state=in?b:a;
            b:begin
                if((cnt=='d5)&&(!in))next_state=c;
                else if((cnt<'d4)&&(!in))next_state=a;
                else if((cnt=='d4)&&(!in))next_state=d;
                else if((cnt=='d5)&&(in))next_state=e;
                else next_state=b;
              end
             c:next_state=in?b:a;
             d:next_state=in?b:a;
             e:next_state=in?e:a;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset) begin
            state<=a;
            cnt='d0;
        end else begin
            state<=next_state;
            if(state==b)begin
                cnt<=cnt+1; 
            end else if (state==c)begin
                cnt<=0;
            end else if(state==d)begin
                cnt<=0;
            end else if(state==e)begin
                cnt<=0;
            end else begin
                cnt<=0;
            end
            
        end
    end
    
    always@(*)begin
        if(state==b)begin
                disc=0;
                flag=0;
                err=0;
            end else if (state==c)begin
                flag=1;
                disc=0;
            	err=0;
            end else if(state==d)begin
                disc=1;
                flag=0;
                err=0;
            end else if(state==e)begin
                err=1;
                disc=0;
            	flag=0;
            end else begin
                disc<=0;
                flag<=0;
                err<=0;
                
            end
    end
endmodule
