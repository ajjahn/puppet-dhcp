require 'spec_helper'

describe 'dhcp::server::host' do
  let(:title) { 'foobar'  }
  let(:params) { {  :address => 'foobar', :hwaddress => 'foobar' }  }

  it { should contain_file('/etc/dhcp/hosts/foobar.conf') }
end
