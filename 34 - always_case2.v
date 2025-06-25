// Problem: 34 - always_case2
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always@(*)begin
        casez(in)
            'bzzz1:pos=0;
            'bzz10:pos=1;
            'bz100:pos=2;
            'b1000:pos=3;
            default:pos=0;
        endcase
    end
endmodule
