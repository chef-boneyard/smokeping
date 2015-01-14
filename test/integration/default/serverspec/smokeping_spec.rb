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
