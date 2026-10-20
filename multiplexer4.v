	// multiplexer that takes in 4 wire buses
	// each with 4 bits
	// and maps them to a single 4 bit wire bus output

	// its basically a switch that says
	// "hey depending on what number select is (0, 1, 2, 3)
	// make Y = one of the inputs"

`timescale 1ns / 1ps


module multiplexer4(
	input wire [3:0] input_bus_A,
	input wire [3:0] input_bus_B,
	input wire [3:0] input_bus_C,
	input wire [3:0] input_bus_D,

		// were going to use this to select which input will
		// be mapped to the output
		// two bits mean we have 4 possibilities:
		// 00 (0), 01 (1), 10 (2), 11 (3)
	input wire [1:0] input_to_select,

		// 0 means ignore all inputs and make
		// Y always be 0
	input wire enabled,

	output wire [3:0] output_bus
);

		// if enable is true then
		//	if input_to_select == 00 then
		//		output_bus = A
		//	else if input_to_select == 01 then
		//		output_bus = B
		//	else if input_to_select == 10 then
		//		output_bus = C
		//	else
		//		output_bus = D
		// else
		//	output_bus = 0000

		// 2'b00 means "2 bits wide, in binary, 00"
		// 4'b0000 means "4 bits wide, in binary, 0000"

		// you can also do stuff like 4'd4
		// this means "4 bits wide, in decimal (normal numbers) 4" which
		// gets converted to binary as: 0100
		// 8*0 + 4*1 + 2*0 + 1*0 = 4 

	assign output_bus = enabled ? ( 
		input_to_select == 2'b00 ? input_bus_A :
		input_to_select == 2'b01 ? input_bus_B :
		input_to_select == 2'b10 ? input_bus_C : input_bus_D )
		: 4'b0000;

endmodule