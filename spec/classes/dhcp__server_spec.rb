require 'spec_helper'

describe 'dhcp::server' do
  let(:facts) {{ :osfamily => 'Debian', :operatingsystem => 'Debian'}}

  it { should contain_class('dhcp::server::install') }
  it { should contain_class('dhcp::server::config') }
  it { should contain_class('dhcp::server::service') }

end
