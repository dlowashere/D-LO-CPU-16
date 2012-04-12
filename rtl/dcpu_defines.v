
//=======================================
// Op codes
//=======================================
`define OP_NONBASIC 4'h0
`define OP_SET      4'h1
// Arithmetic
`define OP_ADD      4'h2
`define OP_SUB      4'h3
`define OP_MUL      4'h4
`define OP_DIV      4'h5
`define OP_MOD      4'h6
// Logical
`define OP_SHL      4'h7
`define OP_SHR      4'h8
`define OP_AND      4'h9
`define OP_BOR      4'ha
`define OP_XOR      4'hb
// Control flow
`define OP_IFE      4'hc // a == b
`define OP_IFN      4'hd // a != b
`define OP_IFG      4'he // a > b
`define OP_IFB      4'hf // (a & b) != 0

//===========================================
// Values/Operands
//===========================================
// Registers
`define V_A        6'h00
`define V_B        6'h01
`define V_C        6'h02
`define V_X        6'h03
`define V_Y        6'h04
`define V_Z        6'h05
`define V_I        6'h06
`define V_J        6'h07
// Register addressed ([register])
`define V_A_ADDR   6'h08
`define V_B_ADDR   6'h09
`define V_C_ADDR   6'h0a
`define V_X_ADDR   6'h0b
`define V_Y_ADDR   6'h0c
`define V_Z_ADDR   6'h0d
`define V_I_ADDR   6'h0e
`define V_J_ADDR   6'h0f
// [next word + registers]
`define V_A_ADDR_W 6'h10
`define V_B_ADDR_W 7'h11
`define V_C_ADDR_W 6'h12
`define V_X_ADDR_W 6'h13
`define V_Y_ADDR_W 6'h14
`define V_Z_ADDR_W 6'h15
`define V_I_ADDR_W 6'h16
`define V_J_ADDR_W 6'h17
// Stack
`define V_POP      6'h18 // [SP++]
`define V_PEEK     6'h19 // [SP]
`define V_PUSH     6'h1a // [--SP]
`define V_SP       6'h1b
// Other registers
`define V_PC       6'h1c
`define V_O        6'h1d
// Word addressed
`define V_ADDR_W   6'h1e // [next word]
`define V_IMM      6'h1f // next word literal

