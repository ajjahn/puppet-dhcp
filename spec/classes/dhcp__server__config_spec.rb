require 'spec_helper'

describe 'dhcp::server::config' do
  it { should contain_file('/etc/dhcp/dhcpd.conf').
       with_owner('root').
       that_requires('File[/etc/dhcp]') }

  it { should contain_file('/etc/dhcp').with_ensure('directory') }
  it { should contain_file('/etc/dhcp/hosts').with_ensure('directory').
       that_requires('File[/etc/dhcp]') }
  it { should contain_file('/etc/dhcp/subnets').with_ensure('directory').
       that_requires('File[/etc/dhcp]') }
end
