module flopenr #(parameter WIDTH=8)
            (input clk, 
            input rst,
            input en,
            input [WIDTH-1:0] d,
            output reg [WIDTH-1:0] q);

    always @(posedge clk) begin
        if (rst) begin
            q <= 0; // Reset output to zero on reset signal
        end else if (en) begin
            q <= d; // Capture input on clock edge
        end
    end
endmodule