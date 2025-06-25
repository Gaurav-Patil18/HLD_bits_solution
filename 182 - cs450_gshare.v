// Problem: 182 - cs450/gshare
module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output reg predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);
    genvar i;
    reg [127:0]train_valid_bc;
    wire [1:0]state[127:0];
    reg [6:0]ghr;
    generate
        for(i=0;i<128;i=i+1)begin:x
            bitcounter y(clk,areset,train_valid_bc[i],train_taken,state[i]);
        end
    endgenerate
    
    always@(*)begin
        train_valid_bc='b0;
        train_valid_bc[train_pc^train_history]=train_valid|train_mispredicted;
        
        if(predict_valid)predict_taken=state[predict_pc^ghr][1];
        else predict_taken='b0;
    end
    
   always @(posedge clk or posedge areset) begin
    if (areset)
        ghr <= 7'b0;
    else if (train_valid && train_mispredicted)
        ghr <= {train_history[5:0], train_taken};    
    else if (predict_valid)
        ghr <= {ghr[5:0], predict_taken}; 
end

assign predict_history=ghr;
endmodule

module bitcounter(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg[1:0] state
);
    always@(posedge clk,posedge areset)begin
        if(areset)state<='d1;
        else if(train_valid)begin
            if(train_taken)state<=(state=='d3)?'d3:(state+1);
            else  state<=(state=='d0)?'d0:(state-1);  
        end
    end
endmodule

