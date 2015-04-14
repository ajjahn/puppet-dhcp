# == Define dhcp::server::host
#
define dhcp::server::host($address,
                          $hwaddress,
                          $ensure=present,
                          $options=false,
                          $next_server=false,
                          $filename=false ) {

  $context = '/files/etc/dhcp/dhcpd.conf'
  $config = "/etc/dhcp/hosts/${name}.conf"
  $include = "include[. = '${config}']"

  file { $config:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    content => template("${module_name}/host.conf.erb"),
    require => Class['dhcp::server::config'],
    notify  => Class['dhcp::server::service']
  }

  augeas { "include-${name}.conf":
    context => $context,
    changes => $ensure ? {
      present => "set ${include} ${config}",
      default => "rm ${include}",
    },
    require => File[$config]
    }
  }
