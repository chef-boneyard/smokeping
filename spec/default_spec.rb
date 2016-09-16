require 'spec_helper'

describe 'default installation' do
  cached(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('smokeping::default') }

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  it 'installs packages' do
    expect(chef_run).to install_package(%w(fping smokeping curl libauthen-radius-perl libnet-ldap-perl libnet-dns-perl libio-socket-ssl-perl libnet-telnet-perl libsocket6-perl libio-socket-inet6-perl sendmail rrdtool))
  end

  it 'includes apache2 recipe' do
    expect(chef_run).to include_recipe 'apache2'
    expect(chef_run).to include_recipe 'apache2::mod_rewrite'
  end

  it 'includes perl recipe' do
    expect(chef_run).to include_recipe 'perl'
  end
end
