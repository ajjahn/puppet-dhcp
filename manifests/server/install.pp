# == Class dhcp::server::install
#
class dhcp::server::install inherits dhcp::server::params {
  package { $package_name:
    ensure => installed,
  }
}
