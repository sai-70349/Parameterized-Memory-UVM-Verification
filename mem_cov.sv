class mem_cov extends uvm_subscriber#(mem_tx);
	
	`uvm_component_utils(mem_cov)

	mem_tx tx;

	covergroup CG;
		WR_RD:coverpoint tx.wr_rd{
			bins WRITES = {1'b1};
			bins READS =  {1'b0};
		}
		ADDR:coverpoint tx.addr{
			option.auto_bin_max = 32;
		}
	endgroup


	function new(string name="mem_cov", uvm_component parent=null);
		super.new(name,parent);
		CG = new();
	endfunction


	virtual function void write(mem_tx t);
		$cast(tx,t);
		CG.sample();
		tx.print();
		`uvm_info(get_full_name(),"mem_cov transaction",UVM_NONE);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		$display("mem_subscriber is happened");
	endfunction

endclass
