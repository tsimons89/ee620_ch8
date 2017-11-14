package Test_bad_pkg;
   import Test_registry_pkg::*;
   import Test_base_pkg::*;
   import Packet_bad_pkg::*;
   import Driver_cbs_scb_pkg::*;
class Test_bad extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_bad",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_cfg();
      env.build();
      begin
	 Packet_bad bad = new();
	 Driver_cbs_scb dcs = new(env.scb);
	 env.gen.blueprint = bad;
	 $display("set bad to blueprint");
	 env.drv.cbs.push_back(dcs);
      end
      env.run();
      env.wrap_up();
   endtask
endclass // Test_bad
endpackage

