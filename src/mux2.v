module mux2 #(parameter WIDTH=8)
            (input [WIDTH-1:0] a, 
            input [WIDTH-1:0] b,
            input sel,
            output reg [WIDTH-1:0] y);

    always @(*) begin
        if (sel) begin
            y = b; // Select input b when sel is high
        end else begin
            y = a; // Select input a when sel is low
        end
    end