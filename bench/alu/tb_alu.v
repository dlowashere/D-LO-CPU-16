`timescale 1 ns/100 ps

`include "../../rtl/dcpu_defines.v"

module tb_alu;

// Clock
reg clk;
// Active low reset
reg rst_n;
// Inputs
reg [3:0]  opcode;
reg [15:0] a;
reg [15:0] b;
// Outputs
wire [15:0] result;
wire [15:0] overflow;

// Instantiate ALU
dcpu_alu alu0(
  .opcode(opcode),
  .a(a),
  .b(b),
  .result(result),
  .overflow(overflow)
);

// ALU test vectors
initial begin
  #50;
  opcode = `OP_ADD;
  a = 3;
  b = 5;
  #50;
  opcode = `OP_SET;
  #50;
  opcode = `OP_SUB;
  #50;
  a <= 16'hffff;
  b <= 16'hffff;
  opcode <= `OP_ADD;
  #50;
  opcode <= `OP_SUB;
end

// Clock
initial begin
  clk = 1'b0;
  forever #50 clk <= ~clk;
end
// Reset
initial begin
  rst_n = 1'b1;
  #300;
  rst_n = 1'b0;
  #300;
  rst_n = 1'b1;
end
// Terminate
initial begin
  #10000;
  $finish;
end

// Generate waveforms
initial begin
  $dumpfile("tb_alu.vcd");
  $dumpvars(0, tb_alu);
end

endmodule
