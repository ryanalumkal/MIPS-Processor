module flopen #(parameter WIDTH=8)
            (input clk, 
            input en,
            input [WIDTH-1:0] d,
            output reg [WIDTH-1:0] q);

    always @(posedge clk) begin
        if (en) begin
            q <= d; // Capture input on clock edge
        end
    end
endmodule