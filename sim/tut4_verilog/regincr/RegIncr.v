//========================================================================
// Registered Incrementer
//========================================================================
// This is a simple example of a module for a registered incrementer
// which combines a positive edge triggered register with a combinational
// +2 incrementer. We use flat register-transfer-level modeling.

`ifndef TUT4_VERILOG_REGINCR_REG_INCR_V
`define TUT4_VERILOG_REGINCR_REG_INCR_V

`include "vc/trace.v"

module tut4_verilog_regincr_RegIncr
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in,
  output logic [7:0] out
);

  // Sequential logic

  logic [7:0] reg_out;
  always_ff @( posedge clk )
    if ( reset )
      reg_out <= '0;
    else
      reg_out <= in;

  // ''' TUTORIAL TASK '''''''''''''''''''''''''''''''''''''''''''''''''''
  // This model is incomplete. As part of the tutorial you will add a
  // combinational logic to model the incrementer logic.
  // '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

endmodule

`endif /* TUT4_VERILOG_REGINCR_REG_INCR_V */

