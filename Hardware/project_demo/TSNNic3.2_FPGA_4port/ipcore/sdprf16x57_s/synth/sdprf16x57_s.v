// sdprf16x57_s.v

// Generated using ACDS version 15.0 145

`timescale 1 ps / 1 ps
module sdprf16x57_s (
		input  wire [56:0] data,      //  ram_input.datain
		input  wire [3:0]  wraddress, //           .wraddress
		input  wire [3:0]  rdaddress, //           .rdaddress
		input  wire        wren,      //           .wren
		input  wire        clock,     //           .clock
		input  wire        rden,      //           .rden
		input  wire        aclr,      //           .aclr
		output wire [56:0] q          // ram_output.dataout
	);

	sdprf16x57_s_ram_2port_150_qis34jy ram_2port_0 (
		.data      (data),      //  ram_input.datain
		.wraddress (wraddress), //           .wraddress
		.rdaddress (rdaddress), //           .rdaddress
		.wren      (wren),      //           .wren
		.clock     (clock),     //           .clock
		.rden      (rden),      //           .rden
		.aclr      (aclr),      //           .aclr
		.q         (q)          // ram_output.dataout
	);

endmodule
