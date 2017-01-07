module softmax_top
  (
   input 	 CLK,
   input 	 RESET_X,
   input 	 WR,
   input 	 RD,
   input [17:0]  ADR,
   input [31:0]  WDATA,
   output [31:0] RDATA   
   );


   wire  [45:0] sram_sel;
   wire  	     bias_sel;
   wire 	     image_sel;
   wire 	     sram_bias_img_wr;
   wire [31:0]     sram_data;
   wire [11:0] 	   sram_adr;
   
   
   wire [28*28*8-1:0] w0_out;
   wire [28*28*8-1:0] w1_out;
   wire [28*28*8-1:0] w2_out;
   wire [28*28*8-1:0] w3_out;
   wire [28*28*8-1:0] w4_out;
   wire [28*28*8-1:0] w5_out;
   wire [28*28*8-1:0] w6_out;
   wire [28*28*8-1:0] w7_out;
   wire [28*28*8-1:0] w8_out;
   wire [28*28*8-1:0] w9_out;
   wire [28*28*8-1:0] w10_out;
   wire [28*28*8-1:0] w11_out;
   wire [28*28*8-1:0] w12_out;
   wire [28*28*8-1:0] w13_out;
   wire [28*28*8-1:0] w14_out;
   wire [28*28*8-1:0] w15_out;
   wire [28*28*8-1:0] w16_out;
   wire [28*28*8-1:0] w17_out;
   wire [28*28*8-1:0] w18_out;
   wire [28*28*8-1:0] w19_out;
   wire [28*28*8-1:0] w20_out;
   wire [28*28*8-1:0] w21_out;
   wire [28*28*8-1:0] w22_out;
   wire [28*28*8-1:0] w23_out;
   wire [28*28*8-1:0] w24_out;
   wire [28*28*8-1:0] w25_out;
   wire [28*28*8-1:0] w26_out;
   wire [28*28*8-1:0] w27_out;
   wire [28*28*8-1:0] w28_out;
   wire [28*28*8-1:0] w29_out;
   wire [28*28*8-1:0] w30_out;
   wire [28*28*8-1:0] w31_out;
   wire [28*28*8-1:0] w32_out;
   wire [28*28*8-1:0] w33_out;
   wire [28*28*8-1:0] w34_out;
   wire [28*28*8-1:0] w35_out;
   wire [28*28*8-1:0] w36_out;
   wire [28*28*8-1:0] w37_out;
   wire [28*28*8-1:0] w38_out;
   wire [28*28*8-1:0] w39_out;
   wire [28*28*8-1:0] w40_out;
   wire [28*28*8-1:0] w41_out;
   wire [28*28*8-1:0] w42_out;
   wire [28*28*8-1:0] w43_out;
   wire [28*28*8-1:0] w44_out;
   wire [28*28*8-1:0] w45_out;


   wire [28*28*8-1:0] img_out;
   wire [28*28*8-1:0] bias_out;
   //wire [46*8-1:0]    bias_out;
   
   
		     
   wire [31:0] 	   result_0;
   wire [31:0]      result_1;
   wire [31:0]      result_2;
   wire [31:0]      result_3;
   wire [31:0]      result_4;
   wire [31:0]      result_5;
   wire [31:0]      result_6;
   wire [31:0]      result_7;
   wire [31:0]      result_8;
   wire [31:0]      result_9;
   wire [31:0]      result_10;
   wire [31:0]      result_11;
   wire [31:0]      result_12;
   wire [31:0]      result_13;
   wire [31:0]      result_14;
   wire [31:0]      result_15;
   wire [31:0]      result_16;
   wire [31:0]      result_17;
   wire [31:0]      result_18;
   wire [31:0]      result_19;
   wire [31:0]      result_20;
   wire [31:0]      result_21;
   wire [31:0]      result_22;
   wire [31:0]      result_23;
   wire [31:0]      result_24;
   wire [31:0]      result_25;
   wire [31:0]      result_26;
   wire [31:0]      result_27;
   wire [31:0]      result_28;
   wire [31:0]      result_29;
   wire [31:0]      result_30;
   wire [31:0]      result_31;
   wire [31:0]      result_32;
   wire [31:0]      result_33;
   wire [31:0]      result_34;
   wire [31:0]      result_35;
   wire [31:0]      result_36;
   wire [31:0]      result_37;
   wire [31:0]      result_38;
   wire [31:0]      result_39; 
   wire [31:0]      result_40;
   wire [31:0]      result_41;
   wire [31:0]      result_42;
   wire [31:0]      result_43;
   wire [31:0]      result_44;
   wire [31:0]      result_45;


   //cpu if
   cpu_if cpu_if
     (
      .CLK(CLK),
      .RESET_X(RESET_X),

      .CPU_WR(WR),
      .CPU_RD(RD),
      .CPU_ADR(ADR),
      .CPU_WDATA(WDATA),
      .CPU_RDATA(RDATA),

      .SRAM_SEL(sram_sel),
      .BIAS_SEL(bias_sel),
      .IMAGE_SEL(image_sel),
      .SRAM_BIAS_IMG_WR(sram_bias_img_wr),
      .SRAM_DATA(sram_data),
      .SRAM_ADR(sram_adr),
      
      .RESULT_0(result_0),
      .RESULT_1(result_1),
      .RESULT_2(result_2),
      .RESULT_3(result_3),
      .RESULT_4(result_4),
      .RESULT_5(result_5),
      .RESULT_6(result_6),
      .RESULT_7(result_7),
      .RESULT_8(result_8),
      .RESULT_9(result_9),
      .RESULT_10(result_10),
      .RESULT_11(result_11),
      .RESULT_12(result_12),
      .RESULT_13(result_13),
      .RESULT_14(result_14),
      .RESULT_15(result_15),
      .RESULT_16(result_16),
      .RESULT_17(result_17),
      .RESULT_18(result_18),
      .RESULT_19(result_19),
      .RESULT_20(result_20),
      .RESULT_21(result_21),
      .RESULT_22(result_22),
      .RESULT_23(result_23),
      .RESULT_24(result_24),
      .RESULT_25(result_25),
      .RESULT_26(result_26),
      .RESULT_27(result_27),
      .RESULT_28(result_28),
      .RESULT_29(result_29),
      .RESULT_30(result_30),
      .RESULT_31(result_31),
      .RESULT_32(result_32),
      .RESULT_33(result_33),
      .RESULT_34(result_34),
      .RESULT_35(result_35),
      .RESULT_36(result_36),
      .RESULT_37(result_37),
      .RESULT_38(result_38),
      .RESULT_39(result_39), 
      .RESULT_40(result_40),
      .RESULT_41(result_41),
      .RESULT_42(result_42),
      .RESULT_43(result_43),
      .RESULT_44(result_44),
      .RESULT_45(result_45)
      );




   //** sram W0
   img_sram W0
  (
   .CLK(CLK),
   .CS(sram_sel[0]),
   .WR(sram_bias_img_wr),
   .ADR(sram_adr),
   .WDATA(sram_data[7:0]),
   .RDATA(w0_out)
   );


   //** sram W0
   img_sram W1
  (
   .CLK(CLK),
   .CS(sram_sel[1]),
   .WR(sram_bias_img_wr),
   .ADR(sram_adr),
   .WDATA(sram_data[7:0]),
   .RDATA(w1_out)
   );


   //** bias
   img_sram B
  (
   .CLK(CLK),
   .CS(bias_sel),
   .WR(sram_bias_img_wr),
   .ADR(sram_adr),
   .WDATA(sram_data[7:0]),
   .RDATA(bias_out)
   );
   
   
   //** sram image
   img_sram img
  (
   .CLK(CLK),
   .CS(image_sel),
   .WR(sram_bias_img_wr),
   .ADR(sram_adr),
   .WDATA(sram_data[7:0]),
   .RDATA(img_out)
   );
   



   //mul add
   mul_add mul_add
  (
   .CLK(CLK),
   .RESET_X(RESET_X),

   .W0(w0_out),
   .W1(w1_out),
   .W2(w2_out),
   .W3(w3_out),
   .W4(w4_out),
   .W5(w5_out),
   .W6(w6_out),
   .W7(w7_out),
   .W8(w8_out),
   .W9(w9_out),
   .W10(w10_out),
   .W11(w11_out),
   .W12(w12_out),
   .W13(w13_out),
   .W14(w14_out),
   .W15(w15_out),
   .W16(w16_out),
   .W17(w17_out),
   .W18(w18_out),
   .W19(w19_out),
   .W20(w20_out),
   .W21(w21_out),
   .W22(w22_out),
   .W23(w23_out),
   .W24(w24_out),
   .W25(w25_out),
   .W26(w26_out),
   .W27(w27_out),
   .W28(w28_out),
   .W29(w29_out),
   .W30(w30_out),
   .W31(w31_out),
   .W32(w32_out),
   .W33(w33_out),
   .W34(w34_out),
   .W35(w35_out),
   .W36(w36_out),
   .W37(w37_out),
   .W38(w38_out),
   .W39(w39_out),
   .W40(w40_out),
   .W41(w41_out),
   .W42(w42_out),
   .W43(w43_out),
   .W44(w44_out),
   .W45(w45_out),

   .BIAS(bias_out),
   
   .IMG(img_out),

   .RESULT_0(result_0),
   .RESULT_1(result_1),
   .RESULT_2(result_2),
   .RESULT_3(result_3),
   .RESULT_4(result_4),
   .RESULT_5(result_5),
   .RESULT_6(result_6),
   .RESULT_7(result_7),
   .RESULT_8(result_8),
   .RESULT_9(result_9),
   .RESULT_10(result_10),
   .RESULT_11(result_11),
   .RESULT_12(result_12),
   .RESULT_13(result_13),
   .RESULT_14(result_14),
   .RESULT_15(result_15),
   .RESULT_16(result_16),
   .RESULT_17(result_17),
   .RESULT_18(result_18),
   .RESULT_19(result_19),
   .RESULT_20(result_20),
   .RESULT_21(result_21),
   .RESULT_22(result_22),
   .RESULT_23(result_23),
   .RESULT_24(result_24),
   .RESULT_25(result_25),
   .RESULT_26(result_26),
   .RESULT_27(result_27),
   .RESULT_28(result_28),
   .RESULT_29(result_29),
   .RESULT_30(result_30),
   .RESULT_31(result_31),
   .RESULT_32(result_32),
   .RESULT_33(result_33),
   .RESULT_34(result_34),
   .RESULT_35(result_35),
   .RESULT_36(result_36),
   .RESULT_37(result_37),
   .RESULT_38(result_38),
   .RESULT_39(result_39),
   .RESULT_40(result_40),
   .RESULT_41(result_41),
   .RESULT_42(result_42),
   .RESULT_43(result_43),
   .RESULT_44(result_44),
   .RESULT_45(result_45)   

   );



   assign  w2_out = 0;
   assign  w3_out = 0;
   assign  w4_out = 0;
   assign  w5_out = 0;
   assign  w6_out = 0;
   assign  w7_out = 0;
   assign  w8_out = 0;
   assign  w9_out = 0;
   assign  w10_out = 0;
   assign  w11_out = 0;
   assign  w12_out = 0;
   assign  w13_out = 0;
   assign  w14_out = 0;
   assign  w15_out = 0;
   assign  w16_out = 0;
   assign  w17_out = 0;
   assign  w18_out = 0;
   assign  w19_out = 0;
   assign  w20_out = 0;
   assign  w21_out = 0;
   assign  w22_out = 0;
   assign  w23_out = 0;
   assign  w24_out = 0;
   assign  w25_out = 0;
   assign  w26_out = 0;
   assign  w27_out = 0;
   assign  w28_out = 0;
   assign  w29_out = 0;
   assign  w30_out = 0;
   assign  w31_out = 0;
   assign  w32_out = 0;
   assign  w33_out = 0;
   assign  w34_out = 0;
   assign  w35_out = 0;
   assign  w36_out = 0;
   assign  w37_out = 0;
   assign  w38_out = 0;
   assign  w39_out = 0;
   assign  w40_out = 0;
   assign  w41_out = 0;
   assign  w42_out = 0;
   assign  w43_out = 0;
   assign  w44_out = 0;
   assign  w45_out = 0;


endmodule // softmax_top
