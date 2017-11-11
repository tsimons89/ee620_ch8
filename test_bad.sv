import Test_registry_pkg::*;
class Test_bad extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_bad",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.gen_config();
      env.build();
      begin
	 Packet_bad bad = new();
	 env.gen.blueprint = bad;
      end
      env.run();
      env.wrap_up();
   endtask
endclass // Test_bad

Test_bad Test_bad_handel = new();

