package Test_bad_pkg;
   import Test_registry_pkg::*;
   import Test_base_pkg::*;
   import Packet_bad_pkg::*;
class Test_bad extends Test_base;
   function new();
      env = new();
      Test_registry::register("Test_bad",this);
   endfunction // new

   virtual task run_test();
      $display("%m");
      env.build();
      begin
	 Packet_bad bad = new();
	 env.gen.blueprint = bad;
      end
      env.run();
      env.wrap_up();
   endtask
endclass // Test_bad
endpackage

