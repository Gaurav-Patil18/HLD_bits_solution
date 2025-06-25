// Problem: 111 - mt2015_lfsr
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    reg q0,q1,q2;
    assign LEDR={q2,q1,q0}; 
    always@(posedge KEY[0])
        begin
            q0<=KEY[1]?SW[0]:q2;
            q1<=KEY[1]?SW[1]:q0;
            q2<=KEY[1]?SW[2]:(q1^q2);
        end

endmodule
