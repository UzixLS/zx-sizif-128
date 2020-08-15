`include "util.vh"

module zx_ula(
	input rst_n,
	input clk14,
	input clk16,

	output clkcpu,

	inout [7:0] vd,
	inout [16:0] va,
	output ra14,
	input a0,
	input a1,
	input a14,
	input a15,

	input n_rd,
	input n_wr,
	input n_mreq,
	input n_iorq,
	input n_m1,
	input n_rfsh,
	output reg n_int,

	output n_vrd,
	output n_vwr,
	output reg n_romcs,

	input [4:0] kd,
	input tape_in,
	output reg tape_out,
	output reg beeper,

	output ay_clk,
	output reg ay_bdir,
	output reg ay_bc1,

	output reg r,
	output reg g,
	output reg b,
	output reg i,
	output [1:0] chroma,
	output reg csync
);

wire [15:0] xa = {a15, a14, va[13:2], a1, a0};
wire [7:0] xd = vd;

reg n_iorq_delayed;
always @(posedge clkcpu)
	n_iorq_delayed <= n_iorq;
wire n_iorq0 = n_iorq | n_iorq_delayed;


/* SCREEN CONTROLLER */
localparam H_AREA         = 256;
localparam V_AREA         = 192;
localparam SCREEN_DELAY   = 8;
localparam H_TOTAL        = 448;
localparam V_TOTAL        = 320;

reg [`CLOG2(V_TOTAL)-1:0] vc;
reg [`CLOG2(H_TOTAL):0] hc0;
wire [`CLOG2(H_TOTAL)-1:0] hc = hc0[$bits(hc0)-1:1];

wire hc0_reset = hc0 == (H_TOTAL<<1) - 1'b1 ;
wire vc_reset = vc == V_TOTAL - 1'b1 ;
wire hsync0 = hc[8:5] == 4'b1010;
wire vsync0 = vc[7:3] == 5'b11111;
wire blank = (vc[7:3] == 5'b11111) || (hc[8:6] == 3'b101);

reg hsync1;
always @(posedge clk14)
	hsync1 = hc[8:5] != 4'b1010;

always @(posedge clk14) begin
	if (hc0_reset) begin
		hc0 <= 0;
		if (vc_reset) begin
			vc <= 0;
		end
		else begin
			vc <= vc + 1'b1;
		end
	end 
	else begin
		hc0 <= hc0 + 1'b1;
	end
end

reg [4:0] blink_cnt;
wire blink = blink_cnt[$bits(blink_cnt)-1];
always @(posedge n_int or negedge rst_n) begin
	if (!rst_n)
		blink_cnt <= 0;
	else
		blink_cnt <= blink_cnt + 1'b1;
end

reg [2:0] border;
reg [7:0] bitmap, attr, bitmap_next, attr_next;
reg screen_read;
wire attr_read = screen_read & ~hc0[0];
wire bitmap_read = screen_read & hc0[0];
wire [14:0] bitmap_addr = { 2'b10, vc[7:6], vc[2:0], vc[5:3], hc[7:3] };
wire [14:0] attr_addr = { 5'b10110, vc[7:3], hc[7:3] };
wire [14:0] screen_addr = attr_read? attr_addr : bitmap_addr;
wire screen_load = (vc < V_AREA) && (hc < H_AREA);
wire screen_show = (vc < V_AREA) && (hc >= SCREEN_DELAY) && (hc < H_AREA + SCREEN_DELAY);
wire screen_update = hc0[3:0] == 4'b1111;
wire border_update = (screen_load == 0 && hc0[3:0] == 4'b1111) || (screen_show == 0);

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		screen_read <= 0;
		attr <= 0;
		bitmap <= 0;
		attr_next <= 0;
		bitmap_next <= 0;
	end
	else begin
		screen_read <= screen_load && (n_mreq == 1 && n_iorq == 1);

		if (attr_read)
			attr_next <= vd;
		if (bitmap_read)
			bitmap_next <= vd;

		if (screen_load && screen_update)
			attr <= attr_next;
		else if (border_update)
			attr <= {2'b00, border, 3'b000};
		
		if (screen_load && screen_update)
			bitmap <= bitmap_next;
		else if (hc0[0])
			bitmap <= {bitmap[6:0], 1'b0};
	end
end

wire pixel = bitmap[7];
always @(posedge clk14) begin
	if (hc0[0]) begin
		if (blank)
			{i, g, r, b} = 4'b0000;
		else begin
			{g, r, b} = (pixel ^ (attr[7] & blink))? attr[2:0] : attr[5:3];
			i = (g | r | b) & attr[6];
		end
		csync <= ~(vsync0 ^ hsync0);
	end
end


/* CLOCK */
assign clkcpu = hc[0];


/* INT GENERATOR */
localparam INT_V      = 239;
localparam INT_H_FROM = 318;
localparam INT_H_TO   = 382;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		n_int <= 1;
	else
		n_int <= vc != INT_V || hc < INT_H_FROM || hc > INT_H_TO ;
end


/* PORT #FE */
wire port_fe_cs = n_m1 == 1 && n_iorq0 == 0 && xa[0] == 0;

wire [7:0] port_fe_data = {1'b1, tape_in, 1'b1, kd[4:0]};
reg port_fe_rd;
always @(posedge clk14)
	port_fe_rd <= port_fe_cs && n_rd == 0;

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		beeper <= 0;
		tape_out <= 0;
		border <= 0;
	end
	else if (port_fe_cs && n_wr == 0) begin
		beeper <= xd[4];
		tape_out <= xd[3];
		border <= xd[2:0];
	end
end


/* PORT #7FFD */
wire port_7ffd_cs = n_m1 == 1 && n_iorq0 == 0 && xa[1] == 0 && xa[15] == 0 && xa[14] == 1;
reg [2:0] rambank;
reg rombank, vbank, lock_7ffd;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		rambank <= 0;
		vbank <= 0;
		rombank <= 0;
		lock_7ffd <= 0;
	end
	else if (port_7ffd_cs && n_wr == 0 && lock_7ffd == 0) begin
		rambank <= xd[2:0];
		vbank <= xd[3];
		rombank <= xd[4];
		lock_7ffd <= xd[5];
	end
end


/* AY */
always @(posedge clkcpu or negedge rst_n) begin
	if (!rst_n) begin
		ay_bc1 <= 0;
		ay_bdir <= 0;
	end
	else begin
		ay_bc1  <= xa[15] == 1 && xa[14] == 1 && xa[1] == 0 && n_m1 == 1 && n_iorq0 == 0;
		ay_bdir <= xa[15] == 1 && xa[1] == 0 && n_m1 == 1 && n_iorq0 == 0 && n_wr == 0;
	end
end
assign ay_clk = hc[1];


/* VIDEO */
reg [2:0] chroma0;
chroma_gen chroma_gen1(
	.cg_clock(clk16),
	.cg_rgb({g,r,b}),
	.cg_hsync(hsync1),
	.cg_enable(1'b1),
	.cg_pnsel(1'b0),
	.cg_out(chroma0)
);
assign chroma[0] = chroma0[1]? chroma0[0] : 1'bz;
assign chroma[1] = chroma0[2]? chroma0[0] : 1'bz;


/* MEMORY CONTROLLER */
// 7ffe a15-14 va16-14
//  xxx   01     010   bank 2
//  xxx   10     101   bank 5
//  000   11     000   bank 0
//  001   11     001   bank 1 | contended
//  010   11     010   bank 2
//  011   11     011   bank 3 | contended
//  100   11     100   bank 4
//  101   11     101   bank 5 | contended (video)
//  110   11     110   bank 6
//  111   11     111   bank 7 | contended (video alt)
// 7ffe a15-14  ra14
//    0   00       0   rom0
//    1   00       1   rom1

wire n_vcs_cpu = n_mreq | ~(a15 | a14);
assign n_vrd = ((n_vcs_cpu == 0 && n_rd == 0) || screen_read == 1)? 1'b0 : 1'b1;
assign n_vwr = ((n_vcs_cpu == 0 && n_wr == 0) && screen_read == 0)? 1'b0 : 1'b1;
always @(posedge clkcpu) begin
	n_romcs <= n_mreq | a15 | a14;
end

assign ra14 = rombank;

assign va[16:0] = 
	screen_read? {1'b1, vbank, screen_addr} :
	a15 & a14? {rambank, {14{1'bz}}} :
	{a14, a15, a14, {14{1'bz}}};

assign vd[7:0] = 
	port_fe_rd? port_fe_data :
	n_iorq0 == 0 && (n_rd == 0 | n_m1 == 0)? {8{1'b1}} :
	{8{1'bz}};


endmodule
