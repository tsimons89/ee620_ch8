package Test_v3_pkg;
   import Test_registry_pkg::*;
   import Driver_cbs_v3_pkg::*;
   import Test_base_pkg::*;
   import Driver_cbs_scb_pkg::*;
class Test_v3 extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_v3",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_cfg();
      env.build();
      begin
	 Driver_cbs_v3 dcv3 = new();
	 Driver_cbs_scb dcs = new(env.scb);
	 env.drv.cbs.push_back(dcv3);
	 env.drv.cbs.push_back(dcs);
      end
      env.run();
      env.wrap_up();
   endtask
endclass // Test_v3
endpackage
