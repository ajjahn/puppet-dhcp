# == Class dhcp::server::service
#
class dhcp::server::service inherits dhcp::server::params {

  service { $service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['dhcp::server::config']
  }

}
