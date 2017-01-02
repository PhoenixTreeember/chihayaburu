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
   
   wire [31:0]      result_0;
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



   //dummy
   assign       result_0 = 31'd0;
   assign       result_1 = 31'd1;
   assign       result_2 = 31'd2;
   assign       result_3 = 31'd3;
   assign       result_4 = 31'd4;
   assign       result_5 = 31'd5;
   assign       result_6 = 31'd6;
   assign       result_7 = 31'd7;
   assign       result_8 = 31'd8;
   assign       result_9 = 31'd9;
   assign       result_10 = 31'd0;
   assign       result_11 = 31'd0;
   assign       result_12 = 31'd0;
   assign       result_13 = 31'd0;
   assign       result_14 = 31'd0;
   assign       result_15 = 31'd0;
   assign       result_16 = 31'd0;
   assign       result_17 = 31'd0;
   assign       result_18 = 31'd0;
   assign       result_19 = 31'd0;
   assign       result_20 = 31'd0;
   assign       result_21 = 31'd0;
   assign       result_22 = 31'd0;
   assign       result_23 = 31'd0;
   assign       result_24 = 31'd0;
   assign       result_25 = 31'd0;
   assign       result_26 = 31'd0;
   assign       result_27 = 31'd0;
   assign       result_28 = 31'd0;
   assign       result_29 = 31'd0;
   assign       result_30 = 31'd0;
   assign       result_31 = 31'd0;
   assign       result_32 = 31'd0;
   assign       result_33 = 31'd0;
   assign       result_34 = 31'd0;
   assign       result_35 = 31'd0;
   assign       result_36 = 31'd0;
   assign       result_37 = 31'd0;
   assign       result_38 = 31'd0;
   assign       result_39 = 31'd0; 
   assign       result_40 = 31'd0;
   assign       result_41 = 31'd0;
   assign       result_42 = 31'd0;
   assign       result_43 = 31'd0;
   assign       result_44 = 31'd0;
   assign       result_45 = 31'd0;


endmodule // softmax_top
