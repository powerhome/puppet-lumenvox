# = Class: lumenvox::manager
#
# This class installs the lumenvox manager, the web-facing dashboard.
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::manager {

  service { 'lvmanagerd':
    ensure  => 'running',
    enable  => true,
  }
}
