`timescale 1ns / 1ps

module top(
		// input switches from the board
	input [15:0] sw,

		// input buttons from the board
	input btnL, btnU, btnD, btnR, btnC,

		// output lights on the board
	output [15:0] led
);

		// were making 4 different wire buses that each correspond
		// to switches on the board
		// so, switches 0 1 2 3 are mapped to a wire bus (bundle of wires)
		// and that wire bus is called ceo data
		// this is like creating variables
	wire [3:0] ceo_data_input = sw[3:0];
	wire [3:0] my_data_input = sw[7:4];
	wire [3:0] fred_data_input = sw[11:8];
	wire [3:0] jill_data_input = sw[15:12];

		// this is like an array where the 
		// first bit is whether or not btnU is pressed
		// second bit is whether or not btnL is pressed
	wire [1:0] multiplexer_output_selected = {btnU, btnL};

		// this is gonna hold the 4 bits of whatever
		// data_input bus we've selected
		// so if we have multiplexer_output_selected
		// set to 00, which maps to ceo_data_input,
		// then incoming_internet_line will copy
		// ceo_data_input
	wire [3:0] incoming_internet_line;



		// instantiate an instance of our multiplexer4 module
		// nicknamed "mux"

	multiplexer4 mux (
		.enabled(btnC),
		.input_to_select(multiplexer_output_selected),
		.input_bus_A(ceo_data_input),
		.input_bus_B(my_data_input),
		.input_bus_C(fred_data_input),
		.input_bus_D(jill_data_input),
		.output_bus(incoming_internet_line)
	);



	wire [3:0] library_data_output;
	wire [3:0] fire_department_data_output;
	wire [3:0] school_data_output;
	wire [3:0] rib_shack_data_output;

	wire [1:0] demultiplexer_input_selected = {btnR, btnD};

	demultiplexer4 demux (
		.enabled(btnC),
		.output_to_select(demultiplexer_input_selected),
		.input_bus(incoming_internet_line),
		.output_bus_A(library_data_output),
		.output_bus_B(fire_department_data_output),
		.output_bus_C(school_data_output),
		.output_bus_D(rib_shack_data_output)
	);

	assign led[3:0]   = library_data_output;
	assign led[7:4]   = fire_department_data_output;
	assign led[11:8]  = school_data_output;
	assign led[15:12] = rib_shack_data_output;

	
	

endmodule