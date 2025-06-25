// Problem: 103 - exams/ece241_2014_q7a
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    count4 the_counter (clk, c_enable, c_load, c_d , Q );
    
    always@(*)
        begin
            c_enable=enable;
            c_load=(reset|((Q=='d12)&&enable))?'b1:'b0;
            c_d=(reset|((Q=='d12)&&enable))?'b1:'b0;
        end

endmodule
