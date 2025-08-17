module alu #(parameter WIDTH=8)
            (input [WIDTH-1:0] a,
            input [WIDTH-1:0] b,
            input [2:0] alucont,
            output reg [WIDTH-1:0] result);

    wire [WIDTH-1:0] b2, sum, slt;

    assign b2 = alucont[2] ? ~b : b; // If ALU control bit 2 is set, use two's complement of b
    assign sum = a + b2; // Perform addition or subtraction based on ALU control
    assign slt = sum[WIDTH-1]; // Set SLT to the MSB of the sum

    always @(*) begin
        case (alucont)
            2'b00: result <= a & b; // AND operation
            2'b01: result <= a | b; // OR operation
            2'b10: result <= sum; // ADD or SUB operation
            2'b11: result <= slt; // Set Less Than operation
        endcase
    end
endmodule