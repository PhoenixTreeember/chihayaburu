
num = 28 * 28

for i in range(num):
#    print("output reg [7:0] RDATA_%02d," % i)
#    print("if(local_adr==%d) RDATA_%02d <= WDATA;" % (i, i))
    print("assign RDATA[%d:%d] = RDATA_%02d;" % ((i+1) * 8 -1, i*8, i))



