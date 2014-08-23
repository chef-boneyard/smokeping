name             'smokeping'
maintainer       'Limelight Networks, Inc.'
maintainer_email 'tsmith@limelight.com'
license          'Apache 2.0'
description      'Installs and configures SmokePing server with fping'
version          '1.0.0'

depends 'apache2'
depends 'perl'

%w(debian ubuntu).each do |os|
  supports os
end
