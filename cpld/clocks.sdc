create_clock -period 14.4MHz -name {clk_14mhz} [get_ports {clk14}]
create_clock -period 16MHz -name {clk_16mhz} [get_ports {clk16}]

# clkcpu 3.5
create_generated_clock -name {clkcpu} -divide_by 4 -source [get_ports {clk14}] [get_registers {hc0[1]}]

# int len in turbo = 66
create_generated_clock -name {n_int} -divide_by 64 -source [get_ports {clk14}] [get_registers {n_int~reg0}]

# chroma carrier
create_generated_clock -name {chroma_carrier} -divide_by 6 -source [get_ports {clk16}] [get_registers {*:chroma_gen1|carrier[14]}]

set_false_path -from [get_registers {r~reg0}] -to [get_clocks {clk_16mhz}]
set_false_path -from [get_registers {g~reg0}] -to [get_clocks {clk_16mhz}]
set_false_path -from [get_registers {b~reg0}] -to [get_clocks {clk_16mhz}]
set_false_path -from [get_registers {hsync1}] -to [get_clocks {chroma_carrier}]
