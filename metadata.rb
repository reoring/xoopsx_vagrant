name             'handson'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures handson'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2",  "~> 1.6.0"
depends "mysql",    "~> 3.0.0"
depends "database", "~> 1.3.0"

