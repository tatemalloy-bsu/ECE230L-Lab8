	// go look at the multiplexer4 to understand how this works
	// its basically a reversed version of it
	// maps one input to one of 4 outputs depending on what
	// output_to_select is set to (00, 01, 10, 11)

`timescale 1ns / 1ps


module demultiplexer4(
	input wire enabled,
	input wire [1:0] output_to_select,

	input wire [3:0] input_bus,

	output wire [3:0] output_bus_A,
	output wire [3:0] output_bus_B,
	output wire [3:0] output_bus_C,
	output wire [3:0] output_bus_D
);

	assign output_bus_A = (enabled && output_to_select == 2'b00) ? input_bus : 4'b0000;
	assign output_bus_B = (enabled && output_to_select == 2'b01) ? input_bus : 4'b0000;
	assign output_bus_C = (enabled && output_to_select == 2'b10) ? input_bus : 4'b0000;
	assign output_bus_D = (enabled && output_to_select == 2'b11) ? input_bus : 4'b0000;

endmodule