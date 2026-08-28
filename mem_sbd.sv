class mem_sbd extends uvm_scoreboard;

	`uvm_component_utils(mem_sbd)

	uvm_analysis_imp #(mem_tx,mem_sbd) imp_port;

	mem_tx tx;
	int asso[*];

	function new(string name="mem_sbd", uvm_component parent=null);
		super.new(name,parent);
		imp_port = new("imp_port",this);
	endfunction

	virtual function void write(mem_tx t);
		$cast(tx,t);
		if(tx.wr_rd==1'b1)
			asso[tx.addr] = tx.wdata;
		else begin 
			if(tx.rdata == asso[tx.addr]) mem_common::matchings++;
			else mem_common::mismatchings++;
		end
	endfunction

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		if(mem_common::matchings != 0 && mem_common::mismatchings == 0)begin
			$display("*********** TEST PASSED ***************");
			$display("matchings=%0d and mismatchings=%0d",mem_common::matchings,mem_common::mismatchings);
		end
		else begin
			$display("*********** TEST FAILED ***************");
			$display("matchings=%0d and mismatchings=%0d",mem_common::matchings,mem_common::mismatchings);
		end
	endfunction

endclass
