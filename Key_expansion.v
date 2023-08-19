module Key_expansion(
  output reg [127:0] key_r0,key_r1,key_r2,key_r3,key_r4,key_r5,key_r6,key_r7,key_r8,key_r9,key_r10,
  input [127:0] key
);

 reg  [31:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43;

  reg [31:0] out_g1,out_g2,out_g3,out_g4,out_g5,out_g6,out_g7,out_g8,out_g9,out_g10;
 function [7:0] S_BOX( input [7:0]D_in);
   reg [7:0] D_out;
 begin
	 case (D_in) 
			8'h00: D_out = 8'h63;
			8'h01: D_out = 8'h7C;
			8'h02: D_out = 8'h77;
			8'h03: D_out = 8'h7B;
			8'h04: D_out = 8'hF2;
			8'h05: D_out = 8'h6B;
			8'h06: D_out = 8'h6F;
			8'h07: D_out = 8'hC5;
			8'h08: D_out = 8'h30;
			8'h09: D_out = 8'h01;
			8'h0A: D_out = 8'h67;
			8'h0B: D_out = 8'h2B;
			8'h0C: D_out = 8'hFE;
			8'h0D: D_out = 8'hD7;
			8'h0E: D_out = 8'hAB;
			8'h0F: D_out = 8'h76;
			8'h10: D_out = 8'hCA;
			8'h11: D_out = 8'h82;
			8'h12: D_out = 8'hC9;
			8'h13: D_out = 8'h7D;
			8'h14: D_out = 8'hFA;
			8'h15: D_out = 8'h59;
			8'h16: D_out = 8'h47;
			8'h17: D_out = 8'hF0;
			8'h18: D_out = 8'hAD;
			8'h19: D_out = 8'hD4;
			8'h1A: D_out = 8'hA2;
			8'h1B: D_out = 8'hAF;
			8'h1C: D_out = 8'h9C;
			8'h1D: D_out = 8'hA4;
			8'h1E: D_out = 8'h72;
			8'h1F: D_out = 8'hC0;
			8'h20: D_out = 8'hB7;
			8'h21: D_out = 8'hFD;
			8'h22: D_out = 8'h93;
			8'h23: D_out = 8'h26;
			8'h24: D_out = 8'h36;
			8'h25: D_out = 8'h3F;
			8'h26: D_out = 8'hF7;
			8'h27: D_out = 8'hCC;
			8'h28: D_out = 8'h34;
			8'h29: D_out = 8'hA5;
			8'h2A: D_out = 8'hE5;
			8'h2B: D_out = 8'hF1;
			8'h2C: D_out = 8'h71;
			8'h2D: D_out = 8'hD8;
			8'h2E: D_out = 8'h31;
			8'h2F: D_out = 8'h15;
			8'h30: D_out = 8'h04;
			8'h31: D_out = 8'hC7;
			8'h32: D_out = 8'h23;
			8'h33: D_out = 8'hC3;
			8'h34: D_out = 8'h18;
			8'h35: D_out = 8'h96;
			8'h36: D_out = 8'h05;
			8'h37: D_out = 8'h9A;
			8'h38: D_out = 8'h07;
			8'h39: D_out = 8'h12;
			8'h3A: D_out = 8'h80;
			8'h3B: D_out = 8'hE2;
			8'h3C: D_out = 8'hEB;
			8'h3D: D_out = 8'h27;
			8'h3E: D_out = 8'hB2;
			8'h3F: D_out = 8'h75;
			8'h40: D_out = 8'h09;
			8'h41: D_out = 8'h83;
			8'h42: D_out = 8'h2C;
			8'h43: D_out = 8'h1A;
			8'h44: D_out = 8'h1B;
			8'h45: D_out = 8'h6E;
			8'h46: D_out = 8'h5A;
			8'h47: D_out = 8'hA0;
			8'h48: D_out = 8'h52;
			8'h49: D_out = 8'h3B;
			8'h4A: D_out = 8'hD6;
			8'h4B: D_out = 8'hB3;
			8'h4C: D_out = 8'h29;
			8'h4D: D_out = 8'hE3;
			8'h4E: D_out = 8'h2F;
			8'h4F: D_out = 8'h84;
			8'h50: D_out = 8'h53;
			8'h51: D_out = 8'hD1;
			8'h52: D_out = 8'h00;
			8'h53: D_out = 8'hED;
			8'h54: D_out = 8'h20;
			8'h55: D_out = 8'hFC;
			8'h56: D_out = 8'hB1;
			8'h57: D_out = 8'h5B;
			8'h58: D_out = 8'h6A;
			8'h59: D_out = 8'hCB;
			8'h5A: D_out = 8'hBE;
			8'h5B: D_out = 8'h39;
			8'h5C: D_out = 8'h4A;
			8'h5D: D_out = 8'h4C;
			8'h5E: D_out = 8'h58;
			8'h5F: D_out = 8'hCF;
			8'h60: D_out = 8'hD0;
			8'h61: D_out = 8'hEF;
			8'h62: D_out = 8'hAA;
			8'h63: D_out = 8'hFB;
			8'h64: D_out = 8'h43;
			8'h65: D_out = 8'h4D;
			8'h66: D_out = 8'h33;
			8'h67: D_out = 8'h85;
			8'h68: D_out = 8'h45;
			8'h69: D_out = 8'hF9;
			8'h6A: D_out = 8'h02;
			8'h6B: D_out = 8'h7F;
			8'h6C: D_out = 8'h50;
			8'h6D: D_out = 8'h3C;
			8'h6E: D_out = 8'h9F;
			8'h6F: D_out = 8'hA8;
			8'h70: D_out = 8'h51;
			8'h71: D_out = 8'hA3;
			8'h72: D_out = 8'h40;
			8'h73: D_out = 8'h8F;
			8'h74: D_out = 8'h92;
			8'h75: D_out = 8'h9D;
			8'h76: D_out = 8'h38;
			8'h77: D_out = 8'hF5;
			8'h78: D_out = 8'hBC;
			8'h79: D_out = 8'hB6;
			8'h7A: D_out = 8'hDA;
			8'h7B: D_out = 8'h21;
			8'h7C: D_out = 8'h10;
			8'h7D: D_out = 8'hFF;
			8'h7E: D_out = 8'hF3;
			8'h7F: D_out = 8'hD2;
			8'h80: D_out = 8'hCD;
			8'h81: D_out = 8'h0C;
			8'h82: D_out = 8'h13;
			8'h83: D_out = 8'hEC;
			8'h84: D_out = 8'h5F;
			8'h85: D_out = 8'h97;
			8'h86: D_out = 8'h44;
			8'h87: D_out = 8'h17;
			8'h88: D_out = 8'hC4;
			8'h89: D_out = 8'hA7;
			8'h8A: D_out = 8'h7E;
			8'h8B: D_out = 8'h3D;
			8'h8C: D_out = 8'h64;
			8'h8D: D_out = 8'h5D;
			8'h8E: D_out = 8'h19;
			8'h8F: D_out = 8'h73;
			8'h90: D_out = 8'h60;
			8'h91: D_out = 8'h81;
			8'h92: D_out = 8'h4F;
			8'h93: D_out = 8'hDC;
			8'h94: D_out = 8'h22;
			8'h95: D_out = 8'h2A;
			8'h96: D_out = 8'h90;
			8'h97: D_out = 8'h88;
			8'h98: D_out = 8'h46;
			8'h99: D_out = 8'hEE;
			8'h9A: D_out = 8'hB8;
			8'h9B: D_out = 8'h14;
			8'h9C: D_out = 8'hDE;
			8'h9D: D_out = 8'h5E;
			8'h9E: D_out = 8'h0B;
			8'h9F: D_out = 8'hDB;
			8'hA0: D_out = 8'hE0;
			8'hA1: D_out = 8'h32;
			8'hA2: D_out = 8'h3A;
			8'hA3: D_out = 8'h0A;
			8'hA4: D_out = 8'h49;
			8'hA5: D_out = 8'h06;
			8'hA6: D_out = 8'h24;
			8'hA7: D_out = 8'h5C;
			8'hA8: D_out = 8'hC2;
			8'hA9: D_out = 8'hD3;
			8'hAA: D_out = 8'hAC;
			8'hAB: D_out = 8'h62;
			8'hAC: D_out = 8'h91;
			8'hAD: D_out = 8'h95;
			8'hAE: D_out = 8'hE4;
			8'hAF: D_out = 8'h79;
			8'hB0: D_out = 8'hE7;
			8'hB1: D_out = 8'hC8;
			8'hB2: D_out = 8'h37;
			8'hB3: D_out = 8'h6D;
			8'hB4: D_out = 8'h8D;
			8'hB5: D_out = 8'hD5;
			8'hB6: D_out = 8'h4E;
			8'hB7: D_out = 8'hA9;
			8'hB8: D_out = 8'h6C;
			8'hB9: D_out = 8'h56;
			8'hBA: D_out = 8'hF4;
			8'hBB: D_out = 8'hEA;
			8'hBC: D_out = 8'h65;
			8'hBD: D_out = 8'h7A;
			8'hBE: D_out = 8'hAE;
			8'hBF: D_out = 8'h08;
			8'hC0: D_out = 8'hBA;
			8'hC1: D_out = 8'h78;
			8'hC2: D_out = 8'h25;
			8'hC3: D_out = 8'h2E;
			8'hC4: D_out = 8'h1C;
			8'hC5: D_out = 8'hA6;
			8'hC6: D_out = 8'hB4;
			8'hC7: D_out = 8'hC6;
			8'hC8: D_out = 8'hE8;
			8'hC9: D_out = 8'hDD;
			8'hCA: D_out = 8'h74;
			8'hCB: D_out = 8'h1F;
			8'hCC: D_out = 8'h4B;
			8'hCD: D_out = 8'hBD;
			8'hCE: D_out = 8'h8B;
			8'hCF: D_out = 8'h8A;
			8'hD0: D_out = 8'h70;
			8'hD1: D_out = 8'h3E;
			8'hD2: D_out = 8'hB5;
			8'hD3: D_out = 8'h66;
			8'hD4: D_out = 8'h48;
			8'hD5: D_out = 8'h03;
			8'hD6: D_out = 8'hF6;
			8'hD7: D_out = 8'h0E;
			8'hD8: D_out = 8'h61;
			8'hD9: D_out = 8'h35;
			8'hDA: D_out = 8'h57;
			8'hDB: D_out = 8'hB9;
			8'hDC: D_out = 8'h86;
			8'hDD: D_out = 8'hC1;
			8'hDE: D_out = 8'h1D;
			8'hDF: D_out = 8'h9E;
			8'hE0: D_out = 8'hE1;
			8'hE1: D_out = 8'hF8;
			8'hE2: D_out = 8'h98;
			8'hE3: D_out = 8'h11;
			8'hE4: D_out = 8'h69;
			8'hE5: D_out = 8'hD9;
			8'hE6: D_out = 8'h8E;
			8'hE7: D_out = 8'h94;
			8'hE8: D_out = 8'h9B;
			8'hE9: D_out = 8'h1E;
			8'hEA: D_out = 8'h87;
			8'hEB: D_out = 8'hE9;
			8'hEC: D_out = 8'hCE;
			8'hED: D_out = 8'h55;
			8'hEE: D_out = 8'h28;
			8'hEF: D_out = 8'hDF;
			8'hF0: D_out = 8'h8C;
			8'hF1: D_out = 8'hA1;
			8'hF2: D_out = 8'h89;
			8'hF3: D_out = 8'h0D;
			8'hF4: D_out = 8'hBF;
			8'hF5: D_out = 8'hE6;
			8'hF6: D_out = 8'h42;
			8'hF7: D_out = 8'h68;
			8'hF8: D_out = 8'h41;
			8'hF9: D_out = 8'h99;
			8'hFA: D_out = 8'h2D;
			8'hFB: D_out = 8'h0F;
			8'hFC: D_out = 8'hB0;
			8'hFD: D_out = 8'h54;
			8'hFE: D_out = 8'hBB;
			8'hFF: D_out = 8'h16;
			default:
					D_out = 8'h16;

		endcase

 end
 	
endfunction




function [7:0] rcon(input [3:0] i);
  reg [7:0] RC;
  begin
    case (i)
      4'd1:  RC = 8'h01;
      4'd2:  RC = 8'h02;
      4'd3:  RC = 8'h04;
      4'd4:  RC = 8'h08;
      4'd5:  RC = 8'h10;
      4'd6:  RC = 8'h20;
      4'd7:  RC = 8'h40;
      4'd8:  RC = 8'h80;
      4'd9:  RC = 8'h1B;
      4'd10: RC = 8'h36;
      default: RC = 8'h01;
    endcase
    
  end
 
endfunction


function [31:0] function_g( input [31:0] w,input [3:0] i);
	
	reg [31:0] shift_w ;
	reg [7:0] S_wire;
	reg [7:0] RC;
	reg [31:0] D_out;
	begin

	shift_w[31:24] = w[23:16];//w0
	shift_w[23:16] = w[15:8];//w1
	shift_w[15:8]  = w[7:0];//w2
	shift_w[7:0]   = w[31:24];//w3
	RC=rcon(i);
	D_out={ RC^S_BOX (shift_w[31:24]),S_BOX (shift_w[23:16]),S_BOX (shift_w[15:8]),S_BOX (shift_w[7:0])};
	
	
  end
  endfunction



  always @* begin
    w0 = key[127:96];
    w1 = key[95:64];
    w2 = key[63:32];
    w3 = key[31:0];
  
    w4 = w0 ^ out_g1;
    w5 = w1 ^ w4;
    w6 = w2 ^ w5;
    w7 = w3 ^ w6;
  
    out_g2 = function_g(w7, 4'd2);
    w8 = w4 ^ out_g2;
    w9 = w5 ^ w8;
    w10 = w6 ^ w9;
    w11 = w7 ^ w10;
  
    out_g3 = function_g(w11, 4'd3);
    w12 = w8 ^ out_g3;
    w13 = w9 ^ w12;
    w14 = w10 ^ w13;
    w15 = w11 ^ w14;
  
    out_g4 = function_g(w15, 4'd4);
    w16 = w12 ^ out_g4;
    w17 = w16 ^ w13;
    w18 = w17 ^ w14;
    w19 = w18 ^ w15;
  
    out_g5 = function_g(w19, 4'd5);
    w20 = w16 ^ out_g5;
    w21 = w20 ^ w17;
    w22 = w21 ^ w18;
    w23 = w22 ^ w19;
  
    out_g6 = function_g(w23, 4'd6);
    w24 = w20 ^ out_g6;
    w25 = w24 ^ w21;
    w26 = w22 ^ w25;
    w27 = w26 ^ w23;
  
    out_g7 = function_g(w27, 4'd7);
   w28 = w24 ^ out_g7;
    w29 = w28 ^ w25;
    w30 = w29 ^ w26;
    w31 = w30 ^ w27;
  
    out_g8 = function_g(w31, 4'd8);
    w32 = w28 ^ out_g8;
    w33 = w32 ^ w29;
    w34 = w33 ^ w30;
    w35 = w34 ^ w31;
  
    out_g9 = function_g(w35, 4'd9);
    w36 = w32 ^ out_g9;
    w37 = w33 ^ w36;
    w38 = w34 ^ w37;
    w39 = w38 ^ w35;
  
    out_g10 = function_g(w39, 4'd10);
    w40 = w36 ^ out_g10;
    w41 = w40 ^ w37;
    w42 = w41 ^ w38;
    w43 = w42 ^ w39;
  
    key_r0 = {w0, w1, w2, w3};
    key_r1 = {w4, w5, w6, w7};
    key_r2 = {w8, w9, w10, w11};
    key_r3 = {w12, w13, w14, w15};
    key_r4 = {w16, w17, w18, w19};
    key_r5 = {w20, w21, w22, w23};
    key_r6 = {w24, w25, w26, w27};
    key_r7 = {w28, w29, w30, w31};
    key_r8 = {w32, w33, w34, w35};
    key_r9 = {w36, w37, w38, w39};
    key_r10 = {w40, w41, w42, w43};
  end

endmodule
