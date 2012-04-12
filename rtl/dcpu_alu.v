

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
always @(op_code, a, b) begin
  case(op_code)

    default: begin
      result <= 0;
      overflow <= 0;
    end
  endcase
end

endmodule
