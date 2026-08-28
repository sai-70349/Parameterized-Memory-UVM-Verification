module tb;
	
	reg clk,res;

	mem_intrf pif(clk,res); 
	
	memory dut (.clk(pif.clk),
				.res(pif.res),
				.wr_rd(pif.wr_rd),
				.valid(pif.valid),
				.addr(pif.addr),
				.wdata(pif.wdata),
				.rdata(pif.rdata),
				.ready(pif.ready));

	always #5 clk = ~clk;

	initial begin

		// uvm based mem_intrf registration to the factory
		uvm_config_db#(virtual mem_intrf)::set(null,"*","vif",pif);

		clk = 0;
		res = 1;
		repeat (2) @(posedge clk);
		res = 0;
	end

	initial begin
		run_test("test_1wr_1rd");
	end

endmodule
