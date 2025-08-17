module mux4 #(parameter WIDTH=8)
            (input [WIDTH-1:0] a, 
            input [WIDTH-1:0] b,
            input [WIDTH-1:0] c,
            input [WIDTH-1:0] d,
            input [1:0] sel,
            output reg [WIDTH-1:0] y);
    always @(*) begin
        case (sel)
            2'b00: y = a; // Select input a
            2'b01: y = b; // Select input b
            2'b10: y = c; // Select input c
            2'b11: y = d; // Select input d
            default: y = 0;
        endcase
    end
endmodule