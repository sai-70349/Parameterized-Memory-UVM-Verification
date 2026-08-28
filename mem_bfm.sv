class mem_drv extends uvm_driver#(mem_tx);
	
	`uvm_component_utils(mem_drv)

	virtual mem_intrf vif;

	function new(string name="mem_drv",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(virtual mem_intrf)::get(this,"","vif",vif); // getting the virtual interface from factory
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
			req.print();
			`uvm_info(get_full_name(),"mem_drv transaction",UVM_NONE);
			seq_item_port.item_done();
		end
	endtask

	task drive_tx(input mem_tx tx);

		@( vif.bfm_cb);
		vif.bfm_cb.wr_rd <= tx.wr_rd;
		vif.bfm_cb.addr  <= tx.addr;
		vif.bfm_cb.wdata <= tx.wdata;
		vif.bfm_cb.valid <= 1;
		wait(vif.bfm_cb.ready==1);

		if(tx.wr_rd==0) begin
		@( vif.bfm_cb);
		tx.rdata = vif.bfm_cb.rdata;
		end

		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd<=0;
		vif.bfm_cb.addr <=0;
		vif.bfm_cb.wdata<=0;
		vif.bfm_cb.valid<=0;

	endtask

endclass
