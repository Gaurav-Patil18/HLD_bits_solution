// Problem: 80 - exams/ece241_2014_q3
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in[0]=d?1:(c?1:0);
    assign mux_in[1]=0;
    assign mux_in[3]=d?(c?1:0):0;
    assign mux_in[2]=d?0:1;
endmodule
