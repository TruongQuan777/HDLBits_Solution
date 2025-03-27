// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    reg present_state, next_state;
    
    always @(*)
        begin
        if(reset) next_state=1;
    	else if(present_state==1) next_state=in;
    	else if(present_state==0) next_state=~in;
        end
    always @(posedge clk) begin
            present_state=next_state;
        	out=present_state;
            end

endmodule
