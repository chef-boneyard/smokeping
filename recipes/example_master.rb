#
# Cookbook Name:: smokeping
# Recipe:: example
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

include_recipe 'smokeping'

# Instead of having code for Chef Solo, use Chef Local mode instead
# to support Search
servers = search(:node, 'recipe:smokeping*')
slaves = search(:node, 'recipe:smokeping* AND tags:smokeping_slave')

servers_fqdn = servers.map(&:name)
slaves_fqdn = slaves.map(&:name)

group = [{
  'name' => 'Production',
  'nodes' => servers_fqdn,
  'slaves' => slaves_fqdn
}]

group.each do |i|
  smokeping_target i['name'] do
    action :create
    data [i]
  end
end
