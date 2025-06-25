// Problem: 87 - exams/m2014_q4a
module top_module (
    input d, 
    input ena,
    output q);
    
    assign q=(ena)?d:q;
endmodule
