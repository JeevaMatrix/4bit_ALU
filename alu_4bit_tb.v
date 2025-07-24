`timescale 1ns/1ns
`include "alu_4bit.v"
`include "flag_register.v"

module alu_4bit_tb;

    reg [3:0] a, b, opcode;
    wire [3:0] ALU_out;
    wire zero_i, negative_i, carry_i, overflow_i;
    wire zero, negative, carry, overflow;
    reg clk, reset, update, enable;

    alu_4bit DUT(.a(a), .b(b), .opcode(opcode), .enable(enable), .ALU_out(ALU_out), .zero(zero_i), 
                .negative(negative_i), .carry(carry_i), .overflow(overflow_i));


    flag_register FR_inst(.clk(clk), .reset(reset), .update(update),
                         .zero_in(zero_i), .negative_in(negative_i), .carry_in(carry_i), .overflow_in(overflow_i),
                        .zero(zero), .negative(negative), .carry(carry), .overflow(overflow));
                        
    always #5 clk = ~clk;

    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, alu_4bit_tb);

        clk = 0; reset = 1; update = 0; enable = 0;
        #10 reset = 0;

        // ADD
        a = 4'b0011; b = 4'b0100; opcode = 4'b0000;
        enable = 1; update = 1; #10; update = 0;
        $display("ADD: %d + %d = %d | Z=%b N=%b C=%b V=%b", a, b, ALU_out, zero, negative, carry, overflow);

        // SUB
        a = 4'b0101; b = 4'b0011; opcode = 4'b0001;
        update = 1; #10; update = 0;
        $display("SUB: %d - %d = %d | Z=%b N=%b C=%b V=%b", a, b, ALU_out, zero, negative, carry, overflow);

        // AND
        a = 4'b1100; b = 4'b1010; opcode = 4'b0100;
        update = 1; #10; update = 0;
        $display("AND: %b & %b = %b", a, b, ALU_out);

        // OR
        a = 4'b1100; b = 4'b1010; opcode = 4'b0101;
        update = 1; #10; update = 0;
        $display("OR: %b | %b = %b", a, b, ALU_out);

        // SLL
        a = 4'b1001; b = 4'b0000; opcode = 4'b1000;
        update = 1; #10; update = 0;
        $display("SLL: %b << 1 = %b", a, ALU_out);

        // SRL
        a = 4'b1001; b = 4'b0000; opcode = 4'b1001;
        update = 1; #10; update = 0;
        $display("SRL: %b >> 1 = %b", a, ALU_out);

        // SRA
        a = 4'b1001; b = 4'b0000; opcode = 4'b1010;
        update = 1; #10; update = 0;
        $display("SRA: %b >>> 1 = %b", a, ALU_out);

        $finish;
    end

endmodule
