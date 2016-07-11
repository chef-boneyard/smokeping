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

include_recipe 'apache2'
include_recipe 'apache2::mod_cgi'
include_recipe 'apache2::mod_rewrite'

file '/etc/smokeping/apache2.config' do
  action :delete
end

template "#{node['apache']['dir']}/sites-available/smokeping.conf" do
  source 'apache2.erb'
  mode '0644'
  notifies :reload, 'service[apache2]'
end

apache_site 'smokeping' do
  enable true
end

apache_site '000-default' do
  enable false
end
