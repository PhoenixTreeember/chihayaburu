module cpu_if
  (
   input 	     CLK,
   input 	     RESET_X,

   input 	     CPU_WR,
   input 	     CPU_RD,
   input [17:0]      CPU_ADR,
   input [31:0]      CPU_WDATA,
   output reg [31:0] CPU_RDATA,

   output reg [45:0] SRAM_SEL,
   output reg 	     BIAS_SEL,
   output reg 	     IMAGE_SEL,
   output reg 	     SRAM_BIAS_IMG_WR,
   output reg [31:0] SRAM_DATA,
   
   input [31:0]      RESULT_0,
   input [31:0]      RESULT_1,
   input [31:0]      RESULT_2,
   input [31:0]      RESULT_3,
   input [31:0]      RESULT_4,
   input [31:0]      RESULT_5,
   input [31:0]      RESULT_6,
   input [31:0]      RESULT_7,
   input [31:0]      RESULT_8,
   input [31:0]      RESULT_9,
   input [31:0]      RESULT_10,
   input [31:0]      RESULT_11,
   input [31:0]      RESULT_12,
   input [31:0]      RESULT_13,
   input [31:0]      RESULT_14,
   input [31:0]      RESULT_15,
   input [31:0]      RESULT_16,
   input [31:0]      RESULT_17,
   input [31:0]      RESULT_18,
   input [31:0]      RESULT_19,
   input [31:0]      RESULT_20,
   input [31:0]      RESULT_21,
   input [31:0]      RESULT_22,
   input [31:0]      RESULT_23,
   input [31:0]      RESULT_24,
   input [31:0]      RESULT_25,
   input [31:0]      RESULT_26,
   input [31:0]      RESULT_27,
   input [31:0]      RESULT_28,
   input [31:0]      RESULT_29,
   input [31:0]      RESULT_30,
   input [31:0]      RESULT_31,
   input [31:0]      RESULT_32,
   input [31:0]      RESULT_33,
   input [31:0]      RESULT_34,
   input [31:0]      RESULT_35,
   input [31:0]      RESULT_36,
   input [31:0]      RESULT_37,
   input [31:0]      RESULT_38,
   input [31:0]      RESULT_39, 
   input [31:0]      RESULT_40,
   input [31:0]      RESULT_41,
   input [31:0]      RESULT_42,
   input [31:0]      RESULT_43,
   input [31:0]      RESULT_44,
   input [31:0]      RESULT_45,
   );


   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[0] <= 0;
      end if (CPU_ADR[17:12] == 6'h00)begin
	 SRAM_SEL[0] <= 1;
      end else begin
	 SRAM_SEL[0] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[1] <= 0;
      end if (CPU_ADR[17:12] == 6'h01)begin
	 SRAM_SEL[1] <= 1;
      end else begin
	 SRAM_SEL[1] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[2] <= 0;
      end if (CPU_ADR[17:12] == 6'h02)begin
	 SRAM_SEL[2] <= 1;
      end else begin
	 SRAM_SEL[2] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[3] <= 0;
      end if (CPU_ADR[17:12] == 6'h03)begin
	 SRAM_SEL[3] <= 1;
      end else begin
	 SRAM_SEL[3] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[4] <= 0;
      end if (CPU_ADR[17:12] == 6'h04)begin
	 SRAM_SEL[4] <= 1;
      end else begin
	 SRAM_SEL[4] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[5] <= 0;
      end if (CPU_ADR[17:12] == 6'h05)begin
	 SRAM_SEL[5] <= 1;
      end else begin
	 SRAM_SEL[5] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[6] <= 0;
      end if (CPU_ADR[17:12] == 6'h06)begin
	 SRAM_SEL[6] <= 1;
      end else begin
	 SRAM_SEL[6] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[7] <= 0;
      end if (CPU_ADR[17:12] == 6'h07)begin
	 SRAM_SEL[7] <= 1;
      end else begin
	 SRAM_SEL[7] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[8] <= 0;
      end if (CPU_ADR[17:12] == 6'h08)begin
	 SRAM_SEL[8] <= 1;
      end else begin
	 SRAM_SEL[8] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[9] <= 0;
      end if (CPU_ADR[17:12] == 6'h09)begin
	 SRAM_SEL[9] <= 1;
      end else begin
	 SRAM_SEL[9] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[10] <= 0;
      end if (CPU_ADR[17:12] == 6'h0a)begin
	 SRAM_SEL[10] <= 1;
      end else begin
	 SRAM_SEL[10] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[11] <= 0;
      end if (CPU_ADR[17:12] == 6'h0b)begin
	 SRAM_SEL[11] <= 1;
      end else begin
	 SRAM_SEL[11] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[12] <= 0;
      end if (CPU_ADR[17:12] == 6'h0c)begin
	 SRAM_SEL[12] <= 1;
      end else begin
	 SRAM_SEL[12] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[13] <= 0;
      end if (CPU_ADR[17:12] == 6'h0d)begin
	 SRAM_SEL[13] <= 1;
      end else begin
	 SRAM_SEL[13] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[14] <= 0;
      end if (CPU_ADR[17:12] == 6'h0e)begin
	 SRAM_SEL[14] <= 1;
      end else begin
	 SRAM_SEL[14] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[15] <= 0;
      end if (CPU_ADR[17:12] == 6'h0f)begin
	 SRAM_SEL[15] <= 1;
      end else begin
	 SRAM_SEL[15] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[16] <= 0;
      end if (CPU_ADR[17:12] == 6'h10)begin
	 SRAM_SEL[16] <= 1;
      end else begin
	 SRAM_SEL[16] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[17] <= 0;
      end if (CPU_ADR[17:12] == 6'h11)begin
	 SRAM_SEL[17] <= 1;
      end else begin
	 SRAM_SEL[17] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[18] <= 0;
      end if (CPU_ADR[17:12] == 6'h12)begin
	 SRAM_SEL[18] <= 1;
      end else begin
	 SRAM_SEL[18] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[19] <= 0;
      end if (CPU_ADR[17:12] == 6'h13)begin
	 SRAM_SEL[19] <= 1;
      end else begin
	 SRAM_SEL[19] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[20] <= 0;
      end if (CPU_ADR[17:12] == 6'h14)begin
	 SRAM_SEL[20] <= 1;
      end else begin
	 SRAM_SEL[20] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[21] <= 0;
      end if (CPU_ADR[17:12] == 6'h15)begin
	 SRAM_SEL[21] <= 1;
      end else begin
	 SRAM_SEL[21] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[22] <= 0;
      end if (CPU_ADR[17:12] == 6'h16)begin
	 SRAM_SEL[22] <= 1;
      end else begin
	 SRAM_SEL[22] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[23] <= 0;
      end if (CPU_ADR[17:12] == 6'h17)begin
	 SRAM_SEL[23] <= 1;
      end else begin
	 SRAM_SEL[23] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[24] <= 0;
      end if (CPU_ADR[17:12] == 6'h18)begin
	 SRAM_SEL[24] <= 1;
      end else begin
	 SRAM_SEL[24] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[25] <= 0;
      end if (CPU_ADR[17:12] == 6'h19)begin
	 SRAM_SEL[25] <= 1;
      end else begin
	 SRAM_SEL[25] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[26] <= 0;
      end if (CPU_ADR[17:12] == 6'h1a)begin
	 SRAM_SEL[26] <= 1;
      end else begin
	 SRAM_SEL[26] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[27] <= 0;
      end if (CPU_ADR[17:12] == 6'h1b)begin
	 SRAM_SEL[27] <= 1;
      end else begin
	 SRAM_SEL[27] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[28] <= 0;
      end if (CPU_ADR[17:12] == 6'h1c)begin
	 SRAM_SEL[28] <= 1;
      end else begin
	 SRAM_SEL[28] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[29] <= 0;
      end if (CPU_ADR[17:12] == 6'h1d)begin
	 SRAM_SEL[29] <= 1;
      end else begin
	 SRAM_SEL[29] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[30] <= 0;
      end if (CPU_ADR[17:12] == 6'h1e)begin
	 SRAM_SEL[30] <= 1;
      end else begin
	 SRAM_SEL[30] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[31] <= 0;
      end if (CPU_ADR[17:12] == 6'h1f)begin
	 SRAM_SEL[31] <= 1;
      end else begin
	 SRAM_SEL[31] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[32] <= 0;
      end if (CPU_ADR[17:12] == 6'h20)begin
	 SRAM_SEL[32] <= 1;
      end else begin
	 SRAM_SEL[32] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[33] <= 0;
      end if (CPU_ADR[17:12] == 6'h21)begin
	 SRAM_SEL[33] <= 1;
      end else begin
	 SRAM_SEL[33] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[34] <= 0;
      end if (CPU_ADR[17:12] == 6'h22)begin
	 SRAM_SEL[34] <= 1;
      end else begin
	 SRAM_SEL[34] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[35] <= 0;
      end if (CPU_ADR[17:12] == 6'h23)begin
	 SRAM_SEL[35] <= 1;
      end else begin
	 SRAM_SEL[35] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[36] <= 0;
      end if (CPU_ADR[17:12] == 6'h24)begin
	 SRAM_SEL[36] <= 1;
      end else begin
	 SRAM_SEL[36] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[37] <= 0;
      end if (CPU_ADR[17:12] == 6'h25)begin
	 SRAM_SEL[37] <= 1;
      end else begin
	 SRAM_SEL[37] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[38] <= 0;
      end if (CPU_ADR[17:12] == 6'h26)begin
	 SRAM_SEL[38] <= 1;
      end else begin
	 SRAM_SEL[38] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[39] <= 0;
      end if (CPU_ADR[17:12] == 6'h27)begin
	 SRAM_SEL[39] <= 1;
      end else begin
	 SRAM_SEL[39] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[40] <= 0;
      end if (CPU_ADR[17:12] == 6'h28)begin
	 SRAM_SEL[40] <= 1;
      end else begin
	 SRAM_SEL[40] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[41] <= 0;
      end if (CPU_ADR[17:12] == 6'h29)begin
	 SRAM_SEL[41] <= 1;
      end else begin
	 SRAM_SEL[41] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[42] <= 0;
      end if (CPU_ADR[17:12] == 6'h2a)begin
	 SRAM_SEL[42] <= 1;
      end else begin
	 SRAM_SEL[42] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[43] <= 0;
      end if (CPU_ADR[17:12] == 6'h2b)begin
	 SRAM_SEL[43] <= 1;
      end else begin
	 SRAM_SEL[43] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[44] <= 0;
      end if (CPU_ADR[17:12] == 6'h2c)begin
	 SRAM_SEL[44] <= 1;
      end else begin
	 SRAM_SEL[44] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[45] <= 0;
      end if (CPU_ADR[17:12] == 6'h2d)begin
	 SRAM_SEL[45] <= 1;
      end else begin
	 SRAM_SEL[45] <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 BIAS_SEL <= 0;
      end if (CPU_ADR[17:12] == 6'h2e)begin
	 BIAS_SEL <= 1;
      end else begin
	 BIAS_SEL <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 IMAGE_SEL <= 0;
      end if (CPU_ADR[17:12] == 6'h30)begin
	 IMAGE_SEL <= 1;
      end else begin
	 IMAGE_SEL <= 0;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_BIAS_IMG_WR <= 0;
	 SRAM_DATA <= 32'h00000000;	 
      end else begin
	 SRAM_BIAS_IMG_WR <= CPU_WR;
	 SRAM_DATA <= CPU_WDATA;
      end
   end

   always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 CPU_RDATA    <= 32'h00000000;
      end else begin
	 if(CPU_ADR == 18'h31000) CPU_RDATA <= RESULT_0;
	 else if(CPU_ADR == 18'h31004) CPU_RDATA <= RESULT_1;
	 else if(CPU_ADR == 18'h31008) CPU_RDATA <= RESULT_2;
	 else if(CPU_ADR == 18'h3100C) CPU_RDATA <= RESULT_3;
	 else if(CPU_ADR == 18'h31010) CPU_RDATA <= RESULT_4;
	 else if(CPU_ADR == 18'h31014) CPU_RDATA <= RESULT_5;
	 else if(CPU_ADR == 18'h31018) CPU_RDATA <= RESULT_6;
	 else if(CPU_ADR == 18'h3101C) CPU_RDATA <= RESULT_7;
	 else if(CPU_ADR == 18'h31020) CPU_RDATA <= RESULT_8;
	 else if(CPU_ADR == 18'h31024) CPU_RDATA <= RESULT_9;
	 else if(CPU_ADR == 18'h31000) CPU_RDATA <= RESULT_10;
	 else if(CPU_ADR == 18'h31004) CPU_RDATA <= RESULT_11;
	 else if(CPU_ADR == 18'h31008) CPU_RDATA <= RESULT_12;
	 else if(CPU_ADR == 18'h3100C) CPU_RDATA <= RESULT_13;
	 else if(CPU_ADR == 18'h31010) CPU_RDATA <= RESULT_14;
	 else if(CPU_ADR == 18'h31014) CPU_RDATA <= RESULT_15;
	 else if(CPU_ADR == 18'h31018) CPU_RDATA <= RESULT_16;
	 else if(CPU_ADR == 18'h3101C) CPU_RDATA <= RESULT_17;
	 else if(CPU_ADR == 18'h31020) CPU_RDATA <= RESULT_18;
	 else if(CPU_ADR == 18'h31024) CPU_RDATA <= RESULT_19;
	 else if(CPU_ADR == 18'h31000) CPU_RDATA <= RESULT_20;
	 else if(CPU_ADR == 18'h31004) CPU_RDATA <= RESULT_21;
	 else if(CPU_ADR == 18'h31008) CPU_RDATA <= RESULT_22;
	 else if(CPU_ADR == 18'h3100C) CPU_RDATA <= RESULT_23;
	 else if(CPU_ADR == 18'h31010) CPU_RDATA <= RESULT_24;
	 else if(CPU_ADR == 18'h31014) CPU_RDATA <= RESULT_25;
	 else if(CPU_ADR == 18'h31018) CPU_RDATA <= RESULT_26;
	 else if(CPU_ADR == 18'h3101C) CPU_RDATA <= RESULT_27;
	 else if(CPU_ADR == 18'h31020) CPU_RDATA <= RESULT_28;
	 else if(CPU_ADR == 18'h31024) CPU_RDATA <= RESULT_29;
	 else if(CPU_ADR == 18'h31000) CPU_RDATA <= RESULT_30;
	 else if(CPU_ADR == 18'h31004) CPU_RDATA <= RESULT_31;
	 else if(CPU_ADR == 18'h31008) CPU_RDATA <= RESULT_32;
	 else if(CPU_ADR == 18'h3100C) CPU_RDATA <= RESULT_33;
	 else if(CPU_ADR == 18'h31010) CPU_RDATA <= RESULT_34;
	 else if(CPU_ADR == 18'h31014) CPU_RDATA <= RESULT_35;
	 else if(CPU_ADR == 18'h31018) CPU_RDATA <= RESULT_36;
	 else if(CPU_ADR == 18'h3101C) CPU_RDATA <= RESULT_37;
	 else if(CPU_ADR == 18'h31020) CPU_RDATA <= RESULT_38;
	 else if(CPU_ADR == 18'h31024) CPU_RDATA <= RESULT_39;
	 else if(CPU_ADR == 18'h31000) CPU_RDATA <= RESULT_40;
	 else if(CPU_ADR == 18'h31004) CPU_RDATA <= RESULT_41;
	 else if(CPU_ADR == 18'h31008) CPU_RDATA <= RESULT_42;
	 else if(CPU_ADR == 18'h3100C) CPU_RDATA <= RESULT_43;
	 else if(CPU_ADR == 18'h31010) CPU_RDATA <= RESULT_44;
	 else if(CPU_ADR == 18'h31014) CPU_RDATA <= RESULT_45;
	 else CPU_RDATA <= 32'h00000000;
      end
   end


   

   
endmodule // cpu_if
