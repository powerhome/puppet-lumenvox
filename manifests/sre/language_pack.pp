define lumenvox::sre::language_pack (
  $language = undef,
  $version  = latest,
) {

  package { "LumenVox-${language}SREModel":
    ensure   => $version,
    provider => 'yum',
  }
}
