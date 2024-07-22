`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 18:19:59
// Design Name: 
// Module Name: MUX1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module MUX1 #(parameter Width = 32)(input [Width-1 : 0] a,b,c,
 input  [1:0] s,
 output [Width-1 : 0] out);
assign out = (s == 2'b10) ? c : (s == 2'b01) ? b : a;
endmodule