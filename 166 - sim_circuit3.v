// Problem: 166 - sim/circuit3
module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (d&b)|(c&b)|(a&d)|(a&c); // Fix me

endmodule
