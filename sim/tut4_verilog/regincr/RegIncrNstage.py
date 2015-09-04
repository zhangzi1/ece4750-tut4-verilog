#=========================================================================
# RegIncrNstage
#=========================================================================

from pymtl import *

class RegIncrNstage( VerilogModel ):

  # Verilog module setup

  vprefix = "tut4_verilog_regincr"

  # Constructor

  def __init__( s, nstages=2 ):

    # Port-based interface

    s.in_ = InPort  ( Bits(8) )
    s.out = OutPort ( Bits(8) )

    # Verilog parameters

    s.set_params({
      'p_nstages' : nstages,
    })

    # Verilog ports

    s.set_ports({
      'clk'   : s.clk,
      'reset' : s.reset,
      'in'    : s.in_,
      'out'   : s.out,
    })

  # Line tracing

  def line_trace( s ):
    return "{} () {}".format( s.in_, s.out )

