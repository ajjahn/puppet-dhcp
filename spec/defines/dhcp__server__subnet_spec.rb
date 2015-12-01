require 'spec_helper'

describe 'dhcp::server::subnet' do
  let :title do
    'subnet_foo'
  end
  let :params do
    {
      :broadcast => '10.255.255.255',
      :netmask => '255.0.0.0',
      :routers => ['10.0.0.1'],
      :range_begin => '10.0.0.51',
      :range_end => '10.0.0.100'
    }
  end

  it { should contain_file('/etc/dhcp/subnets/subnet_foo.conf') }
end
