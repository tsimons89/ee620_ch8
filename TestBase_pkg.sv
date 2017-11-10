package TestBase_pkg;
	virutal class TestBase;
		Environment env;
		pure virtual taks run_test();
		funciton new();
			env = new();
		endfunction
	endclass
endpackage
