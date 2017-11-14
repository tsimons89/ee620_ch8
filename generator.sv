`define SV_RAND_CHECK(r) \
  do begin \
    if (!(r)) begin \
      $display("%s:%0d: Randomization failed \"%s\"", \
               `__FILE__, `__LINE__, `"r`"); \
      $finish; \
    end \
  end while (0)
    
package Generator_pkg;
   import Packet_pkg::*;
   import Packet_base_pkg::*;
class Generator;
   mailbox #(Packet) gen2drv;
   Packet blueprint;

   function new(mailbox #(Packet) gen2drv);
      this.gen2drv = gen2drv;
      blueprint = new();
   endfunction 

   
   task run(int num_packets = 100);
      `SV_RAND_CHECK(blueprint.randomize());
      repeat(num_packets) begin
	 Packet_base pb_copy = blueprint.copy();
	 Packet pkt_copy;
	 $cast(pkt_copy,pb_copy);
	 gen2drv.put(pkt_copy);
      end
   endtask
endclass // Generator
   
endpackage
