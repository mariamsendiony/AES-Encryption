module Top (output done, output [127:0] Dout, input [127:0] plain_text_in, key_in, input encrypt, clock, reset);
	wire init, increment, en_Dout, count_lt_10,enable;
	
	Controller cu(done, init,en_Dout,enable,increment, count_lt_10, encrypt, clock, reset);
	DataPath dp_enc(Dout, count_lt_10, key_in, plain_text_in,init,  en_Dout, reset, clock,increment);
endmodule
