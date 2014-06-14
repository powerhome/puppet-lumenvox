define lumenvox::tts::lumenvox_voice (
  $voice   = undef,
  $version = latest,
) {

  package { "LumenVox-${voice}-VoiceDB":
    ensure   => $version,
    provider => 'yum',
  }
}
