
module ram(
  // Inputs
  ram_addr,   // Address

  // Outputs
  ram_dout    // Data output
);

input [15:0] ram_addr; // Address

output [15:0] ram_dout; // Data output
reg    [15:0] ram_dout;

// Memory array
`define MEM_SIZE 65535
reg [15:0] mem [0:`MEM_SIZE];

// Output data
always @(ram_addr) begin
  case(ram_addr)
    16'h0000: ram_dout <= 16'ha861;
    16'h0001: ram_dout <= 16'h8463;
    default: ram_dout <= 16'h0;
  endcase
end


endmodule
