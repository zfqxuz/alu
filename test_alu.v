`include "alu.v"
module alu_test;//(instruction, regA,regB,result,flag,clock);
reg [31:0] instruction,regA,regB;
wire [31:0] result;
wire [2:0] flags;

initial begin
        $monitor("regA=%b,regB=%B,result=%b,flags=%b",regA,regB,result,flags);
        $display ("test bitwise operation");
        regA=32'b11111111;
        regB=32'b10100000;
        instruction=   32'b00000000001000000000000000100100;
        #5 instruction=32'b00000000001000000000000000100101;
        #5 instruction=32'b00000000001000000000000000100110;
        #5 instruction=32'b00000000001000000000000000100111;
        #5 $display ("test register arithmetic operation");
        #5 regA=       32'b10000000000000000000000000000001;
        regB=32'b10000000000000000000000000000010;
        instruction=32'b00000000001000000000000000100000;
        #5 instruction=32'b00000000001000000000000000100001;
        #5 instruction=32'b00000000001000000000000000100010;
        #5 instruction=32'b00000000001000000000000000100011;
        #5 instruction=32'b00000000000000010000000000101010;
        #5 instruction=32'b00000000000000010000000000101011;
        #5 $display ("test register shift operation");
        #5 regA=       32'b11100000000000000000000000000111;
        regB=2;
        instruction=   32'b00000000000000000000000001000000;
        #5 instruction=32'b00000000000000000000000001000010;
        #5 instruction=32'b00000000000000000000000001000011;
        #5 instruction=32'b00000000001000000000000000000100;
        #5 instruction=32'b00000000001000000000000000000110;
        #5 instruction=32'b00000000001000000000000000000111;
        #5 $display("test immediate number operation");
        #5 regA=       32'b10000000000000000000000000000001;
        instruction=   32'b00100000000000001000000000000001;
        #5 instruction=32'b00100100000000001000000000000001;
        #5 instruction=32'b00101000000000001000000000000001;
        #5 instruction=32'b00101100000000001000000000000001;
        #5 instruction=32'b10001100000000001000000000000001;
        regA=32'b11;
        #5 instruction=32'b10101100000000001000000000000001;
        #5 $display("test branc operation");
        #5 regA=123;
        regB=123;
        instruction=   32'b00010000000000001000000000000001;
        instruction=   32'b00010100000000001000000000000001;
        #5 $finish;
    end
alu ALU(instruction, regA,regB,result,flags);
endmodule

