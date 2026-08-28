module memory(clk,res,wr_rd,valid,addr,wdata,rdata,ready);

	input clk,res,wr_rd,valid;
	input [`ADDR_WIDTH-1:0] addr;
	input [`WIDTH-1:0] wdata;
	output reg [`WIDTH-1:0] rdata;
	output reg ready;

	reg [`WIDTH-1:0] mem [0:`DEPTH-1];

	integer i;

	always @(posedge clk)begin
		if(res==1'b1)begin
			rdata = 0;
			ready = 0;
			for(i=0;i<`DEPTH;i=i+1) mem[i] = 0;
		end
		else begin
			if(valid==1)begin
				ready=1;
				if(wr_rd==1'b1)begin
					mem[addr] = wdata;
				end
				else begin
					rdata = mem[addr];
				end
			end
			else ready = 0;
		end
	end
	
endmodule
