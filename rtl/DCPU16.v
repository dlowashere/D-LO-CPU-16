

module DCPU16 (
  rst_n,  // Active low reset
  clk,    // Clock

  // RAM interface
  ram_addr, // Address to RAM
  ram_dout  // Data from RAM
);

// Inputs
input rst_n; // Active low reset
input clk;   // Clock
// RAM interface
output [15:0] ram_addr; // Address to RAM
input  [15:0] ram_dout; // Data from RAM

// Register file {A, B, C, X, Y, Z, I, J}
reg [15:0] A;
reg [15:0] B;
reg [15:0] C;
reg [15:0] X;
reg [15:0] Y;
reg [15:0] Z;
reg [15:0] I;
reg [15:0] J;
// Program counter
reg [15:0] PC;
// Stack pointer
reg [15:0] SP;
// Overflow
reg [15:0] O;

//========================================
// Instruction decode
//========================================
wire [5:0] inst_b;
wire [5:0] inst_a;
wire [3:0] inst_o;

// Separate out parts of instruction

//========================================
// RAM interface
//========================================
assign ram_addr = PC;

//========================================
// Synchronous Logic
//========================================
always @(posedge clk or negedge rst_n) begin
  // Asynchronous reset
  if (~rst_n) begin
    // Reset program counter to bottom of memory
    PC = 16'h0;
    // Reset stack pointer to top of memory
    SP = 16'hffff;
    // Reset registers
    A = 16'h0;
    B = 16'h0;
    C = 16'h0;
    X = 16'h0;
    Y = 16'h0;
    Z = 16'h0;
    I = 16'h0;
    J = 16'h0;
    O = 16'h0;

  // Not reset (posedge clk)
  end else begin
    // Advance program counter
    PC <= PC + 1;
  end
end

endmodule
