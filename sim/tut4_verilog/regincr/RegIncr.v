//========================================================================
// Registered Incrementer
//========================================================================
// This is a simple example of a module for a registered incrementer
// which combines a positive edge triggered register with a combinational
// +2 incrementer. We use flat register-transfer-level modeling.

`ifndef TUT4_VERILOG_REGINCR_REG_INCR_V
`define TUT4_VERILOG_REGINCR_REG_INCR_V

module tut4_verilog_regincr_RegIncr
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in,
  output logic [7:0] out
);

  // Sequential logic

  logic [7:0] reg_out;
  always @( posedge clk ) begin
    if ( reset )
      reg_out <= 0;
    else
      reg_out <= in;
  end

  // Combinational logic

  logic[7:0] inc_out;
  always @(*) begin
    inc_out = reg_out + 1;
  end

  assign out = inc_out;

endmodule

`endif /* TUT4_VERILOG_REGINCR_REG_INCR_V */