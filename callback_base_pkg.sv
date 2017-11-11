package Driver_cbs_pkg;
   import packet_pkg::*;
virtual class Driver_cbs;
   
   virtual task pre_tx(ref packet tr, ref bit drop);
   endtask

   virtual task post_tx(ref packet tr);
   endtask
endclass
endpackage
