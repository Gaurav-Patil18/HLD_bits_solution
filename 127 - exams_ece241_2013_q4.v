// Problem: 127 - exams/ece241_2013_q4
module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    reg [3:0]fr;
    reg [2:0]next_state,state;
    assign fr1=fr[3];
    assign fr2=fr[2];
    assign fr3=fr[1];
    assign dfr=fr[0];
    always@(*)begin
        case(state)
            	A:begin
                    next_state=(s[1]==1)?B:A;
                  end	
                B:begin
                    if(s[2]==1)next_state=C;
                    else if(s[1]==0)next_state=A;
                    else next_state=B;
                  end    
                C:begin
                    if(s[3]==1)next_state=E;
                    else if (s[2]==0)next_state=D;
                    else next_state=C;
                  end    
            	D:begin
                    if(s[1]==0)next_state=A;
                    else if(s[2]==1)next_state=C;
            		else next_state=D;
                  end  
            	E:begin
                    if(s[3]==0)next_state=F;
                    else next_state=E; 
                  end
            	F:begin
                    if(s[3]==1)next_state=E;
                    else if(s[2]==0)next_state=D;
                    else next_state=F;
                  end
        	    default:begin
             		next_state=A;
        		 end	
        endcase
    end
    
    always@(*)begin
        case(state)
            A:fr='b1111;
            B:fr='b1100;
            C:fr='b1000;
            D:fr='b1101;
            E:fr='b0000;
            F:fr='b1001;
            default:fr='b1111;
        endcase
    end
                
    always@(posedge clk)
           begin
               if(reset) state<=A;
               else state<=next_state;
           end
endmodule
