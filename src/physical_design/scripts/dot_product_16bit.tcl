
# Read the verilog design files
read_verilog ../verilog/booth_16bit/rtl_v/partial_product_generator_16bit.v
read_verilog ../verilog/booth_16bit/rtl_v/sign_ext_shift_unit_16bit.v
read_verilog ../verilog/booth_16bit/rtl_v/partial_product_sgn_extd_shifter_wrapper.v
read_verilog ../verilog/booth_16bit/rtl_v/pprod_adders_wrapper.v
read_verilog ../verilog/booth_16bit/rtl_v/normalize_16bit.v
read_verilog ../verilog/booth_16bit/rtl_v/booth_multiplier_16bit.v
read_verilog ../verilog/common/rtl_v/twos_comp_11bit.v
read_verilog ../verilog/adder/rtl_v/align_and_add_16bit.v
read_verilog ../verilog/leading_zero_anticipator/rtl_v/nibble_local_count.v
read_verilog ../verilog/leading_zero_anticipator/rtl_v/boundary_nibble_encoder_16bit.v
read_verilog ../verilog/leading_zero_anticipator/rtl_v/boundary_nibble_encoder.v
read_verilog ../verilog/leading_zero_anticipator/rtl_v/leading_zeros_counter_16bit.v
read_verilog ../verilog/common/rtl_v/extract_mantissa_16bit.v
read_verilog ../verilog/leading_zero_anticipator/rtl_v/leading_zeros_counter.v
read_verilog ../verilog/booth_16bit/rtl_v/compute_mantissa_16bit.v
read_verilog ../verilog/dot_product/rtl_v/dot_product_16bit.v
# Create user defined variables 
set CLK_PORT [get_ports clk]
set CLK_PERIOD 5.00 
set CLK_SKEW 0.20

#set WC_OP_CONDS typ_0_1.98
#set WIRELOAD_MODEL 10KGATES
#fanout of 4
#set DRIVE_CELL buf1a4

#set DRIVE_PIN {Y}
#set MAX_OUTPUT_LOAD [load_of ssc_core/buf1a2/A]

#set INPUT_DELAY 2.0

#set OUTPUT_DELAY 0.5

set MAX_AREA 2000


# Time Budget 
create_clock -period $CLK_PERIOD -name my_clock $CLK_PORT
#set_dont_touch_network my_clock
set_clock_uncertainty $CLK_SKEW [get_clocks my_clock]

#set_input_delay $INPUT_DELAY -max -clock my_clock [remove_from_collection [all_inputs] $CLK_PORT]
#set_output_delay $OUTPUT_DELAY -max -clock my_clock [all_outputs]

#  Area Constraint
set_max_area $MAX_AREA

# Operating Environment 
#set_operating_conditions -max $WC_OP_CONDS
#set_wire_load_model -name $WIRELOAD_MODEL 


#set_driving_cell -cell $DRIVE_CELL -pin $DRIVE_PIN [remove_from_collection [all_inputs] $CLK_PORT]


#set_load  $MAX_OUTPUT_LOAD [all_outputs]
link
set_cost_priority -area
compile -area_effort high
report_area 
report_timing
report_power
quit
