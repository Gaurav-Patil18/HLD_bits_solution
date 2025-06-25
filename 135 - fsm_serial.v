// Problem: 135 - fsm_serial
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
	parameter A=0,B=1,C=2,D=3;
    reg [1:0]state,next_state;
    reg [3:0]count;
    always@(*)begin 
        case(state)
            A:next_state=(!in)?B:A;
            B:next_state=(count=='d8)?(in?C:D):B;
            C:next_state=(!in)?B:A;
            D:next_state=(in)?A:D;
        endcase
    end
    
   always@(posedge clk)begin
       
       if(reset)begin
           state<=A;
           count<='b0;
       end
       else begin
           state<=next_state;
           if(state==B)count<=count+1;
           else count<='b0;
       end
   end
            
   assign done=(state==C);       
endmodule
