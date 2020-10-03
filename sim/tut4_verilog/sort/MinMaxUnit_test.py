#=========================================================================
# MinMaxUnit_test
#=========================================================================

from pymtl   import *
from MinMaxUnit import MinMaxUnit

# In py.test, unit tests are simply functions that begin with a "test_"
# prefix. PyMTL is setup to simplify dumping VCD. Simply specify
# "dump_vcd" as an argument to your unit test, and then you can dump VCD
# with the --dump-vcd option to py.test.

def test_basic( dump_vcd ):

  # Elaborate the model

  model = MinMaxUnit(8)
  model.vcd_file = dump_vcd
  model.elaborate()

  # Create and reset simulator

  sim = SimulationTool( model )
  sim.reset()
  print ""

  # Helper function

  def t( in0, in1, out0, out1 ):

    # Write input value to input port

    model.in0.value = in0
    model.in1.value = in1

    # Ensure that all combinational concurrent blocks are called

    sim.eval_combinational()

    # Display a line trace

    sim.print_line_trace()

    # Verify value read from output port

    assert model.out_min == out0 and model.out_max == out1

    # Tick simulator one cycle

    sim.cycle()

  # Cycle-by-cycle tests

  t( 0x00, 0x01, 0x00, 0x01 )
  t( 0x01, 0x00, 0x00, 0x01 )
  t( 0x01, 0x01, 0x01, 0x01 )
  t( 0x11, 0x08, 0x08, 0x11 )
  t( 0xff, 0xfe, 0xfe, 0xff )
