module mul8x8_wrap
  (
   input CLK,
   input [7:0] W,
   input [7:0] IMG,
   output [7:0] P
   );

   mult8 mult8
     (
      .CLK(CLK),
      .A(W),
      .B(IMG),
      .P(P)
      );
   
   

endmodule // mul8x8_wrap
