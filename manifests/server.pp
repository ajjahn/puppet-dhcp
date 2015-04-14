# == Class dhcp::server
#
class dhcp::server {
  include dhcp::server::install
  include dhcp::server::config
  include dhcp::server::service
}
