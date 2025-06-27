//works
module ALU (input [31:0] A,
				input [31:0] B,
				input [3:0] ALUOp,
				output reg overflow,
				output reg zero, 
				output reg [31:0] result);
		
		always @(*) begin
			case (ALUOp)
				4'b0000 : result = A & B; //works
				4'b0001 : result = A | B; //works
				4'b0010 : result = A + B; //works
				4'b0110 : result = A - B; //works
				4'b0111 : result = (A < B) ? 1 : 0; //works
				4'b1100 : result = ~(A | B); //works
			endcase
			
			zero = (result == 0);
			
		end
		
	// check for overflow

endmodule