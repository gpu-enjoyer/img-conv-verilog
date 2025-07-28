
MAKEFLAGS += -s

b = build

all: clear build run

clear:
	rm -rf $(b)

build:
	mkdir $(b)
	iverilog -s conv_1d code/conv_1d.sv -g2012 -o $(b)/conv_1d

run:
	$(b)/conv_1d
