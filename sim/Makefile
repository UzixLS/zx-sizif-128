VERILATOR ?= verilator
JOBS ?= 4
SDL_CFLAGS = $(shell pkg-config --cflags sdl3)
SDL_LIBS = $(shell pkg-config --libs-only-L --libs-only-l sdl3)
EXEEXT := $(if $(filter Windows_NT,$(OS)),.exe,)
RTL := silicon.vlt sizif.v ../cpld/top.v ../cpld/chroma_gen.v \
       vendor/z80-silicon-rtl/Z80.v vendor/z80-silicon-rtl/Registers.v vendor/z80-silicon-rtl/Register_selector.v

.PHONY: all build run test lint clean
all: build

build: obj_dir/Vsizif$(EXEEXT)

# Changes to build flags must also rebuild cached model/runtime objects.
obj_dir/Vsizif$(EXEEXT): $(RTL) main.cpp frontend.cpp frontend.h Makefile
	$(VERILATOR) --cc --exe --build -j $(JOBS) --trace --top-module sizif \
		-MAKEFLAGS "$(if $(filter Makefile,$?),-B) OPT_FAST=-O3 OPT_GLOBAL=-O3 OPT_SLOW=-O3 AR=gcc-ar" \
		--timescale 1ps/1ps --pins-inout-enables \
		-Wno-fatal -Wno-WIDTHTRUNC -Wno-WIDTHEXPAND \
		-CFLAGS "-std=c++17 -DVL_TIME_CONTEXT -flto=auto -march=native $(SDL_CFLAGS)" \
		-LDFLAGS "-O3 -flto=auto -flto-partition=none -march=native $(SDL_LIBS)" \
		--Mdir obj_dir $(RTL) main.cpp frontend.cpp

run: build
	./obj_dir/Vsizif $(ARGS)

test: build
	python3 tests.py

lint:
	$(VERILATOR) --lint-only --top-module sizif --timescale 1ps/1ps \
		--pins-inout-enables -Wno-fatal $(RTL)

clean:
	rm -rf obj_dir out/tests
