package Packet_base_pkg;
   import Header_pkg::*;
   import Payload_pkg::*;
   
   virtual class Packet_base;
      rand Header header;
      rand Payload payload;
      
      static int count;	//	Number	of	instance	created
      int id;	//	Unique	transaction	id
      function new();
		 id = count++;	//	Give	each	object	a	unique	ID
		 header = new();
		 payload = new();
      endfunction	//	new
      
      pure virtual function Packet_base copy();
      pure virtual function void display();
      pure virtual function void calc_header_checksum();
   endclass
endpackage
