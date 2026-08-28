class mem_env extends uvm_env;
	
	mem_agent agent;
	mem_sbd sbd;

	`uvm_component_utils(mem_env)

	function new(string name="mem_env", uvm_component parent=null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent = mem_agent::type_id::create("agent",this); // uvm style
		sbd   = mem_sbd::type_id::create("sbd",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		agent.mon.ap_port.connect(sbd.imp_port);
	endfunction

endclass
