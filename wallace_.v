`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2019 23:07:17
// Design Name: 
// Module Name: wallace_
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


module fulladder( a,b,cin, sum, carry );
    input a;
    input b;
    input cin;
    output sum;
    output carry;
    
    wire w1,w2,w3;
   xor(sum,a,b,cin);
   and(w1,a,b);
   and(w2,b,cin);
   and(w3,a,cin);
   or(carry,w1,w2,w3);
    
endmodule

module halfadder(a,b,sum, carry);
    input a;
    input b;
    output carry;
    output sum;
    assign sum=a^b;
    assign carry=a&b;
    
endmodule





module wallacetree(input [7:0]A,B, output [63:0] prod
    );
    
	 
	 wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7,a1,bc,dc;
	 wire [9:0] s,b,cc,d;
	 wire [10:0] c,ec,fc;
	 wire [13:0] e;
	 wire [14:0] f;
	 
	 
	 // partial product 
	 assign p0=A&{8{B[0]}};
	 assign p1=A&{8{B[1]}};
	 assign p2=A&{8{B[2]}};
	 assign p3=A&{8{B[3]}};
	 assign p4=A&{8{B[4]}};
	 assign p5=A&{8{B[5]}};
	 assign p6=A&{8{B[6]}};
	 assign p7=A&{8{B[7]}};
	 
	 
	   
	 //first STAGE
	 assign s[0]=p0[0];
	 
	 halfadder fa0(p0[1],p1[0], s[1],a1[0]);
	 fulladder fa2(p0[2],p1[1],p2[0],s[2],a1[1]);
	 fulladder fa3(p0[3],p1[2],p2[1],s[3],a1[2]);
	 fulladder fa4(p0[4],p1[3],p2[2],s[4],a1[3]);
	 fulladder fa5(p0[5],p1[4],p2[3],s[5],a1[4]);
	 fulladder fa6(p0[6],p1[5],p2[4],s[6],a1[5]);
	 fulladder fa7(p0[7],p1[6],p2[5],s[7],a1[6]);
	 halfadder ha8(p1[7],p2[6], s[8],a1[7]);
	 
	 assign s[9]=p2[7];
	
  	
	 assign b[0]=p3[0];
	 
	 halfadder hb0(p3[1],p4[0], b[1],bc[0]);
	 fulladder fb2(p3[2],p4[1],p5[0],b[2],bc[1]);
	 fulladder fb3(p3[3],p4[2],p5[1],b[3],bc[2]);
	 fulladder fb4(p3[4],p4[3],p5[2],b[4],bc[3]);
	 fulladder fb5(p3[5],p4[4],p5[3],b[5],bc[4]);
	 fulladder fb6(p3[6],p4[5],p5[4],b[6],bc[5]);
	 fulladder fb7(p3[7],p4[6],p5[5],b[7],bc[6]);
	 halfadder hb8(p4[7],p5[6], b[8],bc[7]);
	 
	 assign b[9]=p5[7]; 
	 
	 
    //second STAGE
	 
	 assign c[0]=s[0];
	 assign c[1]=s[1];
	 
	 halfadder hc1(s[2],a1[0], c[2],cc[0]);
	 fulladder fc2(s[3],a1[1],b[0],c[3],cc[1]);
	 fulladder fc3(s[4],a1[2],b[1],c[4],cc[2]);
	 fulladder fc4(s[5],a1[3],b[2],c[5],cc[3]);
	 fulladder fc5(s[6],a1[4],b[3],c[6],cc[4]);
	 fulladder fc6(s[7],a1[5],b[4],c[7],cc[5]);
	 fulladder fc7(s[8],a1[6],b[5],c[8],cc[6]);
     fulladder fc8(s[9],a1[7],b[6],c[9],cc[7]);
     
    assign c[10]=b[7];
    assign cc[8]=b[8];
    assign cc[9]=b[9];
    
    assign d[0]=bc[0];
    
	 halfadder hd1(bc[1],p6[0], d[1],dc[0]);
	 fulladder hd2(bc[2],p6[1],p7[0],d[2],dc[1]);
	 fulladder hd3(bc[3],p6[2],p7[1],d[3],dc[2]);
	 fulladder hd4(bc[4],p6[3],p7[2],d[4],dc[3]);
	 fulladder hd5(bc[5],p6[4],p7[3],d[5],dc[4]);
	 fulladder hd6(bc[6],p6[5],p7[4],d[6],dc[5]);
	 fulladder hd7(bc[7],p6[6],p7[5],d[7],dc[6]);
	 halfadder hd8(p6[7],p7[6], d[8],dc[7]);
	 assign d[9]=p7[7];
	 
	 
	 // third STAGE
	 assign e[0]=c[0];
	 assign e[1]=c[1];
	 assign e[2]=c[2];
	 
	 
	 halfadder he1(c[3],cc[0],e[3],ec[0]);
	 halfadder he2(c[4],cc[1],e[4],ec[1]);
	 fulladder fe3 (c[5],cc[2],d[0],e[5],ec[2]);
	 fulladder fe4 (c[6],cc[3],d[1],e[6],ec[3]);
	 fulladder fe5 (c[7],cc[4],d[2],e[7],ec[4]);
	 fulladder fe6 (c[8],cc[5],d[3],e[8],ec[5]);
	 fulladder fe7 (c[9],cc[6],d[4],e[9],ec[6]);
     fulladder fe8 (c[10],cc[7],d[5],e[10],ec[7]);
     
	 halfadder he9(cc[8],d[6],e[11],ec[8]);
	 halfadder he10(cc[9],d[7],e[12],ec[9]);
	 
	 assign e[13]=d[8];
	 assign ec[10]=d[9];
	 
	 
	 // fourth STAGE
	 
	 
	 assign f[0]=e[0];
	 assign f[1]=e[1];
	 assign f[2]=e[2];
	 assign f[3]=e[3];
	 
	 halfadder f1(e[4],ec[0],f[4],fc[0]);
	 halfadder f2(e[5],ec[1],f[5],fc[1]);
	 halfadder f3(e[6],ec[2],f[6],fc[2]);
	 fulladder f4(e[7],ec[3],dc[0],f[7],fc[3]);
	 fulladder f5(e[8],ec[4],dc[1],f[8],fc[4]);
	 fulladder f6(e[9],ec[5],dc[2],f[9],fc[5]);
	 fulladder f7(e[10],ec[6],dc[3],f[10],fc[6]);
	 fulladder f8(e[11],ec[7],dc[4],f[11],fc[7]);
	 fulladder f9(e[12],ec[8],dc[5],f[12],fc[8]);
	 fulladder f10(e[13],ec[9],dc[6],f[13],fc[9]);
	 halfadder f11(ec[10],dc[7],f[14],fc[10]);
	 
	 // last STAGE
	  
	 assign prod[4:0]=f[4:0];
	 wire [9:0] m;
	 
	 
      halfadder fm1(f[5], fc[0], prod[5], m[0]);
      
	  fulladder fm2(f[6], fc[1], m[0], prod[6], m[1]);
	  fulladder fm3(f[7], fc[2], m[1], prod[7], m[2]);
	  fulladder fm4(f[8], fc[3], m[2], prod[8], m[3]);
	  fulladder fm5(f[9], fc[4], m[3], prod[9], m[4]);
	  fulladder fm6(f[10], fc[5], m[4], prod[10], m[5]);
	  fulladder fm7(f[11], fc[6], m[5], prod[11], m[6]);
	  fulladder fm8(f[12], fc[7], m[6], prod[12], m[7]);
	  fulladder fm9(f[13], fc[8], m[7], prod[13], m[8]);
	  fulladder fm10(f[14], fc[9], m[8], prod[14], m[9]);
	  halfadder fm11(fc[10], m[9], prod[15] );
	  
  generate
	  genvar i;
	  for (i=16;i<64;i=i+1)
	  begin
	      assign prod[i]=1'b0;
	  end
	  endgenerate


	 
endmodule