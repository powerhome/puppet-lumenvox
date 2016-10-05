# = Class: lumenvox::media_server
#
# This is the lumenvox media_server class
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::media_server
{

  $version            = $lumenvox::options['media_server']['version']
  $sem_ver            = regsubst($version, '^(\d+\.\d+\.\d+)(.*)$','\1')
  $mrcp_server_ip     = $lumenvox::options['media_server']['mrcp_server_ip']
  $enable_sre_logging = $lumenvox::options['media_server']['enable_sre_logging']
  $sre_ip             = $lumenvox::options['media_server']['sre_ip']
  $sip_port           = $lumenvox::options['media_server']['sip_port']

  package { 'LumenVoxMediaServer':
    ensure   => $version,
    provider => 'yum',
    before   => File['/etc/lumenvox/media_server.conf']
  }

  file { '/etc/lumenvox/media_server.conf':
    ensure  => present,
    content => template('lumenvox/media_server.conf.erb'),
    notify  => Service['lvmediaserverd']
  }

  service { 'lvmediaserverd':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/lumenvox/media_server.conf'],
  }
}
