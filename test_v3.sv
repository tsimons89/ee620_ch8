import Test_registry_pkg::*;
import Driver_cbs_v3::*;
class Test_v3 extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_v3",this);
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
