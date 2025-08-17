module zerodetect #(parameter WIDTH=8)
            (input [WIDTH-1:0] a,
            output reg zero);

    always @(*) begin
        if (a == 0) begin
            zero <= 1; // Set zero flag if input is zero
        end else begin
            zero <= 0; // Clear zero flag otherwise
        end
    end
endmodule