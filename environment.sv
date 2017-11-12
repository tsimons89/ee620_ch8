package Environment_pkg;
   import Scoreboard_pkg::*;
   import Packet_pkg::*;
   import Generator_pkg::*;
   import Driver_pkg::*;
   

class Config;
   rand bit [31:0] run_for_n_trans;
   constraint num_trans {
      run_for_n_trans == 1000;
   }
endclass : Config

class Environment;
   mailbox #(Packet) gen2drv; 
   Generator gen;
   Driver drv;
   Config cfg;
   Scoreboard scb;
   
   function void build();
      // initialize mailbox
      gen2drv = new();
      
      // initialize transactors
      gen     = new(gen2drv);
      drv     = new(gen2drv);
      scb     = new();
   endfunction
   
   task run();
      fork
	 gen.run(cfg.run_for_n_trans);
	 drv.run(cfg.run_for_n_trans);
      join
   endtask
   
   task wrap_up();
      // fork
      // 	 gen.wrap_up();
      // 	 drv.wrap_up();
      // 	 scb.wrap_up();
      // join
   endtask
endclass : Environment

endpackage
