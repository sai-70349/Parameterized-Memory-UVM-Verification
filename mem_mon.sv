class mem_mon extends uvm_monitor;

	mem_tx tx;

	uvm_analysis_port #(mem_tx) ap_port;

	`uvm_component_utils(mem_mon)

	virtual mem_intrf vif;

	function new(string name="mem_mon", uvm_component parent=null);
		super.new(name,parent);
		ap_port = new("ap_port",this);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(virtual mem_intrf)::get(this,"","vif",vif);
		tx = mem_tx::type_id::create("tx",this);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			@(vif.mon_cb);
			if(vif.mon_cb.valid == 1 && vif.mon_cb.ready == 1)begin
				tx.wr_rd = vif.mon_cb.wr_rd;
				tx.addr  = vif.mon_cb.addr;
				tx.wdata = vif.mon_cb.wdata;
				if(tx.wr_rd == 0)begin
					@(vif.mon_cb);
					tx.rdata = vif.mon_cb.rdata;
				end
				ap_port.write(tx);
				tx.print();
				`uvm_info(get_full_name(),"mem_mon transaction",UVM_NONE);
			end
		end
	endtask

endclass
