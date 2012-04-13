`timescale 1 ns/100 ps

module tb_DCPU16;

// Clock
reg clk;
// Active low reset
reg rst_n;
// RAM interface
wire [15:0] ram_addr;
wire [15:0] ram_dout;


// Instantiate DCPU-16
DCPU16 core0(
  .rst_n (rst_n),
  .clk   (clk),
  .ram_addr (ram_addr),
  .ram_dout (ram_dout)
);
// RAM
ram ram0(
  .ram_addr(ram_addr),
  .ram_dout(ram_dout)
);

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
  $dumpfile("tb_DCPU16.vcd");
  $dumpvars(0, tb_DCPU16);
end

endmodule
