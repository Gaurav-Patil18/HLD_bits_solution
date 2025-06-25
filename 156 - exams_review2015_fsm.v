// Problem: 156 - exams/review2015_fsm
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg shift_ena,
    output reg counting,
    input done_counting,
    output reg done,
    input ack );
    
    parameter a=0,b=1,c=2,d=3;
	wire start_shifting;
    reg shift_ena_reg,done_counting_reg,ack_reg,sh_op,op_reg,rst_seq,rst_shift;
    reg[1:0]state,next_state;
    seq s(.clk(clk),.reset(reset|rst_seq),.data(data),.start_shifting(start_shifting));
    shift sh(.clk(clk),.reset(reset|rst_shift),.shift_ena(sh_op));
    
    
    always@(*)begin
        case(state)
            a:next_state=(start_shifting)?b:a;
            b:next_state=(sh_op)?b:((done_counting&counting)?d:c);
            c:next_state=done_counting?d:c;
            d:next_state=ack?a:d;
        endcase
    end
    always@(posedge clk)begin
        if(reset)begin
            state<=a;
        end else begin
            state<=next_state;
        end
    end
    
    always@(*)begin
        case(state)
            a:begin
                rst_seq=0;
                rst_shift=start_shifting?0:1;
                counting=0;
                done=0;
                shift_ena=start_shifting?sh_op:0;
            end
            b:begin
                rst_shift=0;
                rst_seq=1;
                counting=sh_op?0:1;
                done=0;
                shift_ena=sh_op;
            end
            c:begin
                rst_shift=1;
                rst_seq=1;
                counting=1;
                done=0;
                shift_ena=0;
            end
            d:begin
                rst_shift=1;
                rst_seq=1;
                counting=0;
                done=1;
                shift_ena=0;
            end
        endcase
    end
endmodule

module shift (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg[2:0]cnt;
    always@(posedge clk)begin
        if(reset)cnt<='b0;
        else cnt<=(cnt=='d4)?'d4:(cnt+1);
    end
    assign shift_ena=(cnt!='d4);
endmodule

module seq (
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