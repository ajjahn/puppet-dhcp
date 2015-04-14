# Puppet DHCP Module

[![Build Status](https://travis-ci.org/ajjahn/puppet-dhcp.png?branch=master)](https://travis-ci.org/ajjahn/puppet-dhcp)

Module for provisioning Internet Systems Consortium DHCP Server (dhcpd)

Tested on Ubuntu 12.04, patches to support other operating systems are welcome.

## Installation

Clone this repo to your Puppet modules directory

    git clone git://github.com/ajjahn/puppet-dhcp.git dhcp

or

    puppet module install ajjahn/dhcp

For Ubuntu 11.04 install the following package:

    http://archive.ubuntu.com/ubuntu/pool/main/a/augeas/augeas-lenses_0.10.0-0ubuntu4_all.deb

## Usage

Tweak and add the following to your site manifest:

    node 'server.example.com' {

      include dhcp::server

      dhcp::server::subnet { '192.168.1.0':
        netmask     => '255.255.255.0',
        routers     => '192.168.1.1',
        broadcast   => '192.168.1.255',
        range_begin => '192.168.1.100',
        range_end   => '192.168.1.200',
        domain_name => 'example.com',
        dns_servers => ['8.8.8.8', '8.8.4.4']
      }

      dhcp::server::host {'example-host-name':
        address   => '192.168.1.50',
        hwaddress => '00:3a:99:eb:66:26',
      }

    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This module is released under the MIT license:

* [http://www.opensource.org/licenses/MIT](http://www.opensource.org/licenses/MIT)
