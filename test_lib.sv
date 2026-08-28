class mem_base_test extends uvm_test;
	
	mem_env env;

	`uvm_component_utils(mem_base_test)

	function new(string name="mem_base_test", uvm_component parent=null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		$display("mem_base_test build phase is happened");
		env = new("env",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		$display("mem_base_test connect phase is happened");
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

endclass

class test_1wr extends mem_base_test;

	`uvm_component_utils(test_1wr)

	function new(string name="", uvm_component parent=null);
		super.new(name,parent);
	endfunction

	task run_phase(uvm_phase phase);
		seq_1wr wr_seq;
		wr_seq = seq_1wr::type_id::create("wr_seq",this);
		phase.raise_objection(this);
		wr_seq.start(env.agent.sqr);
		//phase.phase_done.set_drain_time(this,200);
		phase.drop_objection(this);
	endtask

endclass

class test_5wr extends mem_base_test;
	
	`uvm_component_utils(test_5wr)

	function new(string name="test_5wr",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	task run_phase(uvm_phase phase);
		seq_5wr wr5_seq;
		wr5_seq = seq_5wr::type_id::create("wr5_seq",this);
		phase.raise_objection(this);
		wr5_seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass

class test_1wr_1rd extends mem_base_test;
	
	`uvm_component_utils(test_1wr_1rd)

	function new(string name="test_1wr_1rd",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	task run_phase(uvm_phase phase);
		seq_1wr_1rd wr1_rd1_seq;
		wr1_rd1_seq = seq_1wr_1rd::type_id::create("wr1_rd1_seq",this);
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,20);
		wr1_rd1_seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass

class test_5wr_5rd extends mem_base_test;
	
	`uvm_component_utils(test_5wr_5rd)

	function new(string name="test_1wr_1rd",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	task run_phase(uvm_phase phase);
		seq_5wr_5rd wr5_rd5_seq;
		wr5_rd5_seq = seq_5wr_5rd::type_id::create("wr5_rd5_seq",this);
		phase.raise_objection(this);
		wr5_rd5_seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass


class test_n_wr_n_rd extends mem_base_test;
	
	`uvm_component_utils(test_n_wr_n_rd)

	function new(string name="test_nwr_nrd",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_resource_db#(int)::set("*","N",140,this);
	endfunction

	task run_phase(uvm_phase phase);
		seq_nwr_nrd n_wr_n_rd_seq;
		n_wr_n_rd_seq = seq_nwr_nrd::type_id::create("n_wr_n_rd_seq",this);
		phase.raise_objection(this);
		n_wr_n_rd_seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass
