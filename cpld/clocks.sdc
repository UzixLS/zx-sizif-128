create_clock -period 14.4MHz -name {clk_14mhz} [get_ports {clk14}]
create_clock -period 32.1MHz -name {clk_pal} [get_ports {clkpal}]

create_generated_clock -name {clkcpu} -divide_by 4 -source [get_ports {clk14}] [get_registers {hc0[1]}]
create_generated_clock -name {n_int} -divide_by 64 -source [get_ports {clk14}] [get_registers {n_int~reg0}]
create_generated_clock -name {hsync1} -divide_by 64 -source [get_ports {clk14}] [get_registers {hsync1}]
create_generated_clock -name {chroma_carrier} -divide_by 6 -source [get_ports {clkpal}] [get_registers {chroma_gen:*|carrier[16]}]

# All these transitions happens when carrier is inactive, so no any glitches will be visible
set_false_path -from [get_registers {chroma_gen:*|burst_cnt[3]}] -to [get_registers {chroma_gen:*|out_carrier}]
set_false_path -from [get_registers {chroma_gen:*|oddeven}] -to [get_registers {chroma_gen:*|out_carrier}]
set_false_path -from [get_registers {hsync1}] -to [get_registers {chroma_gen:*|burst_cnt[*]}]

set_false_path -from [get_registers {r~reg0}] -to [get_registers {chroma_gen:*}]
set_false_path -from [get_registers {g~reg0}] -to [get_registers {chroma_gen:*}]
set_false_path -from [get_registers {b~reg0}] -to [get_registers {chroma_gen:*}]
set_false_path -from [get_registers {i~reg0}] -to [get_registers {chroma_gen:*}]
