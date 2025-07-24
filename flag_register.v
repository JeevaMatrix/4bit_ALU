module flag_register(
    input clk, reset,
    input update,
    input zero_in, negative_in, carry_in, overflow_in,
    output reg zero, negative, carry, overflow 
);

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            zero <= 0;
            negative <= 0;
            carry <= 0;
            overflow <= 0;
        end
        else if(update) begin
            zero <= zero_in;
            negative <= negative_in;
            carry <= carry_in;
            overflow <= overflow_in;
        end
    end
endmodule