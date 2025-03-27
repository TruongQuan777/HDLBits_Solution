module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg[0:2] state;
    reg[0:2] next_state;
    
    always @(posedge clk, posedge areset)
        begin
            if(areset) state<=2'b00;
            else state<=next_state;
        end
    always @(*)
        begin
            if(state==2'b00)
                begin
                    out=2'b00;
                    next_state=(in==2'b00)? 2'b00:2'b01;
                end
            if(state==2'b01)
                begin
                    out=2'b00;
                    next_state=(in==2'b00)? 2'b10:2'b01;
                end
            if(state==2'b10)
                begin
                    out=2'b00;
                    next_state=(in==2'b00)?2'b00:2'b11;
                end
            if(state==2'b11)
                begin
                    out=2'b01;
                    next_state=(in==2'b00)?2'b10:2'b01;
                end
        end
        


endmodule
