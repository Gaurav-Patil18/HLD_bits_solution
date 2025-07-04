// Problem: 33 - always_case
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            'd0:out=data0;
            'd1:out=data1;
            'd2:out=data2;
            'd3:out=data3;
            'd4:out=data4;
            'd5:out=data5;
            default:out='b0;
        endcase
            end
endmodule
