# = Class: lumenvox::core
#
# This is the core lumenvox class
#
# See README.md for details.
#
# == Author
#   Justin Aiken <jaiken@mojolingo.com>
#

class lumenvox::core (
  $version = 'latest',
) {

  $lumenvox_deps = [
    'libxml2',
    'libxml2-devel',
    'uuid',
    'uuid-devel',
    'libxslt',
    'libxslt-devel',
    'libstdc++',
  ]

  package { $lumenvox_deps:
    ensure   => installed,
    provider => 'yum',
    before   => Yumrepo['lumenvox_repo'],
  }

  yumrepo { 'lumenvox_repo':
    name     => 'LumenVox',
    enabled  => 1,
    descr    => 'LumenVox Products $basearch',
    baseurl  => 'http://www.lumenvox.com/packages/EL6/$basearch/',
    gpgcheck => 0,
    before   => Package['LumenVoxCore']
  }

  package { 'LumenVoxCore':
    ensure   => $version,
    provider => 'yum',
  }
}
