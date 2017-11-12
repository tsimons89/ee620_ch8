package Test_good_pkg;
   import Test_registry_pkg::*;
   import Test_base_pkg::*;
   import Driver_cbs_scb_pkg::*;
class Test_good extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_good",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_cfg();
      env.build();
      begin
	 Driver_cbs_scb dcs = new(env.scb);
	 env.drv.cbs.push_back(dcs);
      end
      env.run();
      env.wrap_up();
   endtask
endclass // Test_good
endpackage
