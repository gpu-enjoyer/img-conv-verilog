
# get from img_to_mat.py:
#   D = ..
#   K = ..

VERILOG_SOURCES  = src/conv_1d.sv
TOPLEVEL         = conv_1d

COMPILE_ARGS     += -Pconv_1d.D=640
COMPILE_ARGS     += -Pconv_1d.K=3

MODULE           = src.mat_to_conv
SIM_BUILD        = sim_build

include $(shell uv run -- cocotb-config --makefiles)/Makefile.sim
