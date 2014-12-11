// xmitter.v - transmitter functionality for the XBee serial communication
//
// Copyright Andrei Kniazev, 2015
// 
// Created By:      Rebecca Greene & Kelly Snyder
// Modified by      Andrei Kniazev  
// Last Modified:   16-November-2015 (AK)
//
// Revision History:
// -----------------
// Dec-2013     RG & KS Initial release
// Nov-2015     AK     Modified for battleship project 
//
// Description:
//  This module receives an 8-bit data and a "send" signal and outputs it on a 
//  serial line connected to XBee module.
//  Module asserts a "busy" signal while performing serial data transmission.
// ------------
// 
///////////////////////////////////////////////////////////////////////////
`timescale  1 ns / 1 ns
module xmitter 
#(
    // parameters
    parameter   BAUD                = 9600, 
    parameter   DATA_WIDTH          = 8,
    parameter   CLKFREQ             = 100_000_000,      // Nexys 4 oscillator clk
    parameter   RESET_POLARITY_LOW  = 1
)
(
    input                   clk,
    input                   reset,
    input                   TxD_start,
    input [DATA_WIDTH-1:0]  TxD_data,
    output                  TxD,
    output                  TxD_busy
);

    wire        reset_in = RESET_POLARITY_LOW ? ~reset : reset;
    reg [3:0]   TxD_state = 0;
    wire        TxD_ready = (TxD_state == 1'b0);
    assign      TxD_busy  = ~TxD_ready;

    // instantiate external baud clock generator
    wire tick;
    baudGen #(CLKFREQ, BAUD) tickgen(.clk(clk), .rst(reset_in), .enable(TxD_busy), .tick(tick));

    reg [7:0] TxD_shift = 0;
    always @(posedge clk)
    begin
        if (reset_in)   begin
            TxD_state <= 4'b0000;
            TxD_shift <= 4'b0000;   // should be 8 bits wide
        end
        else if (TxD_ready & TxD_start)
            TxD_shift <= TxD_data;
        else if (TxD_state[3] & tick)
            TxD_shift <= (TxD_shift >> 1);
            
        case(TxD_state)
            4'b0000: if(TxD_start) TxD_state <= 4'b0100;
            4'b0100: if(tick) TxD_state <= 4'b1000;  // start bit
            4'b1000: if(tick) TxD_state <= 4'b1001;  // bit 0
            4'b1001: if(tick) TxD_state <= 4'b1010;  // bit 1
            4'b1010: if(tick) TxD_state <= 4'b1011;  // bit 2
            4'b1011: if(tick) TxD_state <= 4'b1100;  // bit 3
            4'b1100: if(tick) TxD_state <= 4'b1101;  // bit 4
            4'b1101: if(tick) TxD_state <= 4'b1110;  // bit 5
            4'b1110: if(tick) TxD_state <= 4'b1111;  // bit 6
            4'b1111: if(tick) TxD_state <= 4'b0010;  // bit 7
            4'b0010: if(tick) TxD_state <= 4'b0011;  // stop1
            4'b0011: if(tick) TxD_state <= 4'b0000;  // stop2
            default: if(tick) TxD_state <= 4'b0000;
        endcase
    end

    assign TxD = (TxD_state < 4) | (TxD_state[3] & TxD_shift[0]);  // put together the start, data and stop bits

endmodule

