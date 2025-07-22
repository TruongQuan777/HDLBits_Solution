module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
    
);
    
    always @(posedge clk, posedge areset)
        begin
            if(areset)
                begin
                    predict_history<=0;
                end
            else
                begin
                    if(predict_valid==1 && train_mispredicted==0) predict_history<={predict_history[30:0],predict_taken};
                    else if(train_mispredicted==1) predict_history<={train_history[30:0],train_taken};
                    else;
                end
                
        end

endmodule
