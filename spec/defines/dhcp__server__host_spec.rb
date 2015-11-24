require 'spec_helper'

describe 'dhcp::server::host' do
  let :title do
    'foobar'
  end
  let :params do
    {
      :address => 'foobar', :hwaddress => 'foobar'
    }
  end

  it { should contain_file('/etc/dhcp/hosts/foobar.conf') }
end
