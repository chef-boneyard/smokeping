#
# Cookbook Name:: smokeping
# Recipe:: slave
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

include_recipe 'smokeping::_packages'

if node['smokeping']['slave_mode']
  # find the other smokeping servers
  servers = search(:node, 'recipes:smokeping* AND tags:smokeping_master')
  secret = node['smokeping']['slave_secret']

  secret_path = "#{node['smokeping']['etc_dir']}/secret.txt"

  template secret_path do
    source 'secret.txt.erb'
    owner 'smokeping'
    group 'smokeping'
    mode '0400'
    variables(
      :secret => secret
    )
  end
  tag('smokeping_slave')
end
