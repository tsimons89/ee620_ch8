package header_pkg;
class header;
   bit [3:0] version,ihl,;
   bit [7:0] type_of_service,time_to_live,protocol;
   bit [15:0] total_length,identification;
   bit [2:0] flags;
   bit [12:0] fragment_offset;
   bit [31:0] source_ip_address,destination_address;

endclass
endpackage
