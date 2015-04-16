require 'spec_helper'

describe 'dhcp::server::service' do
  context "on a Debian OS Family" do
    context "on a Debian OS" do
      let(:facts) {{ :osfamily => 'Debian', :operatingsystem => 'Debian'}}
      it { should contain_service('isc-dhcp-server').
           with_require("Class[Dhcp::Server::Config]") }
    end

    context "on a Ubuntu OS" do
      let(:facts) {{ :osfamily => 'Debian', :operatingsystem => 'Ubuntu'}}
      it { should contain_service('isc-dhcp-server').
           with_require("Class[Dhcp::Server::Config]") }
    end
  end

  context "on a Redhat OS Family" do
    context "on a Redhat OS" do
      let(:facts) {{ :osfamily => 'Redhat', :operatingsystem => 'Redhat'}}
      it { should contain_service('dhcpd').
           with_require("Class[Dhcp::Server::Config]") }
    end

    context "on a Centos OS" do
      let(:facts) {{ :osfamily => 'Redhat', :operatingsystem => 'Centos'}}
      it { should contain_service('dhcpd').
           with_require("Class[Dhcp::Server::Config]") }
    end

    context "on a Scientific OS" do
      let(:facts) {{ :osfamily => 'Redhat', :operatingsystem => 'Scientific'}}
      it { should contain_service('dhcpd').
           with_require("Class[Dhcp::Server::Config]") }
    end
  end

  context "on a Debian OS Family" do
    let(:facts) {{ :osfamily => 'Foo', :operatingsystem => 'Bar'}}
    it { should raise_error(/Unsupported operating system/) }
  end
end
