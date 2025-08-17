module flop #(parameter WIDTH=8)
            (input clk, 
            input [WIDTH-1:0] d,
            output reg [WIDTH-1:0] q);

    always @(posedge clk) begin
        q <= d; // Capture input on clock edge
    end

endmodule