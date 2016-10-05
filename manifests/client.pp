# = Class: lumenvox::client
#
# This installs the lumenvox client
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::client inherits lumenvox
{

  $version                 = $lumenvox::options['client']['version']
  $lumenvox_version        = regsubst($version, '^(\d+\.\d+\.\d+)(.*)$','\1')
  $license_servers         = $lumenvox::options['client']['license_servers']
  $sre_servers             = $lumenvox::options['client']['sre_servers']
  $tts_servers             = $lumenvox::options['client']['tts_servers']
  $default_tts_language    = $lumenvox::options['client']['default_tts_language']
  $default_tts_gender      = $lumenvox::options['client']['default_tts_gender']
  $default_tts_voice       = $lumenvox::options['client']['default_tts_voice']

  $delayed_license_acquisition = $lumenvox::options['client']['delayed_license_acquisition']
  $license_type                = $lumenvox::options['client']['license_type']

  package { 'LumenVoxClient':
    ensure   => $version,
    provider => 'yum',
    before   => File['/etc/lumenvox/client_property.conf']
  }

  file { '/etc/lumenvox/client_property.conf':
    ensure  => present,
    content => template('lumenvox/client_property.conf.erb');
  }
}
