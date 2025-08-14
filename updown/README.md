# Up/Down Counter tick

This directory contains the following files:
 * `updowncounter.sv` - a template for the up/down counter tick
 * `tb_updowncounter.sv` - a simple tester that exercises the `up` input and displays the `count` output for a human to check

You can simulate and debug your design on the Moodle system, but if you can simulate locally as follows:
  * Compile the simulation:
    `verilator --binary tb_updowncounter.sv`  
  * Run the compiled simulation:
    `./obj_dir/Vtb_updowncounter`
