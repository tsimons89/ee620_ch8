`define SV_RAND_CHECK(r) \
  do begin \
    if (!(r)) begin \
      $display("%s:%0d: Randomization failed \"%s\"", \
               `__FILE__, `__LINE__, `"r`"); \
      $finish; \
    end \
  end while (0)

package Driver_cbs_v3_pkg;
   import Driver_cbs_pkg::*;
   import Packet_pkg::*;
class Driver_cbs_v3 extends Driver_cbs;

   task other_t(Packet p);
      p.display();
   endtask
   task pre_tx(ref Packet p);
      `SV_RAND_CHECK(p.randomize() with {header.version dist {4:=99,3:=1};});
   endtask

endclass
endpackage
