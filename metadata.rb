name             'smokeping'
maintainer       'Tim Smith'
maintainer_email 'tsmithi84@gmail.com'
license          'Apache 2.0'
description      'Installs and configures SmokePing server with fping'
version          '1.1.1'

depends 'apache2'
depends 'perl'

%w(debian ubuntu).each do |os|
  supports os
end
