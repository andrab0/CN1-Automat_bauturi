`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 04:22:23 PM
// Design Name: 
// Module Name: simulare_tonomat
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


module simulare_tonomat();
reg clk, reset, B1, B5, B10;
wire STICLA, R1, R5;
Automat a1(clk, reset, B1, B5, B10, R1, R5, STICLA);

always #5 clk = ~clk;

initial
begin
clk = 0;
reset = 1;
B1 = 0;
B5 = 0;
B10 = 0;
#10 reset = 0;
#5  B1 = 1; B5 = 0; B10 = 0;
#25 B1 = 0; B5 = 0; B10 = 0; 
#25 B1 = 0; B5 = 1; B10 = 0; 
#5  B5 = 0;
#45 B10 = 1;
#5 B10 = 0;
#40 $finish;
end

endmodule
