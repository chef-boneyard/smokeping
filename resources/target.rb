property :name, String, name_property: true
property :data, Array, default: []

action :create do
  converge_by("Converging by #{new_resource.name}") do
    name = new_resource.name
    etc_dir = node['smokeping']['etc_dir']

    file = "#{etc_dir}/config.d/#{name}.targets"
    template file do
      cookbook 'smokeping'
      source 'group_targets.erb'
      mode '0644'
      variables(
        data: new_resource.data
      )
    end
    Chef::Log.info "#{file} created"

    # we look for all the "targets" files and add them to main Targets
    Dir.chdir("#{etc_dir}/config.d")
    targets = Dir.glob('*.targets')
    file = "#{node['smokeping']['etc_dir']}/config.d/Targets"

    template file do
      cookbook 'smokeping'
      source 'Targets.erb'
      owner 'root'
      group 'root'
      mode '0644'
      variables(
        targets: targets
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
    ::File.delete(file) if ::File.exist?(file)
    Chef::Log.info "#{file} deleted"
    new_resource.updated_by_last_action(true)
  end
end
