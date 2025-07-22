module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg [1:0] state
);

    
    always @(posedge clk or posedge areset)
        begin
            if(areset) state<=1;
            else
                if(state==1 || state==2) 
                    begin
                        if(train_valid==1 && train_taken==1) state<=state+1;
                        if(train_valid==1 && train_taken==0) state<=state-1;
                    end
            	else if (state==0) 
                	begin
                        if(train_valid==1 && train_taken==1) state<=state+1;
                	end
            	else if(state==3)
               		begin
                         if(train_valid==1 && train_taken==0) state<=state-1;
               		end
        end
        

endmodule
