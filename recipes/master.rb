#
# Cookbook Name:: smokeping
# Recipe:: master
#
# Copyright 2014, Bao Nguyen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

etc_dir = node['smokeping']['etc_dir']
secret_path = "#{etc_dir}/slavesecrets.conf"
secret = node['smokeping']['slave_secret']

if node['smokeping']['master_mode']
  # Will not support Chef Solo, use Chef Zero instead
  #slaves = search(:node, 'recipes:smokeping::slave*')
  slaves = search(:node, 'name:slave1')
  template "#{etc_dir}/config.d/Slave" do
    source "Slave.erb"
    mode "0644"
    variables(
      :slaves => slaves
    )
  end

  # merge the slaves list with a single secret
  # get an Array of fqdn, merge each item with a secret and return a hash
  slavesecrets = slaves.map{|n| n['fqdn']}.reduce({}){|n| n.merge({n => secret})}

  template secret_path do
    source "slavesecrets.conf.erb"
    mode "0644"
    variables(
      :secrets => slavesecrets,
      :secret_path => secret_path
    )
  end
end

%w(General Alerts).each do |config|
  template "#{etc_dir}/config.d/#{config}" do
    source "#{config}.erb"
    mode '0644'
    variables(
      :alerts => node['smokeping']['alerts']
    )
    notifies :restart, 'service[smokeping]', :delayed
  end
end

