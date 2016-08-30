require 'spec_helper'

describe 'default installation' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('smokeping::default') }

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  it 'installs packages' do
    expect(chef_run).to install_package 'smokeping'
    expect(chef_run).to install_package 'fping'
    expect(chef_run).to install_package 'curl'
    expect(chef_run).to install_package 'fping'
    expect(chef_run).to install_package 'libauthen-radius-perl'
    expect(chef_run).to install_package 'libnet-ldap-perl'
    expect(chef_run).to install_package 'libnet-dns-perl'
    expect(chef_run).to install_package 'libio-socket-ssl-perl'
    expect(chef_run).to install_package 'libnet-telnet-perl'
    expect(chef_run).to install_package 'libsocket6-perl'
    expect(chef_run).to install_package 'libio-socket-inet6-perl'
    expect(chef_run).to install_package 'sendmail'
    expect(chef_run).to install_package 'rrdtool'
  end

  it 'includes apache2 recipe' do
    expect(chef_run).to include_recipe 'apache2'
    expect(chef_run).to include_recipe 'apache2::mod_rewrite'
  end

  it 'includes perl recipe' do
    expect(chef_run).to include_recipe 'perl'
  end
end
