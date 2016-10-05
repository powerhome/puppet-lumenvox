# = Class: lumenvox::license_server
#
# This class installs the license server - only needed when using on-site licenses.
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::license_server
{

  require ::lumenvox::core

  $version = $lumenvox::options['license_server']['version']

  package { 'LumenVoxLicenseServer':
    ensure   => $version,
    provider => 'yum',
  }

  service { 'lvlicensed':
    ensure  => 'running',
    enable  => true,
    require => Package['LumenVoxLicenseServer'],
  }
}
