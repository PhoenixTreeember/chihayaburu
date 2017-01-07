`timescale 1ns/1ns

module sim_a_tb();


   reg 	 CLK;
   reg 	 RESET_X;
   reg 	 WR;
   reg 	 RD;
   reg [17:0] ADR;
   reg [31:0] WDATA;
   wire [31:0] RDATA;
   



   // clkの生成
   parameter PERIOD = 10.0; 
   
   always # (PERIOD/2) CLK = ~CLK;
   softmax_top U0 
     (
      .CLK(CLK),
      .RESET_X(RESET_X),
      .WR(WR),
      .RD(RD),
      .ADR(ADR),
      .WDATA(WDATA),
      .RDATA(RDATA)   
   );


   initial begin
      #1 CLK = 0;
     
   end


   initial begin
      #1 RESET_X = 1; ADR = 0; WR = 0; RD = 0; WDATA = 0;
      #(PERIOD * 2) RESET_X = 0;
      #(PERIOD * 5) RESET_X = 1;
      
      
      
      #1000 $finish;
   end

   
   task write;
      input [31:o] adr_i;
      input [31:0] data_i;
      begin
	 WR = 1; ADR = adr_i; WDATA = data_i;
	 #(PERIOD)
	 WR = 0;
	 #(PERIOD);
      end
   endtask //
   


   
endmodule // sim_a_tb
