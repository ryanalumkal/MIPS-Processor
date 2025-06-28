`timescale 1ns/1ps
module ALU (input [31:0] A,
				input [31:0] B,
				input [2:0] ALUOp,
				output reg overflow,
				output reg zero, 
				output reg [31:0] result);
		
		always @(*) begin
			case (ALUOp)
				3'b000 : result = A & B; //works
				3'b001 : result = A | B; //works
				3'b010 : result = A + B; //works
				3'b110 : result = A - B; //works
				3'b111 : result = (A < B) ? 1 : 0; //works
			endcase
			
			zero = (result == 0);
			
		end
		
	// check for overflow

endmodule