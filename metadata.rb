name 'smokeping'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs and configures SmokePing server with fping'
version '3.1.0'

depends 'apache2'
depends 'perl'

%w(debian ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/smokeping'
issues_url 'https://github.com/chef-cookbooks/smokeping/issues'
chef_version '>= 12.7' if respond_to?(:chef_version)
