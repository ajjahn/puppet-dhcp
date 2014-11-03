class dhcp::server::install {

  case $::operatingsystem {
    ubuntu, debian: {
      $package_name = 'isc-dhcp-server'
    }
    centos, redhat, Scientific, OracleLinux: {
      $package_name = 'dhcp'
    }
    default: {
      fail('Unsupported operating system')
    }
  }

  package { $package_name:
    ensure => installed,
  }
}
