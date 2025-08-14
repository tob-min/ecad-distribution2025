BINARY=../assembly/build/mem.txt

all: obj_dir/Vclarvi_sim

# rely on Verilator to perform an incremental build rather than the Makefile
./obj_dir/Vclarvi_sim:
	verilator -DSIMULATION -DLOADHEX=$(BINARY) -Wno-fatal -Wno-lint --binary clarvi_sim.sv

clean:
	rm -rf ./obj_dir
