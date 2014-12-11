
// xbee.v - XBee serial communication module
// module 
//
// Copyright Andrei Kniazev, 2015
// 
// Created By:		Andrei Kniazev	
// Last Modified:	16-November-2015 (AK)
//
// Revision History:
// -----------------
// Nov-2015		AK		Initial release
//
// Description:
//  This module acts as a serial asynchronous UART.  It instantiates a receiver and
//  a transmitter modules, which in turn use a baud rate generator, and combines
//  their functionality into a complete UART.  
//  There are no input or output FIFOs, which limits this module's range of 
//  applications, but it is sufficient for Battleship's functionality because of
//  very low bandwidth requirements.
// ------------
// 
///////////////////////////////////////////////////////////////////////////
`timescale  1 ns / 1 ns
module xbee 
#(
	// parameters
	parameter	BAUD				= 9600, 
	parameter	DATA_WIDTH			= 8,
	parameter	CLKFREQ				= 100_000_000,		// Nexys 4 oscillator clk
	parameter	RESET_POLARITY_LOW	= 1
)
(
    input					clk,
	input					reset,
	input [DATA_WIDTH-1:0]	DataIn,			// 
	input					send_data,		//
	input					read_data,		// only for FIFO
	input					RxD,			//
	output reg [DATA_WIDTH-1:0]	DataOut,		// 
	output					TxD,	
	output					DataRdy			// 
);

	wire	reset_in = RESET_POLARITY_LOW ? ~reset : reset;
	
	// Outputs
	wire		TxBusy;
	wire [7:0]	rx_data_out;
	wire		rx_data_rdy;
	wire		rx_idle;	// might not need
	reg		    TxStart;
	reg			CharSent;

	assign DataRdy = rx_data_rdy;

	// Transmitter control
	always @(posedge clk) begin
		if (reset_in) begin
			TxStart <= 1'b0;
			CharSent <= 1'b0;
		end
		// not in reset
		else begin	
			// send character
			if (~CharSent & send_data & ~TxBusy) begin
				TxStart <= 1'b1;
				CharSent <= 1'b1;
			end
			// prepare to send next character
			else if (~send_data)
				CharSent <= 1'b0;
			// wait for data to send
			else begin 
				TxStart <= 1'b0;
				CharSent <= CharSent;
			end
		end
	end


	// Receiver control
	always @(posedge rx_data_rdy) begin
		DataOut <= rx_data_out; 
	end

	xmitter #(.BAUD(BAUD), 
			.DATA_WIDTH(DATA_WIDTH),
			.CLKFREQ(CLKFREQ),
			.RESET_POLARITY_LOW(RESET_POLARITY_LOW)
			) tx1 (
			.clk(clk),
			.reset(reset),
			.TxD_start(TxStart),
			.TxD_data(DataIn),
			.TxD_busy(TxBusy),
			.TxD(TxD)
			);
	
	
	receiver #(.BAUD(BAUD), 
			.DATA_WIDTH(DATA_WIDTH),
			.CLKFREQ(CLKFREQ),
			.RESET_POLARITY_LOW(RESET_POLARITY_LOW)
			)  rx1 (
			.clk(clk),
			.reset(reset),
			.RxD(RxD),	
			.RxData_ready(rx_data_rdy),
			.RxData_out(rx_data_out),
			.RxD_idle(rx_idle)
			);
endmodule
