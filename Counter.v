module Counter (output reg [3:0] count,
input clock, increment,reset);
	always @(posedge clock, posedge reset) begin
		if (reset)
			count <= 0;
		else
		if (increment)
		  count <= count + 4'b1;		
		
	end

endmodule
