package packet_pkg;
   
   import header_class_pkg::*;
   import data_class_pkg::*;
   
   virtual class packet;

      function new();
	 super.new();
      endfunction	//	new
      
      function base_packet copy();
	 copy = new();
	 copy.header = header.copy();
	 copy.data = data.copy();
      endfunction // copy
      
      function void display();
	 header.display();
	 data.display();
      endfunction // display
      
      function void calc_header_checksum();

      endfunction
   endclass
endpackage
