`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2024 18:20:45
// Design Name: 
// Module Name: MainController
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

module mainController(
    input [6:0] Opcode,
    output ALUSrc,
    output [1:0] MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output jump,
    output Asel,
    output [1:0] ALuop
);
    reg [10:0] control;
    assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, jump, Asel, ALuop} = control;

    always @(*) begin
        case (Opcode)
            7'b0110011: control <= 11'b00010000010; // R-type
            7'b0000011: control <= 11'b10111000000; // lw-type
            7'b0100011: control <= 11'b1xx00100000; // s-type
            7'b1100011: control <= 11'b0xx00010001; // sb-type
            7'b0010011: control <= 11'b10010000011; // I-type
            7'b1100111: control <= 11'b1101xx01100; // jalr-type
            7'b1101111: control <= 11'b1101xx01000; // jal-type
            default: control <= 11'b00000000000; // default case
        endcase
    end
endmodule