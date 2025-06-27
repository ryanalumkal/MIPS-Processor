//works?
module InstructionMemory (input [5:0] ReadAddress,
                            output reg [31:0] Instruction);

    always @ (*) begin
        case (ReadAddress)
                6'h00: InstructionAddress = 32'h00000000;
                6'h01: InstructionAddress = 32'h00000000;
                6'h02: InstructionAddress = 32'h00000000;
                6'h03: InstructionAddress = 32'h00000000;
                6'h04: InstructionAddress = 32'h00000000;
                6'h05: InstructionAddress = 32'h00000000;
                6'h06: InstructionAddress = 32'h00000000;
                6'h07: InstructionAddress = 32'h00000000;
                6'h08: InstructionAddress = 32'h00000000;
                6'h09: InstructionAddress = 32'h00000000;
                6'h0A: InstructionAddress = 32'h00000000;
                6'h0B: InstructionAddress = 32'h00000000;
                6'h0C: InstructionAddress = 32'h00000000;
                6'h0D: InstructionAddress = 32'h00000000;
                6'h0E: InstructionAddress = 32'h00000000;
                6'h0F: InstructionAddress = 32'h00000000;
                6'h10: InstructionAddress = 32'h00000000;
                6'h11: InstructionAddress = 32'h00000000;
                6'h12: InstructionAddress = 32'h00000000;
                6'h13: InstructionAddress = 32'h00000000;
                6'h14: InstructionAddress = 32'h00000000;
                6'h15: InstructionAddress = 32'h00000000;
                6'h16: InstructionAddress = 32'h00000000;
                6'h17: InstructionAddress = 32'h00000000;
                6'h18: InstructionAddress = 32'h00000000;
                6'h19: InstructionAddress = 32'h00000000;
                6'h1A: InstructionAddress = 32'h00000000;
                6'h1B: InstructionAddress = 32'h00000000;
                6'h1C: InstructionAddress = 32'h00000000;
                6'h1D: InstructionAddress = 32'h00000000;
                6'h1E: InstructionAddress = 32'h00000000;
                6'h1F: InstructionAddress = 32'h00000000;
                6'h20: InstructionAddress = 32'h00000000;
                6'h21: InstructionAddress = 32'h00000000;
                6'h22: InstructionAddress = 32'h00000000;
                6'h23: InstructionAddress = 32'h00000000;
                6'h24: InstructionAddress = 32'h00000000;
                6'h25: InstructionAddress = 32'h00000000;
                6'h26: InstructionAddress = 32'h00000000;
                6'h27: InstructionAddress = 32'h00000000;
                6'h28: InstructionAddress = 32'h00000000;
                6'h29: InstructionAddress = 32'h00000000;
                6'h2A: InstructionAddress = 32'h00000000;
                6'h2B: InstructionAddress = 32'h00000000;
                6'h2C: InstructionAddress = 32'h00000000;
                6'h2D: InstructionAddress = 32'h00000000;
                6'h2E: InstructionAddress = 32'h00000000;
                6'h2F: InstructionAddress = 32'h00000000;
                6'h30: InstructionAddress = 32'h00000000;
                6'h31: InstructionAddress = 32'h00000000;
                6'h32: InstructionAddress = 32'h00000000;
                6'h33: InstructionAddress = 32'h00000000;
                6'h34: InstructionAddress = 32'h00000000;
                6'h35: InstructionAddress = 32'h00000000;
                6'h36: InstructionAddress = 32'h00000000;
                6'h37: InstructionAddress = 32'h00000000;
                6'h38: InstructionAddress = 32'h00000000;
                6'h39: InstructionAddress = 32'h00000000;
                6'h3A: InstructionAddress = 32'h00000000;
                6'h3B: InstructionAddress = 32'h00000000;
                6'h3C: InstructionAddress = 32'h00000000;
                6'h3D: InstructionAddress = 32'h00000000;
                6'h3E: InstructionAddress = 32'h00000000;
                6'h3F: InstructionAddress = 32'h00000000;
        endcase
    end

endmodule
