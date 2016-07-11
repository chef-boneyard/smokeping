#
# Cookbook Name:: smokeping
# Recipe:: default
#
# Copyright 2013-2014, Limelight Networks, Inc.
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

case node['platform_family']
when 'debian'
  include_recipe 'perl'

  %w(fping smokeping curl libauthen-radius-perl libnet-ldap-perl libnet-dns-perl libio-socket-ssl-perl libnet-telnet-perl libsocket6-perl libio-socket-inet6-perl sendmail rrdtool).each do |pkg|
    package pkg do
      action :install
    end
  end

  service 'smokeping' do
    supports status: true, restart: true, reload: true
    action :nothing
  end

  template 'smokeping init.d' do
    path '/etc/init.d/smokeping'
    source 'smokeping.init.erb'
    owner 'root'
    group 'root'
    mode '0755'
    notifies :enable, 'service[smokeping]'
    notifies :start, 'service[smokeping]'
  end
else
  package 'smokeping' do
    action :install
  end

  service 'smokeping' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
  end

  directory '/etc/smokeping/config.d' do
    owner 'root'
    group 'root'
    mode 0755
    action :create
  end
end

template "#{node['smokeping']['etc_dir']}/config" do
  source 'config.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[smokeping]'
end

%w(pathnames Database Presentation Probes).each do |configdfile|
  template "#{node['smokeping']['etc_dir']}/config.d/#{configdfile}" do
    source "#{configdfile}.erb"
    owner 'root'
    group 'root'
    mode 0644
    notifies :reload, 'service[smokeping]'
  end
end

# Create empty Target and Slave list files to prevent smokeping from failing to start on initial converge
file "#{node['smokeping']['etc_dir']}/config.d/Targets" do
  action :create_if_missing
  content '*** Targets ***'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[smokeping]'
end

file "#{node['smokeping']['etc_dir']}/config.d/Slaves" do
  action :create_if_missing
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[smokeping]'
end
