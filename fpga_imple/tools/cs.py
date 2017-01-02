"""
always @(posedge CLK or negedge RESET_X)begin
      if(RESET_X == 0)begin
	 SRAM_SEL[0] <= 0;
      end if (CPU_ADR[17:12] == 6'h00)begin
	 SRAM_SEL[0] <= 1;
      end else begin
	 SRAM_SEL[0] <= 0;
      end
   end
"""

for i in range(45):
    print("always @(posedge CLK or negedge RESET_X)begin")
    print("  if(RESET_X == 0)begin")
    print("    SRAM_SEL[%d] <= 0;" % i)
    print("   end if (CPU_ADR[17:12] == 6'h%02x)begin" % i)
    print("	 SRAM_SEL[%d] <= 1;" % i)
    print("  end else begin")
    print("	 SRAM_SEL[%d] <= 0;" % i)
    print("  end")
    print("end")
    print("")
    
