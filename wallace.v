`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 18:56:09
// Design Name: 
// Module Name: wallace
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


module wallace(
input [31:0]a,
input [31:0]b,
output [63:0] prod
);
wire [7:0]a1,a2,a3,a4,b1,b2,b3,b4;
generate
genvar i;
for(i=0;i<8;i=i+1)begin
assign a1[i]=a[i];
end
for (i=8;i<16;i=i+1)begin
assign a2[i-8]=a[i];
end
for (i=16;i<24;i=i+1)begin
assign a3[i-16]=a[i];
end
for (i=24;i<32;i=i+1)begin
assign a4[i-24]=a[i];
end
for (i=0;i<8;i=i+1)begin
assign b1[i]=b[i];
end
for(i=8;i<16;i=i+1)begin
assign b2[i-8]=b[i];
end
for(i=16;i<24;i=i+1)begin
assign b3[i-16]=b[i];
end
for(i=24;i<32;i=i+1)begin
assign b4[i-24]=b[i];
end
endgenerate
wire [63:0]d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16;
wire [63:0]e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e13,e14,e15,e12,e16,e17;


wallacetree t1(a1,b1,d1);
wallacetree t2(a1,b2,d3);
wallacetree t3(a1,b3,d6);
wallacetree t4(a1,b4,d10);
wallacetree t5(a2,b1,d2);
wallacetree t6(a2,b2,d5);
wallacetree t7(a2,b3,d9);
wallacetree t8(a2,b4,d13);
wallacetree t9(a3,b1,d4);
wallacetree t10(a3,b2,d8);
wallacetree t11(a3,b3,d12);
wallacetree t12(a3,b4,d15);
wallacetree t13(a4,b1,d7);
wallacetree t14(a4,b2,d11);
wallacetree t15(a4,b3,d14);
wallacetree t16(a4,b4,d16);

lshift8 l1(d2,e2);
lshift8 l2(d3,e3);
lshift16 l3(d4,e4);
lshift16 l4(d5,e5);
lshift16 l5(d6,e6);
lshift24 l6(d7,e7);
lshift24 l7(d8,e8);
lshift24 l8(d9,e9);
lshift24 l9(d10,e10);
lshift32 l10(d11,e11);
lshift32 l11(d12,e12);
lshift32 l12(d13,e13);
lshift40 l13(d14,e14);
lshift40 l14(d15,e15);
lshift48 l15(d16,e16);
wire [63:0] sum1,sum2,sum3,sum4,sum5,sum6,sum7,sum8,sum9,sum10,sum11,sum12,sum13,sum14;


adder w1(d1,e2,sum1);
adder w2(sum1,e3,sum2);
adder w3(sum2,e4,sum3);
adder w4(sum3,e5,sum4);
adder w5(sum4,e6,sum5);
adder w6(sum5,e7,sum6);
adder w7(sum6,e8,sum7);
adder w8(sum7,e9,sum8);
adder w9(sum8,e10,sum9);
adder w10(sum9,e11,sum10);
adder w16(sum10,e12,sum11);
adder w11(sum11,e13,sum12);
adder w12(sum12,e14,sum13);
adder w13(sum13,e15,sum14);
adder w14(sum14,e16,prod);
//adder w15(sum15,e17,prod);






 
endmodule
