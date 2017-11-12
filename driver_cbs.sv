package Driver_cbs_pkg;
   import Packet_pkg::*;
virtual class Driver_cbs;
   
   virtual task pre_tx(ref Packet p);
   endtask

   virtual task post_tx(ref Packet p);
   endtask
endclass
endpackage
