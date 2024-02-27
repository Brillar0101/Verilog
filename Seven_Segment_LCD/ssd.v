////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename: ssd.v
// Author:   Barakaeli Lawuo
// Created:   February 14th 2024
// Version:  2.0
// Description: This 4-input, 7 output circuit drives a seven segment display, and is intended in this 
// project to drive HEX0 on the DE10-Lite, an active-low seven-segment display.
//
// Within this comment, below this line, list all valid codes for your character set
//
// 0000,0001,0010,0011,0100,0101,0110,0111,1000,1001,1010

////////////////////////////////////////////////////////////////////////////////////////////////////


module ssd(in, out);

   input [3:0] in;           
   output [6:0] out;          

   //wires 
   wire w0,w1,w2,w3,w5,w4,w6,w7,w8,w9,w10,w11,w12,w13,w14;
  
  
   //not gates 
   not n1(w0,in[0]); //from D'
   not n2(w1,in[1]); //from C'
   not n3(w2,in[2]); //from B'
   not n4(w3,in[3]); //from A'
  
   //Output 0
   nand nd1(w5, in[1],in[0]); //w5 from (CD)'
   nand nd2(w6, in[3],in[1]);  //W6 from (AC)'
   nand nd3(out[0],w5,w6,w2);
  
   //Output 1
   nand nd4(w7,in[2],in[0]); //w7 from (BD)'
   nand nd5(w8,in[2],in[1]); //w8 from (BC)'
   nand nd6(w9,in[3],in[0]); //w9 from (AD)' 
   nand nd7(out[1],w5,w7,w8,w9);
  
   //Output 2
   nand nd8(w10, w3,w2,in[0]); //w10 from (A'B'D)'
   nand nd9(w11, w3,w1,in[0]); //w11 from (A'C'D)'
   nand nd10(w4,in[3], w1,w0); //w4from (AC'D')'
	nand nd11(out[2],w4,w11,w10);
  
   //Output 3
   nand nd12(w12,w3,w1,in[0]); //w12 from (A'C'D)'
   nand nd13(w13,w2,in[1],w0); //w13 from (B'CD')'
   nand nd14(out[3], w12,w13,w7);
  
  
   //Output 4
   nand nd15(w14,w3,w2,w1); //w14 from (A'B'C')'
   nand nd16(out[4],w9,w6,w14);
  
   //Output 5
   nand nd17(out[5],w2,w6);
  
  
   //Output 6
   nand nd18(out[6],w6);
  
endmodule

  
