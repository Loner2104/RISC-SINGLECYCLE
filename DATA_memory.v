`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 00:43:22
// Design Name: 
// Module Name: DATA_memory
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

module DataMemory #(parameter Width = 32)
(input clk, MemWrite, MemRead, [Width-1:0] address,WriteData,
output reg [Width-1:0] ReadData);
reg [Width-1:0] mem1[511:0];
initial
begin
mem1[0] = 32'h00000000;
mem1[1] = 32'h00000001;
mem1[2] = 32'h00000002;
mem1[3] = 32'h00000003;
mem1[4] = 32'h00000009;
mem1[5] = 32'h00000005;
mem1[6] = 32'h00000006;
mem1[7] = 32'h00000007;
end
always @(*)
begin
if(MemRead == 1'b1)
ReadData <= mem1[address];
else if(MemWrite == 1'b1)
mem1[address] = WriteData;
end
endmodule