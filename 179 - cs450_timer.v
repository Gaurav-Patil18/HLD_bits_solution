// Problem: 179 - cs450/timer
module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0]q;
    always@(posedge clk)begin
        if(load)q<=data;
        else q<=(q=='b0)?'b0:q-1;
    end
    assign tc=q=='b0;
endmodule
