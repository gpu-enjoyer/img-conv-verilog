
MAKEFLAGS += -s

all: clean install run

clean:
	rm -rf sim_build
	rm -rf src/__pycache__
	rm -f  results.xml
	rm -f  conf/mat_to_conv_input.bin


install:
	[ -d .venv ] || \
	uv venv && \
	uv pip install -r conf/depend.txt

run:
	. .venv/bin/activate && \
	python3 src/img_to_mat.py img/input.png && \
	$(MAKE) -f conf/cocotb.mk

uninstall: clean
	rm -rf .venv
