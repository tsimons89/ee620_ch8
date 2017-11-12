package Driver_cbs_scb_pkg;
   import Driver_cbs_pkg::*;
   import Packet_pkg::*;
   import scoreboard_pkg::*;
class Driver_cbs_scb extends Driver_cbs;
   Scoreboard scb;

   function new(Scoreboard scb);
      this.scb = scb;
   endfunction
   
   virtual task post_tx(ref Packet p);
      scb.compare_expected(p);
   endtask // post_tx
   
endclass
endpackage
