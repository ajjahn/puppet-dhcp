# == Class dhcp::server::install
#
class dhcp::server::install inherits dhcp::server::params {
  package { $dhcp::server::params::package_name:
    ensure => installed,
  }
}
