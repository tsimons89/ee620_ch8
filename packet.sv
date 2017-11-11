package packet_pkg;
   import Packet_base_pkg::*;
   import Header_pkg::*;
   import Payload_pkg::*;
   
class Packet extends Packet_base;

   function new();
      super.new();
   endfunction	//	new
   
   function Packet copy();
      copy = new this;
      copy.header = header.copy();
      copy.payload = payload.copy();
   endfunction // copy
   
   function void display();
      header.display();
      data.display();
   endfunction // display
   
   function void calc_header_checksum();
      header.calc_header_checksum();
   endfunction
endclass
endpackage
