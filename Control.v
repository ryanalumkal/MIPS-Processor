module Control(input [5:0] OpCode,
                input[5:0] Func,
                output reg [2:0] ALUOp,
                output reg RegWrite);
    //
    always @ (*) begin
        case (OpCode)
            0: begin
                case (Func)
                    36: begin //AND
                        RegWrite = 1'b1;
                        ALUOp = 3'b000;
                    
                    end
                    37: begin //OR
                        RegWrite = 1'b1;
                        ALUOp = 3'b001;
                    
                    end
                    32: begin //ADD
                        RegWrite = 1'b1;
                        ALUOp = 3'b010;
                    
                    end
                    34: begin //SUB
                        RegWrite = 1'b1;
                        ALUOp = 3'b110;
                    
                    end
                    42: begin //SLT
                        RegWrite = 1'b1;
                        ALUOp = 3'b111;
                    end
                endcase
            end
        endcase
    end

endmodule