# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.5.0'

Vagrant.configure('2') do |config|
  config.omnibus.chef_version = :latest

  config.vm.hostname = 'smokeping'
  config.vm.box = 'chef/ubuntu-12.04'
  config.vm.synced_folder 'src/', '/srv/disabled', disabled: true
  config.vm.network :private_network, type: 'dhcp'
  config.vm.network 'forwarded_port', guest: 80, host: 8000

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      'recipe[smokeping::default]'
    ]
  end
end
