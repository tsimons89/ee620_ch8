`define SV_RAND_CHECK(r) \
  do begin \
    if (!(r)) begin \
      $display("%s:%0d: Randomization failed \"%s\"", \
               `__FILE__, `__LINE__, `"r`"); \
      $finish; \
    end \
  end while (0)

package Driver_cbs_v3_pkg;
   import packet_pkg::*;
   import Driver_cbs_pkg::*;
   
virtual class Driver_cbs_v3;
   
   virtual task pre_tx(ref Packet p, ref bit drop);
      `SV_RAND_CHECK(p.randomize() with {version dist {4:=4,3:=1};})
   endtask

endclass
endpackage
