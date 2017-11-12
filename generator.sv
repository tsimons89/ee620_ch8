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
class Generator;
   mailbox #(Packet) gen2drv;
   Packet blueprint;

   function new(mailbox #(Packet) gen2drv);
      this.gen2drv = gen2drv;
      blueprint = new();
   endfunction 

   task run(int num_packets = 100);
      repeat(num_packets) begin
	 `SV_RAND_CHECK(blueprint.randomize());
	 gen2drv.put(blueprint.cpy());
      end
   endtask
endclass // Generator
   
endpackage
