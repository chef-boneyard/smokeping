require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Smokeping daemon' do
  it 'is listening on port 80' do
    expect(port(80)).to be_listening
  end

  it 'has a running service of smokeping' do
    expect(service('smokeping')).to be_running
  end
end

describe command('curl -I localhost/smokeping.cgi') do
  its(:stdout) { should match('HTTP/1.1 200 OK') }
  its(:exit_status) { should eq(0) }
end

describe command('curl -I localhost/smokeping/images/smokeping.png') do
  its(:stdout) { should match('HTTP/1.1 200 OK') }
  its(:exit_status) { should eq(0) }
end

describe command('curl http://localhost/smokeping.cgi?target=Production.slave1') do
  its(:stdout) { should match('Production.slave2') }
  its(:exit_status) { should eq(0) }
end
