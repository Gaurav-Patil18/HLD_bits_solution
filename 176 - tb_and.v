// Problem: 176 - tb/and
module top_module();
    reg [1:0]in;
    reg out;
    andgate uut(in,out);
    initial begin
        in='b0;
        #10 in[0]=1;
        #10 in[0]=0; in[1]=1;
        #10 in[0]=1;
    end
endmodule
