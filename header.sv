package Header_pkg;
class Header;
   const int unsigned VERSION = 4;
   const int unsigned IHL = 5;
   const int unsigned TOTAL_LENGTH = 28;
   rand bit [3:0] version,ihl;
   rand bit [7:0] type_of_service,time_to_live,protocol;
   rand bit [15:0] total_length,identification;
   rand bit [2:0] flags;
   rand bit [12:0] fragment_offset;
   rand bit [31:0] source_ip_address,destination_ip_address;
   bit [15:0] header_checksum;

   constraint c {
      version == VERSION;
      ihl == IHL;
      total_length == TOTAL_LENGTH;
      flags[0] == 0;
   }

   function void calc_header_checksum();
      header_checksum = {version, ihl, type_of_service} ^ 
			total_length  ^ identification ^ 
			{flags, fragment_offset} ^ 
			{time_to_live, protocol} ^ 
			source_ip_address[31:16] ^ 
			source_ip_address[15:0] ^
			destination_ip_address[31:16] ^ 
			destination_ip_address[15:0];
   endfunction

   function void display();
      $display("Version: %0d",version);
      $display("IHL: %0d",ihl);
      $display("Type of Service: %p",type_of_service);
      $display("Total Length: %0d",total_length);
      $display("Identification: %0d", identification);
      $display("Flags: %p",flags);
      $display("Fragment Offset: %0d",fragment_offset);
      $display("Time to Live: %0d",time_to_live);
      $display("Protocol: %0d",protocol);
      $display("Header Checksum: %h",header_checksum);
      $display("Source IP Address: %h",source_ip_address);
      $display("Destination IP Address: %h",destination_ip_address);
   endfunction // display

   function Header copy();
      copy = new this;
   endfunction
   
endclass
endpackage
