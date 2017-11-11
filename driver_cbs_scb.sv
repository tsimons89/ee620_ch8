package Driver_cbs_scb_pkg;
   import Packet_pkg::*;
   import Driver_cbs_pkg::*;
virtual class Driver_cbs;
   
   virtual task post_tx(ref packet p);
      $root.top.tb.tb.env.scb.compare_expected(p);
   endtask // post_tx
   
endclass
endpackage
