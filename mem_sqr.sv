class mem_sqr extends uvm_sequencer#(mem_tx);

	`uvm_component_utils(mem_sqr)

	function new(string name="mem_sqr", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		$display("mem_sqr is happened");
	endfunction

endclass
