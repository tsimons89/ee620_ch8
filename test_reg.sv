package Test_registry_pkg;
   import Test_base_pkg::*;
class Test_registry;
   static Test_base registry[string];

   static function void register(string name, Test_base t);
      registry[name] = t;
   endfunction // register

   static function Test_base get_test();
      string name;
      if(!$value$plusargs("TESTNAME=%s",name))
	$display("ERROR: No +TESTNAME switch found");
      return registry[name];
   endfunction // get_test
endclass // Test_registry
endpackage
