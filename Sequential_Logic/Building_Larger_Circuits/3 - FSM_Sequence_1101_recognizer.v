module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg start_shifting);
    
    reg [2:0] state;
    reg [2:0] next_state;
    
    always @(*)
    begin
        if(state == 3'b000)
        begin
            if(data == 1) 
                next_state = 3'b001; 
            else next_state=state;
            
        end
        if(state == 3'b001)
        begin
            if(data == 0) 
                next_state = 3'b000;
            else 
                next_state = 3'b010;
        end
        if(state == 3'b010)
        begin
            if(data == 0) 
                next_state = 3'b011;
            else next_state=state;
            
        end
        if(state == 3'b011)
        begin
            if(data == 0) 
                next_state = 3'b000;
            else 
                next_state = 3'b100;
        end
        if(state == 3'b100)
            next_state = state;

        start_shifting = (state == 3'b100);
    end
    
    always @(posedge clk)
    begin
        if(reset) 
            state = 3'b000;
        else 
            state = next_state;
    end

endmodule
