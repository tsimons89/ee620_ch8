package base_packet_pkg;
   virtual class base_packet;
      rand header_class header;
      rand data_class data;
      
      static int count;	//	Number	of	instance	created
      int id;	//	Unique	transaction	id
      function new();
		 id = count++;	//	Give	each	object	a	unique	ID
		 header = new();
		 data = new();
      endfunction	//	new
      
      pure virtual function base_packet copy();
      pure virtual function void display();
      pure virtual function void calc_header_checksum();
   endclass
endpackage
