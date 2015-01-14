#
# Cookbook Name:: smokeping
# Provider::targets
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

action :create do
  converge_by("Converging by #{new_resource.name}") do
    name = new_resource.name
    etc_dir = node['smokeping']['etc_dir']

    file = "#{etc_dir}/config.d/#{name}.targets"
    template file do
      source 'group_targets.erb'
      mode '0644'
      variables(
        :data => new_resource.data
      )
    end
    Chef::Log.info "#{file} created"

    # we look for all the "targets" files and add them to main Targets
    Dir.chdir("#{etc_dir}/config.d")
    targets = Dir.glob('*.targets')
    file = "#{node['smokeping']['etc_dir']}/config.d/Targets"

    template file do
      source 'Targets.erb'
      owner 'root'
      group 'root'
      mode '0644'
      variables(
        :targets => targets
      )
      notifies :restart, 'service[smokeping]', :delayed
    end
    Chef::Log.info "#{file} re-generated"

    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  converge_by("Converge by #{new_resource.name}") do
    name = new_resource.name
    file = "#{node['smokeping']['etc_dir']}/#{name}.targets"
    if File.exist?(file)
      File.delete(file)
    end
    Chef::Log.info "#{file} deleted"
    new_resource.updated_by_last_action(true)
  end
end
