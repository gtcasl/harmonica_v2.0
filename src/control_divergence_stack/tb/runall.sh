vcs -sverilog +v2k random_control_divergence_test.sv ../rtl/control_divergence_stack.v ../rtl/stack.v
./simv 
vcs -sverilog +v2k ../rtl/control_divergence_stack.v ../rtl/stack.v random_stack_test.sv
./simv
