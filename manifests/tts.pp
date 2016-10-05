# = Class: lumenvox::tts
#
# This is the lumenvox tts class
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::tts
{

  $num_synthesis_threads = $::lumenvox::options['tts']['num_synthesis_threads']
  $version               = $::lumenvox::options['tts']['version']
  $sem_ver               = regsubst($version, '^([0-9]+.[0-9]+.[0-9]+)','\1')
  $voices                = $::lumenvox::options['tts']['voices']

  package { 'LumenVoxTTS':
    ensure   => $::lumenvox::tts::version,
    provider => 'yum',
    before   => File['/etc/lumenvox/tts_server.conf'],
  }

  create_resources(lumenvox::tts::lumenvox_voice, $voices)

  file { '/etc/lumenvox/tts_server.conf':
    ensure  => present,
    content => template('lumenvox/tts_server.conf.erb'),
    notify  => Service['lvttsd']
  }

  service { 'lvttsd':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/lumenvox/tts_server.conf'],
  }
}
