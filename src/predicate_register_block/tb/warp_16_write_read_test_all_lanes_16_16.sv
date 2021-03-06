module tb();

// Required connectivity variables
reg clk;
reg rst_n;
reg [15:0] read_en_0;
reg [15:0] read_en_1;
reg [15:0] write_en;
reg [3:0] raddr_0;
reg [3:0] raddr_1;
reg [3:0] waddr;
reg [3:0] waddr_next;
reg wdata_0;
reg wdata_1;
reg wdata_2;
reg wdata_3;
reg wdata_4;
reg wdata_5;
reg wdata_6;
reg wdata_7;
reg wdata_8;
reg wdata_9;
reg wdata_10;
reg wdata_11;
reg wdata_12;
reg wdata_13;
reg wdata_14;
reg wdata_15;

wire rdata_0_0;
wire rdata_1_0;
wire rdata_0_1;
wire rdata_1_1;
wire rdata_0_2;
wire rdata_1_2;
wire rdata_0_3;
wire rdata_1_3;
wire rdata_0_4;
wire rdata_1_4;
wire rdata_0_5;
wire rdata_1_5;
wire rdata_0_6;
wire rdata_1_6;
wire rdata_0_7;
wire rdata_1_7;
wire rdata_0_8;
wire rdata_1_8;
wire rdata_0_9;
wire rdata_1_9;
wire rdata_0_10;
wire rdata_1_10;
wire rdata_0_11;
wire rdata_1_11;
wire rdata_0_12;
wire rdata_1_12;
wire rdata_0_13;
wire rdata_1_13;
wire rdata_0_14;
wire rdata_1_14;
wire rdata_0_15;
wire rdata_1_15;
reg  [3:0]  warp_selector;
reg  [3:0]  warp_selector_n;

// Instantiate the Register Bank 


predicate_register_block	PR_BLOCK	(
			.clk		(clk), 
			.rst_n		(rst_n),
			.read_en_0	(read_en_0), 
			.read_en_1	(read_en_1), 
			.raddr_0	(raddr_0), 
			.raddr_1	(raddr_1), 
			.write_en	(write_en), 
			.wdata_0	(wdata_0), 
			.wdata_1	(wdata_1), 
			.wdata_2	(wdata_2), 
			.wdata_3	(wdata_3), 
			.wdata_4	(wdata_4), 
			.wdata_5	(wdata_5), 
			.wdata_6	(wdata_6), 
			.wdata_7	(wdata_7), 
			.wdata_8	(wdata_8), 
			.wdata_9	(wdata_9), 
			.wdata_10	(wdata_10), 
			.wdata_11	(wdata_11), 
			.wdata_12	(wdata_12), 
			.wdata_13	(wdata_13), 
			.wdata_14	(wdata_14), 
			.wdata_15	(wdata_15), 
			.waddr		(waddr), 
			.rdata_0_0	(rdata_0_0), 
			.rdata_1_0	(rdata_1_0),
			.rdata_0_1	(rdata_0_1), 
			.rdata_1_1	(rdata_1_1),
			.rdata_0_2	(rdata_0_2), 
			.rdata_1_2	(rdata_1_2),
			.rdata_0_3	(rdata_0_3), 
			.rdata_1_3	(rdata_1_3),
			.rdata_0_4	(rdata_0_4), 
			.rdata_1_4	(rdata_1_4),
			.rdata_0_5	(rdata_0_5), 
			.rdata_1_5	(rdata_1_5),
			.rdata_0_6	(rdata_0_6), 
			.rdata_1_6	(rdata_1_6),
			.rdata_0_7	(rdata_0_7), 
			.rdata_1_7	(rdata_1_7),
			.rdata_0_8	(rdata_0_8), 
			.rdata_1_8	(rdata_1_8),
			.rdata_0_9	(rdata_0_9), 
			.rdata_1_9	(rdata_1_9),
			.rdata_0_10	(rdata_0_10), 
			.rdata_1_10	(rdata_1_10),
			.rdata_0_11	(rdata_0_11), 
			.rdata_1_11	(rdata_1_11),
			.rdata_0_12	(rdata_0_12), 
			.rdata_1_12	(rdata_1_12),
			.rdata_0_13	(rdata_0_13), 
			.rdata_1_13	(rdata_1_13),
			.rdata_0_14	(rdata_0_14), 
			.rdata_1_14	(rdata_1_14),
			.rdata_0_15	(rdata_0_15), 
			.rdata_1_15	(rdata_1_15), 
			.warp_selector  (warp_selector)
			);


`include "predicate_register_block_cfg.v"

// Stimulus

// Clock and reset

initial 
begin
  clk <= 1'b0;
  rst_n <= 1'b0;
end			

always 
 #5 clk <= !clk;

// Controlling reads and writes

initial 
begin
	raddr_0 	= 4'h0;
	raddr_1 	= 4'h0;
	waddr   	= 4'h0;
	waddr_next   	= 4'h0;
	write_en	= 16'h0;
	read_en_0	= 16'h0;
	read_en_1	= 16'h0;
	wdata_0		= 32'h0;
	wdata_1		= 32'h0;
	wdata_2		= 32'h0;
	wdata_3		= 32'h0;
	wdata_4		= 32'h0;
	wdata_5		= 32'h0;
	wdata_6		= 32'h0;
	wdata_7		= 32'h0;
	warp_selector   = 4'h0;
	warp_selector_n = 4'h0;
end

initial 
begin
@(posedge clk);		// Reset happens here
@(negedge clk);		// Apply inputs here
rst_n <= 1'b1; 
   for(int p=1; p<=16; p++)     // Loop for each warp
   begin
	warp_selector_n = warp_selector + 1'b1;
		$display(" ========================================= WARP Num : %d ====================================================\n", (p-1));
     for(int k =1; k<=16; k++) // Loop for every register
     begin
		waddr_next = waddr + 1'b1;
		$display("Testing for Register %d, Addr: %h\n", (k-1), waddr);
		for(int i=0; i<1; i++)   // 1 writes per register
		begin
			write_en   = 16'hFFFF;  // Write to registers of all 8 lanes 
			wdata_0    = 1'h1; 
			wdata_1    = 1'h1; 
			wdata_2    = 1'h1; 
			wdata_3    = 1'h1; 
			wdata_4    = 1'h1; 
			wdata_5    = 1'h1; 
			wdata_6    = 1'h1; 
			wdata_7    = 1'h1; 
			@(posedge clk);	// Write happens
			@(negedge clk);	// Hold Control signals
			write_en   = 16'h0; 	// Withdraw write
			read_en_0  = 16'hFFFF;    // Read from port 0 for all lanes
			raddr_0	   = waddr;
		// Read through Port 0
			#2
			check_port_0_all_lanes(warp_selector, wdata_0, wdata_1, wdata_2, wdata_3, wdata_4, wdata_5, wdata_6, wdata_7);
			//check_port_0_all_16_lanes(wdata_0, wdata_1, wdata_2, wdata_3, wdata_4, wdata_5, wdata_6, wdata_7, wdata_8, wdata_9, wdata_10, wdata_11, wdata_12, wdata_13, wdata_14, wdata_15);
			@(negedge clk);	// Hold Control signals
			write_en   = 16'h0; 	// Withdraw write
			read_en_0  = 16'h0;    // Withdraw read from port 0 for all lanes
			read_en_1  = 16'hFFFF;    // Read from port 1 for all lanes
			raddr_1	   = waddr;
		// Read through Port 1
			#2
			check_port_1_all_lanes(warp_selector, wdata_0, wdata_1, wdata_2, wdata_3, wdata_4, wdata_5, wdata_6, wdata_7);
		// Read through Port 0 and 1 both 
			@(negedge clk);	// Hold Control signals
			write_en   = 16'h0; 	// Withdraw write
			read_en_0  = 16'hFFFF;    // Withdraw read from port 0 for all lanes
			read_en_1  = 16'hFFFF;    // Read from port 1 for all lanes
			raddr_0	   = waddr;
			raddr_1	   = waddr;
			#2
		// Port 0 checks 
		check_port_0_all_16_lanes(warp_selector, wdata_0, wdata_1, wdata_2, wdata_3, wdata_4, wdata_5, wdata_6, wdata_7, wdata_8, wdata_9, wdata_10, wdata_11, wdata_12, wdata_13, wdata_14, wdata_15);
		// Port 1 checks 
		check_port_1_all_16_lanes(warp_selector, wdata_0, wdata_1, wdata_2, wdata_3, wdata_4, wdata_5, wdata_6, wdata_7, wdata_8, wdata_9, wdata_10, wdata_11, wdata_12, wdata_13, wdata_14, wdata_15);
		end // Number of writes
			waddr = waddr_next; // go to next register
	end // Number of registers
			warp_selector = warp_selector_n; // pick the next warp
    end     // Number of warps
#100

$finish();
end // initial begin

endmodule
