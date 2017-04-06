# = Class: lumenvox::license_server
#
# This class installs the license server - only needed when using on-site licenses.
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::license_server (
  $version = 'latest',
) {

  require ::lumenvox::core

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
