describe 'Smokeping daemon' do
  it 'is listening on port 80' do
    expect(port(80)).to be_listening
  end

  it 'has a running service of smokeping' do
    expect(service('smokeping')).to be_running
  end
end

describe command('fping') do
  it { should exist }
end

describe command('curl') do
  it { should exist }
end

describe command('sendmail') do
  it { should exist }
end

describe command('rrdtool') do
  it { should exist }
end
