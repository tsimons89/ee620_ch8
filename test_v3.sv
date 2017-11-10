import TestRegistry_pkg::*;
class Test_v3 extends TestBase;
   function new();
      env = new();
      TestRegistry::register("Test_v3",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_config();
      env.build();
      begin
	 Driver_cbs_v3 dcv3 = new();
	 env.drv.cbs.push_back(dcv3);
      end
      env.run();
      env.wrap_up();
   endtask
endclass // Test_v3

Test_v3 Test_v3_handel = new();
