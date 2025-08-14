RISCV_BINARY=$(shell pwd)/../assembly/build/mem.txt

# rely on Verilator to perform an incremental build rather than the Makefile
all:
	verilator -DTRACE -DSIMULATION -DRISCV_BINARY=\"$(RISCV_BINARY)\" -Wno-fatal -Wno-lint --binary clarvi_sim.sv

clean:
	rm -rf ./obj_dir
