module mul_add
  (
   input 	       CLK,
   input 	       RESET_X,

   input [28*28*8-1:0] W0,
   input [28*28*8-1:0] W1,
   input [28*28*8-1:0] W2,
   input [28*28*8-1:0] W3,
   input [28*28*8-1:0] W4,
   input [28*28*8-1:0] W5,
   input [28*28*8-1:0] W6,
   input [28*28*8-1:0] W7,
   input [28*28*8-1:0] W8,
   input [28*28*8-1:0] W9,
   input [28*28*8-1:0] W10,
   input [28*28*8-1:0] W11,
   input [28*28*8-1:0] W12,
   input [28*28*8-1:0] W13,
   input [28*28*8-1:0] W14,
   input [28*28*8-1:0] W15,
   input [28*28*8-1:0] W16,
   input [28*28*8-1:0] W17,
   input [28*28*8-1:0] W18,
   input [28*28*8-1:0] W19,
   input [28*28*8-1:0] W20,
   input [28*28*8-1:0] W21,
   input [28*28*8-1:0] W22,
   input [28*28*8-1:0] W23,
   input [28*28*8-1:0] W24,
   input [28*28*8-1:0] W25,
   input [28*28*8-1:0] W26,
   input [28*28*8-1:0] W27,
   input [28*28*8-1:0] W28,
   input [28*28*8-1:0] W29,
   input [28*28*8-1:0] W30,
   input [28*28*8-1:0] W31,
   input [28*28*8-1:0] W32,
   input [28*28*8-1:0] W33,
   input [28*28*8-1:0] W34,
   input [28*28*8-1:0] W35,
   input [28*28*8-1:0] W36,
   input [28*28*8-1:0] W37,
   input [28*28*8-1:0] W38,
   input [28*28*8-1:0] W39,
   input [28*28*8-1:0] W40,
   input [28*28*8-1:0] W41,
   input [28*28*8-1:0] W42,
   input [28*28*8-1:0] W43,
   input [28*28*8-1:0] W44,
   input [28*28*8-1:0] W45,

   input [46*8-1:0]    BIAS,
   
   input [28*28*8-1:0] IMG,

   output [31:0]       RESULT_0,
   output [31:0]       RESULT_1,
   output [31:0]       RESULT_2,
   output [31:0]       RESULT_3,
   output [31:0]       RESULT_4,
   output [31:0]       RESULT_5,
   output [31:0]       RESULT_6,
   output [31:0]       RESULT_7,
   output [31:0]       RESULT_8,
   output [31:0]       RESULT_9,
   output [31:0]       RESULT_10,
   output [31:0]       RESULT_11,
   output [31:0]       RESULT_12,
   output [31:0]       RESULT_13,
   output [31:0]       RESULT_14,
   output [31:0]       RESULT_15,
   output [31:0]       RESULT_16,
   output [31:0]       RESULT_17,
   output [31:0]       RESULT_18,
   output [31:0]       RESULT_19,
   output [31:0]       RESULT_20,
   output [31:0]       RESULT_21,
   output [31:0]       RESULT_22,
   output [31:0]       RESULT_23,
   output [31:0]       RESULT_24,
   output [31:0]       RESULT_25,
   output [31:0]       RESULT_26,
   output [31:0]       RESULT_27,
   output [31:0]       RESULT_28,
   output [31:0]       RESULT_29,
   output [31:0]       RESULT_30,
   output [31:0]       RESULT_31,
   output [31:0]       RESULT_32,
   output [31:0]       RESULT_33,
   output [31:0]       RESULT_34,
   output [31:0]       RESULT_35,
   output [31:0]       RESULT_36,
   output [31:0]       RESULT_37,
   output [31:0]       RESULT_38,
   output [31:0]       RESULT_39,
   output [31:0]       RESULT_40,
   output [31:0]       RESULT_41,
   output [31:0]       RESULT_42,
   output [31:0]       RESULT_43,
   output [31:0]       RESULT_44,
   output [31:0]       RESULT_45   

   );

   mul_add_core U0 
     (
      .CLK(CLK), 
      .RESET_X(RESET_X), 
      .W(W0), 
      .B(BIAS[7:0]), 
      .IMG(IMG), 
      .RESULT(RESULT_0)
      );
      /*
   mul_add_core U1 (.CLK(CLK), .RESET_X(RESET_X), .W(W1), .B(BIAS[15:8]), .IMG(IMG), .RESULT(RESULT_1));
   mul_add_core U2 (.CLK(CLK), .RESET_X(RESET_X), .W(W2), .B(BIAS[23:16]), .IMG(IMG), .RESULT(RESULT_2));
   mul_add_core U3 (.CLK(CLK), .RESET_X(RESET_X), .W(W3), .B(BIAS[31:24]), .IMG(IMG), .RESULT(RESULT_3));
   mul_add_core U4 (.CLK(CLK), .RESET_X(RESET_X), .W(W4), .B(BIAS[39:32]), .IMG(IMG), .RESULT(RESULT_4));
   mul_add_core U5 (.CLK(CLK), .RESET_X(RESET_X), .W(W5), .B(BIAS[47:40]), .IMG(IMG), .RESULT(RESULT_5));
   mul_add_core U6 (.CLK(CLK), .RESET_X(RESET_X), .W(W6), .B(BIAS[55:48]), .IMG(IMG), .RESULT(RESULT_6));
   mul_add_core U7 (.CLK(CLK), .RESET_X(RESET_X), .W(W7), .B(BIAS[63:56]), .IMG(IMG), .RESULT(RESULT_7));
   mul_add_core U8 (.CLK(CLK), .RESET_X(RESET_X), .W(W8), .B(BIAS[71:64]), .IMG(IMG), .RESULT(RESULT_8));
   mul_add_core U9 (.CLK(CLK), .RESET_X(RESET_X), .W(W9), .B(BIAS[79:72]), .IMG(IMG), .RESULT(RESULT_9));      
   mul_add_core U10 (.CLK(CLK), .RESET_X(RESET_X), .W(W10), .B(BIAS[87:80]), .IMG(IMG), .RESULT(RESULT_10));
   mul_add_core U11 (.CLK(CLK), .RESET_X(RESET_X), .W(W11), .B(BIAS[95:88]), .IMG(IMG), .RESULT(RESULT_11));
   mul_add_core U12 (.CLK(CLK), .RESET_X(RESET_X), .W(W12), .B(BIAS[103:96]), .IMG(IMG), .RESULT(RESULT_12));
   mul_add_core U13 (.CLK(CLK), .RESET_X(RESET_X), .W(W13), .B(BIAS[111:104]), .IMG(IMG), .RESULT(RESULT_13));
   mul_add_core U14 (.CLK(CLK), .RESET_X(RESET_X), .W(W14), .B(BIAS[119:112]), .IMG(IMG), .RESULT(RESULT_14));
   mul_add_core U15 (.CLK(CLK), .RESET_X(RESET_X), .W(W15), .B(BIAS[127:120]), .IMG(IMG), .RESULT(RESULT_15));
   mul_add_core U16 (.CLK(CLK), .RESET_X(RESET_X), .W(W16), .B(BIAS[135:128]), .IMG(IMG), .RESULT(RESULT_16));
   mul_add_core U17 (.CLK(CLK), .RESET_X(RESET_X), .W(W17), .B(BIAS[143:136]), .IMG(IMG), .RESULT(RESULT_17));
   mul_add_core U18 (.CLK(CLK), .RESET_X(RESET_X), .W(W18), .B(BIAS[151:144]), .IMG(IMG), .RESULT(RESULT_18));
   mul_add_core U19 (.CLK(CLK), .RESET_X(RESET_X), .W(W19), .B(BIAS[159:152]), .IMG(IMG), .RESULT(RESULT_19));      
   mul_add_core U20 (.CLK(CLK), .RESET_X(RESET_X), .W(W20), .B(BIAS[167:160]), .IMG(IMG), .RESULT(RESULT_20));
   mul_add_core U21 (.CLK(CLK), .RESET_X(RESET_X), .W(W21), .B(BIAS[175:168]), .IMG(IMG), .RESULT(RESULT_21));
   mul_add_core U22 (.CLK(CLK), .RESET_X(RESET_X), .W(W22), .B(BIAS[183:176]), .IMG(IMG), .RESULT(RESULT_22));
   mul_add_core U23 (.CLK(CLK), .RESET_X(RESET_X), .W(W23), .B(BIAS[191:184]), .IMG(IMG), .RESULT(RESULT_23));
   mul_add_core U24 (.CLK(CLK), .RESET_X(RESET_X), .W(W24), .B(BIAS[199:192]), .IMG(IMG), .RESULT(RESULT_24));
   mul_add_core U25 (.CLK(CLK), .RESET_X(RESET_X), .W(W25), .B(BIAS[207:200]), .IMG(IMG), .RESULT(RESULT_25));
   mul_add_core U26 (.CLK(CLK), .RESET_X(RESET_X), .W(W26), .B(BIAS[215:208]), .IMG(IMG), .RESULT(RESULT_26));
   mul_add_core U27 (.CLK(CLK), .RESET_X(RESET_X), .W(W27), .B(BIAS[223:216]), .IMG(IMG), .RESULT(RESULT_27));
   mul_add_core U28 (.CLK(CLK), .RESET_X(RESET_X), .W(W28), .B(BIAS[231:224]), .IMG(IMG), .RESULT(RESULT_28));
   mul_add_core U29 (.CLK(CLK), .RESET_X(RESET_X), .W(W29), .B(BIAS[239:232]), .IMG(IMG), .RESULT(RESULT_29));      
   mul_add_core U30 (.CLK(CLK), .RESET_X(RESET_X), .W(W30), .B(BIAS[247:240]), .IMG(IMG), .RESULT(RESULT_30));
   mul_add_core U31 (.CLK(CLK), .RESET_X(RESET_X), .W(W31), .B(BIAS[255:248]), .IMG(IMG), .RESULT(RESULT_31));
   mul_add_core U32 (.CLK(CLK), .RESET_X(RESET_X), .W(W32), .B(BIAS[263:256]), .IMG(IMG), .RESULT(RESULT_32));
   mul_add_core U33 (.CLK(CLK), .RESET_X(RESET_X), .W(W33), .B(BIAS[271:264]), .IMG(IMG), .RESULT(RESULT_33));
   mul_add_core U34 (.CLK(CLK), .RESET_X(RESET_X), .W(W34), .B(BIAS[279:272]), .IMG(IMG), .RESULT(RESULT_34));
   mul_add_core U35 (.CLK(CLK), .RESET_X(RESET_X), .W(W35), .B(BIAS[287:280]), .IMG(IMG), .RESULT(RESULT_35));
   mul_add_core U36 (.CLK(CLK), .RESET_X(RESET_X), .W(W36), .B(BIAS[295:288]), .IMG(IMG), .RESULT(RESULT_36));
   mul_add_core U37 (.CLK(CLK), .RESET_X(RESET_X), .W(W37), .B(BIAS[303:296]), .IMG(IMG), .RESULT(RESULT_37));
   mul_add_core U38 (.CLK(CLK), .RESET_X(RESET_X), .W(W38), .B(BIAS[311:304]), .IMG(IMG), .RESULT(RESULT_38));
   mul_add_core U39 (.CLK(CLK), .RESET_X(RESET_X), .W(W39), .B(BIAS[319:312]), .IMG(IMG), .RESULT(RESULT_39));      
   mul_add_core U40 (.CLK(CLK), .RESET_X(RESET_X), .W(W40), .B(BIAS[327:320]), .IMG(IMG), .RESULT(RESULT_40));
   mul_add_core U41 (.CLK(CLK), .RESET_X(RESET_X), .W(W41), .B(BIAS[335:328]), .IMG(IMG), .RESULT(RESULT_41));
   mul_add_core U42 (.CLK(CLK), .RESET_X(RESET_X), .W(W42), .B(BIAS[343:336]), .IMG(IMG), .RESULT(RESULT_42));
   mul_add_core U43 (.CLK(CLK), .RESET_X(RESET_X), .W(W43), .B(BIAS[351:344]), .IMG(IMG), .RESULT(RESULT_43));
   mul_add_core U44 (.CLK(CLK), .RESET_X(RESET_X), .W(W44), .B(BIAS[359:352]), .IMG(IMG), .RESULT(RESULT_44));
   mul_add_core U45 (.CLK(CLK), .RESET_X(RESET_X), .W(W45), .B(BIAS[367:360]), .IMG(IMG), .RESULT(RESULT_45));
   */						       
						       
						       
   assign        RESULT_1 = 0;
   assign        RESULT_2 = 0;
   assign        RESULT_3 = 0;
   assign        RESULT_4 = 0;
   assign        RESULT_5 = 0;
   assign        RESULT_6 = 0;
   assign        RESULT_7 = 0;
   assign        RESULT_8 = 0;
   assign        RESULT_9 = 0;
   assign        RESULT_10 = 0;
   assign        RESULT_11 = 0;
   assign        RESULT_12 = 0;
   assign        RESULT_13 = 0;
   assign        RESULT_14 = 0;
   assign        RESULT_15 = 0;
   assign        RESULT_16 = 0;
   assign        RESULT_17 = 0;
   assign        RESULT_18 = 0;
   assign        RESULT_19 = 0;
   assign        RESULT_20 = 0;
   assign        RESULT_21 = 0;
   assign        RESULT_22 = 0;
   assign        RESULT_23 = 0;
   assign        RESULT_24 = 0;
   assign        RESULT_25 = 0;
   assign        RESULT_26 = 0;
   assign        RESULT_27 = 0;
   assign        RESULT_28 = 0;
   assign        RESULT_29 = 0;
   assign        RESULT_30 = 0;
   assign        RESULT_31 = 0;
   assign        RESULT_32 = 0;
   assign        RESULT_33 = 0;
   assign        RESULT_34 = 0;
   assign        RESULT_35 = 0;
   assign        RESULT_36 = 0;
   assign        RESULT_37 = 0;
   assign        RESULT_38 = 0;
   assign        RESULT_39 = 0;
   assign        RESULT_40 = 0;
   assign        RESULT_41 = 0;
   assign        RESULT_42 = 0;
   assign        RESULT_43 = 0;
   assign        RESULT_44 = 0;
   assign        RESULT_45 = 0;
			       
						       
endmodule // mul_add
