//========================================================================
// MinMaxUnit
//========================================================================
// This module takes two inputs, compares them, and outputs the larger
// via the "max" output port and the smaller via the "min" output port.

`ifndef TUT4_VERILOG_SORT_MIN_MAX_UNIT_V
`define TUT4_VERILOG_SORT_MIN_MAX_UNIT_V

module tut4_verilog_sort_MinMaxUnit
#(
  parameter p_nbits = 1
)(
  input  logic [p_nbits-1:0] in0,
  input  logic [p_nbits-1:0] in1,
  output logic [p_nbits-1:0] out_min,
  output logic [p_nbits-1:0] out_max
);

  logic [p_nbits-1:0] min_out;
  logic [p_nbits-1:0] max_out;
  
  always_comb begin
    if (in0 <= in1) begin
      min_out = in0;
      max_out = in1;
    end
    else begin
      min_out = in1;
      max_out = in0;
    end
  end

  assign out_min = min_out;
  assign out_max = max_out;

endmodule

`endif /* TUT4_VERILOG_SORT_MIN_MAX_UNIT_V */

