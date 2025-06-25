// Problem: 106 - count_clock
module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire [3:0]c0,c1,c2,c3,c4,c5;
    wire reset0,reset1,reset2,reset3,reset4_0,reset5_0,reset4_1,reset5_1;
    wire ena1,ena2,ena3,ena4,ena5;
    
    assign ss={c1,c0};
    assign mm={c3,c2};
    assign hh={c5,c4};
    
    always@(posedge clk)
        begin
            if(reset)
                pm<=0;
            else
                pm<=((hh=='h11)&&(mm=='h59)&&(ss=='h59))?(~pm):pm;
        end
    
    mod_counter counter0(clk,{reset0,1'b0},ena,c0);
    mod_counter counter1(clk,{reset1,1'b0},ena1&&ena,c1);
    mod_counter counter2(clk,{reset2,1'b0},ena2&&ena,c2);
    mod_counter counter3(clk,{reset3,1'b0},ena3&&ena,c3);
    mod_counter counter4(clk,{reset4_0,reset4_1},ena4&&ena,c4);
    mod_counter counter5(clk,{reset5_0,reset5_1},ena5&&ena,c5);
    always@(*)
        begin
            ena1=(c0=='d9)?'d1:'d0;
            ena2=((c0=='d9)&&(c1=='d5))?'d1:'d0;
            ena3=((c2=='d9)&&(c0=='d9)&&(c1=='d5))?'d1:'d0;
            ena4=((c2=='d9)&&(c3=='d5)&&(c0=='d9)&&(c1=='d5))?'d1:'d0;
            ena5=((c4=='d9)&&(c2=='d9)&&(c3=='d5)&&(c0=='d9)&&(c1=='d5))?'d1:'d0;

        end
    always@(*)
        begin
            reset0=(reset);
            reset1=(reset|((c1=='d5)&&(c0=='d9)));
            reset2=(reset);
            reset3=(reset|((c3=='d5)&&(c2=='d9)&&(c1=='d5)&&(c0=='d9)) );
            if(reset=='b0)
                begin
                    if((c4=='d2)&&(c5=='d1)&&(c2=='d9)&&(c3=='d5)&&(c0=='d9)&&(c1=='d5)) 
                        begin 
                            reset4_0='b1;
                            reset4_1='b1;
                            reset5_0='b1;
                            reset5_1='b0;
                        end
                	else
                        begin 
                            reset4_0='b0;
                            reset4_1='b0;
                            reset5_0='b0;
                            reset5_1='b0;
                        end
                end else
                   begin
                        reset4_0='b0;
                        reset4_1='b1;
                        reset5_0='b1;
                        reset5_1='b1;
                   end                
        end
endmodule

module mod_counter(
    input clk,
    input [1:0]reset,
    input ena,
    output reg[3:0]c);
    
    always@(posedge clk)
        begin
            if(reset!='b0) 
                case(reset)
                    'b10:c<='b0;
                    'b01:c<='d2;
                    'b11:c<='d1;
                endcase
            else 
                begin
                    if(ena)c<=(c=='d9)?'b0:c+1;
                end
        end
        
endmodule
