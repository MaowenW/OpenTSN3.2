// (C) 2001-2019 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// megafunction wizard: %ALTDDIO_IN%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altddio_in 

// ============================================================
// File Name: rgmii_in1.v
// Megafunction Name(s):
// 			altddio_in
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 6.0 Build 176 04/19/2006 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2006 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module altera_tse_rgmii_in1 (
	aclr,
	datain,
	inclock,
	dataout_h,
	dataout_l);

	input	  aclr;
	input	  datain;
	input	  inclock;
	output	  dataout_h;
	output	  dataout_l;

	wire [0:0] sub_wire0;
	wire [0:0] sub_wire2;
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  dataout_h = sub_wire1;
	wire [0:0] sub_wire3 = sub_wire2[0:0];
	wire  dataout_l = sub_wire3;
	wire  sub_wire4 = datain;
	wire  sub_wire5 = sub_wire4;

	altddio_in	altddio_in_component (
				.datain (sub_wire5),
				.inclock (inclock),
				.aclr (aclr),
				.dataout_h (sub_wire0),
				.dataout_l (sub_wire2),
				.aset (1'b0),
				.inclocken (1'b1));
	defparam
		altddio_in_component.intended_device_family = "Stratix II",
		altddio_in_component.invert_input_clocks = "OFF",
		altddio_in_component.lpm_type = "altddio_in",
		altddio_in_component.width = 1;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ARESET_MODE NUMERIC "0"
// Retrieval info: PRIVATE: CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: INVERT_INPUT_CLOCKS NUMERIC "0"
// Retrieval info: PRIVATE: POWER_UP_HIGH NUMERIC "0"
// Retrieval info: PRIVATE: WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: CONSTANT: INVERT_INPUT_CLOCKS STRING "OFF"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altddio_in"
// Retrieval info: CONSTANT: WIDTH NUMERIC "1"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT GND aclr
// Retrieval info: USED_PORT: datain 0 0 0 0 INPUT NODEFVAL datain
// Retrieval info: USED_PORT: dataout_h 0 0 0 0 OUTPUT NODEFVAL dataout_h
// Retrieval info: USED_PORT: dataout_l 0 0 0 0 OUTPUT NODEFVAL dataout_l
// Retrieval info: USED_PORT: inclock 0 0 0 0 INPUT_CLK_EXT NODEFVAL inclock
// Retrieval info: CONNECT: @datain 0 0 1 0 datain 0 0 0 0
// Retrieval info: CONNECT: dataout_h 0 0 0 0 @dataout_h 0 0 1 0
// Retrieval info: CONNECT: dataout_l 0 0 0 0 @dataout_l 0 0 1 0
// Retrieval info: CONNECT: @inclock 0 0 0 0 inclock 0 0 0 0
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1.ppf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rgmii_in1_bb.v TRUE