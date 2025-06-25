// Problem: 136 - fsm_serialdata
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg[7:0] out_byte,
    output done
); //

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
           out_byte<='b0;
       end
       else begin
           state<=next_state;
           if(state==B)
               begin
                   count<=count+1;
                   if(count<='d7)out_byte<={in,out_byte[7:1]};
               end
           else count<='b0;
       end
   end
            
   assign done=(state==C);       
endmodule
