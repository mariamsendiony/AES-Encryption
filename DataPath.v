module DataPath(output [127:0] Dout, output count_lt_10,
	input [127:0] key_in, 
	input [127:0] plain_text_in,
	 input enable,en_Dout, init, reset,clock,increment);
	
  
  wire [127:0] round_in, Din;
  wire [127:0] sub_out;
  wire [127:0] row_out;
  wire [127:0] col_out;
  wire [3:0] count;
  wire [127:0] key_r_out;
	wire [127:0] key_r [0:10];
Key_expansion ke(key_r[0], key_r[1], key_r[2], key_r[3], key_r[4], key_r[5], key_r[6], key_r[7], key_r[8], key_r[9], key_r[10], key_in);
Sub_Bytes sb(sub_out, round_in);
shift_rows sr(row_out, sub_out);
Mix_Columna mc(enable,row_out,col_out );
Counter counter( count, clock, increment,reset);
assign count_lt_10 = count < 10;
DFF_1 Reg_Dout(Dout, Din, en_Dout, clock, reset);
assign key_r_out = key_r[count];
assign round_in = ((init) ? plain_text_in : col_out) ^ key_r_out;
assign Din = row_out ^ key_r_out;

endmodule