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

   task pre_tx(ref Packet p);
      p.header.constraint_mode(0);
      `SV_RAND_CHECK(p.header.randomize(version) with {version dist {3:=1,4:=99};});
   endtask

endclass
endpackage
