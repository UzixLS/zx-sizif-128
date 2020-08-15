export PATH:=/opt/modelsim201/modelsim_ase/bin:/cygdrive/c/Hwdev/modelsim181/modelsim_ase/win32aloem:/cygdrive/c/Hwdev/iverilog/bin/:${PATH}

all: testbench_zx_ula

testbench_zx_ula: VSIMFLAGS+=+nowarn3722 +nowarn8822 +nowarn3017 +nowarn3155
testbench_zx_ula: V=$@.v ../cpld/chroma_gen16.vhd

testbench_memcontroller: V=testbench_memcontroller.v

xtestbench_%:
	iverilog -g2005-sv ${IVFLAGS} -o $@.vvp ${V}
	vvp $@.vvp
	@rm $@.vvp

testbench_%:
	test ! -d work || rm -rf work
	vlib work
	test ! -n "$(filter %.v,${V})" || vlog -quiet -sv $(filter %.v,${V})
	test ! -n "$(filter %.vhd %.vhdl,${V})" || vcom -quiet $(filter %.vhd %.vhdl,${V})
	vsim ${VSIMFLAGS} -batch -quiet -do 'run -all' $@
	test ! -r transcript || rm transcript

clean:
	rm -rf ivl_vhdl_work/ work/ *.bin *.mem *.vcd

-include Makefile.local
