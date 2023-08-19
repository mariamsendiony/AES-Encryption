module DFF (output reg [127:0] Q, input [127:0] D, input enable, clock, reset);
	always @(posedge clock, posedge reset) begin
		if (reset)
			Q <= 128'd0;
		else if (enable)
			Q <= D;
	end
endmodule
