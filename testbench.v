`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2019 18:37:49
// Design Name: 
// Module Name: testbench
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

module testbench();
reg [31:0]a;
reg [31:0]b;
wire [63:0]prod;
wallace abc(.a(a),.b(b),.prod(prod));

initial
begin
a=32'd10;
b=32'd12;
end
endmodule