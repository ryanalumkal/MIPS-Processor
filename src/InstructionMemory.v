`timescale 1ns/1ps
module InstructionMemory (input [5:0] ReadAddress,
                            output reg [31:0] Instruction);

    always @ (*) begin
        case (ReadAddress)
                6'h00: Instruction = 32'h012A4020; // add 8, 9, 10
                //6'h01: Instruction = 32'h02538822; // sub 17, 18, 19
                6'h01: Instruction = 32'h01084020; // add 8, 8, 8
                6'h02: Instruction = 32'h00A62024; // and 4, 5, 6
                6'h03: Instruction = 32'h019D5825; // or 11, 12, 13
                6'h04: Instruction = 32'h00000000;
                6'h05: Instruction = 32'h00000000;
                6'h06: Instruction = 32'h00000000;
                6'h07: Instruction = 32'h00000000;
                6'h08: Instruction = 32'h00000000;
                6'h09: Instruction = 32'h00000000;
                6'h0A: Instruction = 32'h00000000;
                6'h0B: Instruction = 32'h00000000;
                6'h0C: Instruction = 32'h00000000;
                6'h0D: Instruction = 32'h00000000;
                6'h0E: Instruction = 32'h00000000;
                6'h0F: Instruction = 32'h00000000;
                6'h10: Instruction = 32'h00000000;
                6'h11: Instruction = 32'h00000000;
                6'h12: Instruction = 32'h00000000;
                6'h13: Instruction = 32'h00000000;
                6'h14: Instruction = 32'h00000000;
                6'h15: Instruction = 32'h00000000;
                6'h16: Instruction = 32'h00000000;
                6'h17: Instruction = 32'h00000000;
                6'h18: Instruction = 32'h00000000;
                6'h19: Instruction = 32'h00000000;
                6'h1A: Instruction = 32'h00000000;
                6'h1B: Instruction = 32'h00000000;
                6'h1C: Instruction = 32'h00000000;
                6'h1D: Instruction = 32'h00000000;
                6'h1E: Instruction = 32'h00000000;
                6'h1F: Instruction = 32'h00000000;
                6'h20: Instruction = 32'h00000000;
                6'h21: Instruction = 32'h00000000;
                6'h22: Instruction = 32'h00000000;
                6'h23: Instruction = 32'h00000000;
                6'h24: Instruction = 32'h00000000;
                6'h25: Instruction = 32'h00000000;
                6'h26: Instruction = 32'h00000000;
                6'h27: Instruction = 32'h00000000;
                6'h28: Instruction = 32'h00000000;
                6'h29: Instruction = 32'h00000000;
                6'h2A: Instruction = 32'h00000000;
                6'h2B: Instruction = 32'h00000000;
                6'h2C: Instruction = 32'h00000000;
                6'h2D: Instruction = 32'h00000000;
                6'h2E: Instruction = 32'h00000000;
                6'h2F: Instruction = 32'h00000000;
                6'h30: Instruction = 32'h00000000;
                6'h31: Instruction = 32'h00000000;
                6'h32: Instruction = 32'h00000000;
                6'h33: Instruction = 32'h00000000;
                6'h34: Instruction = 32'h00000000;
                6'h35: Instruction = 32'h00000000;
                6'h36: Instruction = 32'h00000000;
                6'h37: Instruction = 32'h00000000;
                6'h38: Instruction = 32'h00000000;
                6'h39: Instruction = 32'h00000000;
                6'h3A: Instruction = 32'h00000000;
                6'h3B: Instruction = 32'h00000000;
                6'h3C: Instruction = 32'h00000000;
                6'h3D: Instruction = 32'h00000000;
                6'h3E: Instruction = 32'h00000000;
                6'h3F: Instruction = 32'h00000000;
        endcase
    end

endmodule
