package Driver_cbs_scb_pkg;
   import Driver_cbs_pkg::*;
   import Packet_pkg::*;
class Driver_cbs_scb extends Driver_cbs;
   
   virtual task post_tx(ref Packet  p);
      $root.top.tb.tb.env.scb.compare_expected(p);
   endtask // post_tx
   
endclass
endpackage
