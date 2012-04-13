`include "dcpu_defines.v"

module dcpu_alu(
  // Inputs
  opcode,
  a,
  b,
  // Outputs
  result,
  overflow
);

// Inputs
input [3:0]  opcode;
input [15:0] a; // First decoded operand
input [15:0] b; // Second decoded operand

// Outputs
output reg [15:0] result;
output reg [15:0] overflow;


// Compute result
always @(opcode, a, b) begin
  overflow = 0; // Default overflow of 0
  case(opcode)
    `OP_SET: begin
      result <= b;
    end

    // Arithmetic
    `OP_ADD: begin
      result <= a + b;
      // Detect overflow
      if ((~a[15] & ~b[15] & result[15]) | (a[15] & b[15] & ~result[15]))
      begin
        overflow = 16'h0001;
      end
    end
    `OP_SUB: begin
      result <= a - b;
      // Detect overflow
      if ((a[15] & ~b[15] & ~result[15]) | (~a[15] & b[15] & result[15]))
      begin
        overflow = 16'hffff;
      end
    end
     

    default: begin
      result <= 0;
    end
  endcase
end

endmodule
