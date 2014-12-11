// baudGen.v - baud rate generation module used by transmit.v and receive.v
// parts of the uart
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
// Description: Module generates a single pulse corresponding to the desired
// baud rate.
//
// Clock frequency and desired baud rate are parametrized to allow overriding
// at instantiation time.
// ------------
// 
///////////////////////////////////////////////////////////////////////////
`timescale  1 ns / 1 ns
module baudGen
#(
    parameter CLKFREQ = 100_000_000,    // system clock frequency in Hz
    parameter BAUD = 9600               // target baud rate
)
(
    input clk, enable, rst,
    output reg tick  // generate a tick at the specified baud rate
);

    // calculate top count
    localparam TopCount = CLKFREQ / BAUD;   // 1416 for baud rate of 9600
    reg [31:0] counter;

    // assign initial values to reg variables
    initial begin
        tick <= 1'b0;
        counter <= 32'h0;
    end

    // increment count and generate tick
    always @(posedge clk) begin
        if (rst) begin
            counter <= 32'b0;
            tick <= 1'b0;
        end
        else if (enable) begin  // enable signal allows stopping the count when not needed
            if (counter < TopCount) begin
                counter <= counter + 1;
                tick <= 1'b0;
            end
            else begin
                counter <= 32'h0;
                tick <= 1'b1;
            end
        end
        else begin
            counter <= counter;
            tick <= tick;
        end
    end
endmodule
