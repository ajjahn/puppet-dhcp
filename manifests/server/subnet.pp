# == Define dhcp::server::subnet
#
define dhcp::server::subnet ($broadcast,
                            $netmask,
                            $routers,
                            $range_begin,
                            $range_end,
                            $ensure=present,
                            $dns_servers=false,
                            $subnet_mask=false,
                            $domain_name=false,
                            $other_opts=false,
                            $next_server=false,
                            $filename=false) {

  $subnet = $name
  $context = '/files/etc/dhcp/dhcpd.conf'
  $config = "/etc/dhcp/subnets/${name}.conf"
  $include = "include[. = '${config}']"

  file { $config:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    content => template("${module_name}/subnet.conf.erb"),
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
