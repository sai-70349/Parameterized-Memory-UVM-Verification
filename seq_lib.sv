class mem_base_seq extends uvm_sequence#(mem_tx);

	`uvm_object_utils(mem_base_seq)

	function new(string name="mem_base_seq");
		super.new(name);
	endfunction

endclass

class seq_1wr extends mem_base_seq;

	`uvm_object_utils(seq_1wr)

	function new(string name="seq_1wr");
		super.new(name);
	endfunction

	task body();
		`uvm_do_with(req,{req.wr_rd==1'b1;})
		req.print();
	endtask

endclass

class seq_5wr extends mem_base_seq;

	`uvm_object_utils(seq_5wr)

	function new(string name="seq_5wr");
		super.new(name);
	endfunction

	task body();
		`uvm_do_with(req,{req.wr_rd==1'b1;})
		req.print();
	endtask

endclass


class seq_1wr_1rd extends mem_base_seq;
	
	mem_tx temp;

	`uvm_object_utils(seq_1wr_1rd)

	function new(string name="seq_1wr_1rd");
		super.new(name);
	endfunction

	task body();
			`uvm_do_with(req,{req.wr_rd==1'b1;})
			req.print();
			temp = new req;
			`uvm_do_with(req,{req.wr_rd==1'b0; req.addr==temp.addr; req.wdata==0;})
			req.print();
	endtask

endclass

class seq_5wr_5rd extends mem_base_seq;
	
	mem_tx temp,txQ[$];

	`uvm_object_utils(seq_5wr_5rd)

	function new(string name="seq_5wr_5rd");
		super.new(name);
	endfunction

	task body();
		repeat(5)begin
			`uvm_do_with(req,{req.wr_rd==1'b1;})
			req.print();
			temp = new req;
			txQ.push_back(temp);
		end
		repeat (5) begin
			temp=txQ.pop_front();
			`uvm_do_with(req,{req.wr_rd==1'b0; req.addr==temp.addr; req.wdata==0;})
			req.print();
		end
	endtask

endclass

class seq_nwr_nrd extends mem_base_seq;
	
	mem_tx temp,txQ[$];

	`uvm_object_utils(seq_nwr_nrd)

	int N;

	function new(string name="seq_nwr_nrd");
		super.new(name);
	endfunction
	

	task body();
		if( !uvm_resource_db#(int)::read_by_name("*","N",N,null))
			`uvm_fatal("RESOURCE","resource not found")
		else 
			`uvm_info("RESOURCE",$sformatf("resource found N=%0d",N),UVM_LOW)
		repeat(N)begin
			`uvm_do_with(req,{req.wr_rd==1'b1;})
			req.print();
			temp = new req;
			txQ.push_back(temp);
		end
		repeat (N) begin
			temp = txQ.pop_front();
			`uvm_do_with(req,{req.wr_rd==1'b0; req.addr==temp.addr; req.wdata==0;})
			req.print();
		end
	endtask

endclass

