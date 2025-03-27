module MUXX(input L,input r_in,input q_in,output D);
    assign D=(L&r_in)|((~L)&q_in);
endmodule

module DFFF(input clk,input D,output Q);
    always @(posedge clk)
        begin
            Q<=D;
        end
endmodule

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    wire bridge;
    MUXX mux1(L,r_in,q_in,bridge);
    DFFF dff1(clk,bridge,Q);
endmodule
