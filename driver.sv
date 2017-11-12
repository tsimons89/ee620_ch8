package Driver_pkg;
   import Packet_pkg::*;
   import Driver_cbs_pkg::*;
   import Packet_pkg::*;
class Driver;
   mailbox #(Packet) gen2drv;
   Driver_cbs cbs[$];

   function new(mailbox #(Packet) gen2drv);
     this.gen2drv = gen2drv;
   endfunction // new

   task run(int num_packets = 100);
      Packet p;
      repeat(num_packets) begin
	 gen2drv.peek(p);
	 foreach(cbs[i]) begin
	    cbs[i].pre_tx(p);
	    transmit();
	    cbs[i].post_tx(p);
	 end
	 gen2drv.get(p);
      end
   endtask // run

   task transmit();
      #10ns;
   endtask

endclass // Driver
endpackage // Driver_pkg
   
