name 'smokeping'
maintainer 'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license 'Apache 2.0'
description 'Installs and configures SmokePing server with fping'
version '1.1.4'

depends 'apache2'
depends 'perl'

%w(debian ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/tas50/chef-smokeping' if respond_to?(:source_url)
issues_url 'https://github.com/tas50/chef-smokeping/issues' if respond_to?(:issues_url)
