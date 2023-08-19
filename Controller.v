module Controller(
	output reg done, init, en_Dout,enable,increment,
	input count_lt_10, encrypt, clock, reset
);
	parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3;
	reg [2:0] current, next;
	
	always @(posedge clock, posedge reset) begin
		if (reset)
			current <= S0;
		else
			current <= next;
	end

	always @(*) begin
		done = 0;
		init = 0;
		increment= 0;
    en_Dout = 0;
		init = 0;
		case (current)
			S0: begin
				if (encrypt) begin
					init = 1;
					next = S1;
				end
			end
			S1: begin
				enable=1;
				next = S2;
				increment=1;
				
				if (count_lt_10) begin
					next = S1;
				end
				else begin
					next = S2;
				
			end
			end
			S2: begin 
				enable=0;
				next=S3;
			end
			S3: begin
			  done = 1;
			end
			
			
			  
			
		endcase
	end
endmodule
