`timescale 1ns / 1ps


/*module la
(
input[1:0]a,
input[1:0]b,
input cin,
output [1:0] sum,
output cout
);

wire tsum,t1,t2,t3,t4,t5,t6,t7;
 xor A1 (tsum, a[0], b[0]);
  xor A2 (sum[0], tsum, cin);
  and A3 (t1, tsum, cin);
  and A4 (t2, a[0], b[0]);
  xor A5 (t3, a[1], b[1]);
  xor A6 (t4, t2, t1);
  xor A7 (sum[1], t3, t4);
  and B1 (t5, a[1], b[1]);
  or B2 (t6, t2, t1);
  and B3 (t7, t3, t6);
  or B4 (cout, t5, t7);
endmodule
*/

module adder
(
  input [63:0] A,
  input [63:0] B,
  output [63:0] SUM
  
);
wire CARRY;
  // Create wires to connect each full_adder module to another to create a ripple
  wire CARRY0, CARRY1, CARRY2, CARRY3, CARRY4, CARRY5, CARRY6, CARRY7, CARRY8, CARRY9, CARRY10;
  wire CARRY11, CARRY12, CARRY13, CARRY14, CARRY15, CARRY16, CARRY17, CARRY18, CARRY19, CARRY20;
  wire CARRY21, CARRY22, CARRY23, CARRY24, CARRY25, CARRY26, CARRY27, CARRY28, CARRY29, CARRY30;
  wire CARRY31, CARRY32, CARRY33, CARRY34, CARRY35, CARRY36, CARRY37, CARRY38, CARRY39, CARRY40;
  wire CARRY41, CARRY42, CARRY43, CARRY44, CARRY45, CARRY46, CARRY47, CARRY48, CARRY49, CARRY50;
  wire CARRY51, CARRY52, CARRY53, CARRY54, CARRY55, CARRY56, CARRY57, CARRY58, CARRY59, CARRY60;
  wire CARRY61, CARRY62, CARRY63;

  // The first carry is zero
  assign CARRY0 = 1'b0;

  // Sixty-Four separate full adders are combined together to perform as one 64-bit adder
  fulladder op1 (A[0], B[0], CARRY0, SUM[0], CARRY1);
  fulladder op2 (A[1], B[1], CARRY1, SUM[1], CARRY2);
  fulladder op3 (A[2], B[2], CARRY2, SUM[2], CARRY3);
  fulladder op4 (A[3], B[3], CARRY3, SUM[3], CARRY4);
  fulladder op5 (A[4], B[4], CARRY4, SUM[4], CARRY5);
  fulladder op6 (A[5], B[5], CARRY5, SUM[5], CARRY6);
  fulladder op7 (A[6], B[6], CARRY6, SUM[6], CARRY7);
  fulladder op8 (A[7], B[7], CARRY7, SUM[7], CARRY8);
  fulladder op9 (A[8], B[8], CARRY8, SUM[8], CARRY9);
  fulladder op10 (A[9], B[9], CARRY9, SUM[9], CARRY10);
  fulladder op11 (A[10], B[10], CARRY10, SUM[10], CARRY11);
  fulladder op12 (A[11], B[11], CARRY11, SUM[11], CARRY12);
  fulladder op13 (A[12], B[12], CARRY12, SUM[12], CARRY13);
  fulladder op14 (A[13], B[13], CARRY13, SUM[13], CARRY14);
  fulladder op15 (A[14], B[14], CARRY14, SUM[14], CARRY15);
  fulladder op16 (A[15], B[15], CARRY15, SUM[15], CARRY16);
  fulladder op17 (A[16], B[16], CARRY16, SUM[16], CARRY17);
  fulladder op18 (A[17], B[17], CARRY17, SUM[17], CARRY18);
  fulladder op19 (A[18], B[18], CARRY18, SUM[18], CARRY19);
  fulladder op20 (A[19], B[19], CARRY19, SUM[19], CARRY20);
  fulladder op21 (A[20], B[20], CARRY20, SUM[20], CARRY21);
  fulladder op22 (A[21], B[21], CARRY21, SUM[21], CARRY22);
  fulladder op23 (A[22], B[22], CARRY22, SUM[22], CARRY23);
  fulladder op24 (A[23], B[23], CARRY23, SUM[23], CARRY24);
  fulladder op25 (A[24], B[24], CARRY24, SUM[24], CARRY25);
  fulladder op26 (A[25], B[25], CARRY25, SUM[25], CARRY26);
  fulladder op27 (A[26], B[26], CARRY26, SUM[26], CARRY27);
  fulladder op28 (A[27], B[27], CARRY27, SUM[27], CARRY28);
  fulladder op29 (A[28], B[28], CARRY28, SUM[28], CARRY29);
  fulladder op30 (A[29], B[29], CARRY29, SUM[29], CARRY30);
  fulladder op31 (A[30], B[30], CARRY30, SUM[30], CARRY31);
  fulladder op32 (A[31], B[31], CARRY31, SUM[31], CARRY32);
  fulladder op33 (A[32], B[32], CARRY32, SUM[32], CARRY33);
  fulladder op34 (A[33], B[33], CARRY33, SUM[33], CARRY34);
  fulladder op35 (A[34], B[34], CARRY34, SUM[34], CARRY35);
  fulladder op36 (A[35], B[35], CARRY35, SUM[35], CARRY36);
  fulladder op37 (A[36], B[36], CARRY36, SUM[36], CARRY37);
  fulladder op38 (A[37], B[37], CARRY37, SUM[37], CARRY38);
  fulladder op39 (A[38], B[38], CARRY38, SUM[38], CARRY39);
  fulladder op40 (A[39], B[39], CARRY39, SUM[39], CARRY40);
  fulladder op41 (A[40], B[40], CARRY40, SUM[40], CARRY41);
  fulladder op42 (A[41], B[41], CARRY41, SUM[41], CARRY42);
  fulladder op43 (A[42], B[42], CARRY42, SUM[42], CARRY43);
  fulladder op44 (A[43], B[43], CARRY43, SUM[43], CARRY44);
  fulladder op45 (A[44], B[44], CARRY44, SUM[44], CARRY45);
  fulladder op46 (A[45], B[45], CARRY45, SUM[45], CARRY46);
  fulladder op47 (A[46], B[46], CARRY46, SUM[46], CARRY47);
  fulladder op48 (A[47], B[47], CARRY47, SUM[47], CARRY48);
  fulladder op49 (A[48], B[48], CARRY48, SUM[48], CARRY49);
  fulladder op50 (A[49], B[49], CARRY49, SUM[49], CARRY50);
  fulladder op51 (A[50], B[50], CARRY50, SUM[50], CARRY51);
  fulladder op52 (A[51], B[51], CARRY51, SUM[51], CARRY52);
  fulladder op53 (A[52], B[52], CARRY52, SUM[52], CARRY53);
  fulladder op54 (A[53], B[53], CARRY53, SUM[53], CARRY54);
  fulladder op55 (A[54], B[54], CARRY54, SUM[54], CARRY55);
  fulladder op56 (A[55], B[55], CARRY55, SUM[55], CARRY56);
  fulladder op57 (A[56], B[56], CARRY56, SUM[56], CARRY57);
  fulladder op58 (A[57], B[57], CARRY57, SUM[57], CARRY58);
  fulladder op59 (A[58], B[58], CARRY58, SUM[58], CARRY59);
  fulladder op60 (A[59], B[59], CARRY59, SUM[59], CARRY60);
  fulladder op61 (A[60], B[60], CARRY60, SUM[60], CARRY61);
  fulladder op62 (A[61], B[61], CARRY61, SUM[61], CARRY62);
  fulladder op63 (A[62], B[62], CARRY62, SUM[62], CARRY63);
  fulladder op64 (A[63], B[63], CARRY63, SUM[63], CARRY);
endmodule


/*
    Group Members: Nikita Eisenhauer and Warren Seto
    Lab Name: Adder Design
    Design Description: Verilog Module for the full adder module that will be used in the 64-bit ripple adder
*/








/*
module adder
(
input[63:0]A,B,
output[63:0]sum
);
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;
assign c0=1'b0;


  la op1 (A[1:0], B[1:0], c0, sum[1:0], c1);
 la op2 (A[3:2], B[3:2], c1, sum[3:2], c2);
  la op3 (A[5:4], B[5:4], c2, sum[5:4], c3);
  la op4 (A[7:6], B[7:6], c3, sum[7:6], c4);
  la op5 (A[9:8], B[9:8], c4, sum[9:8], c5);
  la op6 (A[11:10], B[11:10], c5, sum[11:10], c6);
   la op7 (A[13:12], B[13:12], c6, sum[13:12], c7);
   la op8 (A[15:14], B[15:14], c7, sum[15:14], c8);
  la op9 (A[17:16], B[17:16], c8, sum[17:16], c9);
  la op10 (A[19:18], B[19:18], c9, sum[19:18], c10);
  la op11 (A[21:20], B[21:20], c10, sum[21:20], c11);
  la op12 (A[23:22], B[23:22], c11, sum[23:22], c12);
  la op13 (A[25:24], B[25:24], c12, sum[25:24], c13);
  la op14 (A[27:26], B[27:26], c13, sum[27:26], c14);
  la op15 (A[29:28], B[29:28], c14, sum[29:28], c15);
  la op16 (A[31:30], B[31:30], c15, sum[31:30], c16);
  la op17 (A[33:32], B[33:32], c16, sum[33:32], c17);
  la op18 (A[35:34], B[35:34],c17, sum[35:34], c18);
  la op19 (A[37:36], B[37:36], c18, sum[37:36], c19);
  la op20 (A[39:38], B[39:38], c19, sum[39:38],c20);
   la op21 (A[41:40], B[41:40], c20, sum[41:40], c21);
   la op22 (A[43:42], B[43:42], c21, sum[43:42], c22);
   la op23 (A[45:44], B[45:44], c22, sum[45:44], c23);
    la op24 (A[47:46], B[47:46], c23, sum[47:46], c24);
   la op25 (A[49:48], B[49:48], c24, sum[49:48], c25);
   la op26 (A[51:50], B[51:50], c25, sum[51:50], c26);
   la op27 (A[53:52], B[53:52], c26, sum[53:52], c27);
   la op28 (A[55:54], B[55:54], c27, sum[55:54], c28);
  la op29 (A[57:56], B[57:56], c28, sum[57:56], c29);
   la op30 (A[59:58], B[59:58], c29, sum[59:58], c30);
   la op31 (A[61:60], B[61:60], c30, sum[61:60], c31);
   la op32 (A[63:62], B[63:62], c31, sum[63:62], c32);
endmodule
*/