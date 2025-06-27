// For PC
//works
module Adder (input [5:0] DataIn1,
                input [5:0] DataIn2,
                output reg [5:0] DataOut);

    always @(*) begin
        DataOut <= DataIn1 + DataIn2;
    end

endmodule