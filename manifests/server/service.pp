# == Class dhcp::server::service
#
class dhcp::server::service {

  case $::operatingsystem {
    ubuntu, debian: {
      $service_name = 'isc-dhcp-server'
    }
    centos, redhat, Scientific: {
      $service_name = 'dhcpd'
    }
    default: {
      fail('Unsupported operating system')
    }
  }

  service { $service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['dhcp::server::config']
  }

}
