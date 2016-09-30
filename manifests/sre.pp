# = Class: lumenvox::sre
#
# This is the lumenvox sre class
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::sre
{

  $version           = $lumenvox::options['sre']['version']
  $ver_match         = $version.match(/^[0-9]+.[0-9]+.[0-9]+/)
  $sem_ver           = $vermatch[0]
  $language_packs    = $lumenvox::options['sre']['language_packs']
  $logging_verbosity = $lumenvox::options['sre']['logging_verbosity']

  create_resources(lumenvox::sre::language_pack, $language_packs)

  package { 'LumenVoxSRE':
    ensure   => $version,
    provider => 'yum',
    before   => File['/etc/lumenvox/sre_server.conf']
  }

  file { '/etc/lumenvox/sre_server.conf':
    ensure  => present,
    content => template('lumenvox/sre_server.conf.erb'),
    notify  => Service['lvsred']
  }

  service { 'lvsred':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/lumenvox/sre_server.conf'],
  }
}
