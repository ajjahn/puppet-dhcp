class dhcp::server::install {
  
  package { "isc-dhcp-server":
    ensure => installed,
  }
  
}