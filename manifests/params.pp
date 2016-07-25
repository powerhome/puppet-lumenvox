# Private class: See README.md.
class lumenvox::params {
  $username = undef
  $password = undef

  $default_options = {
    'core' => {
      'version' => latest,
    },
    'client' => {
      'version'                     => latest,
      'license_servers'             => ['127.0.0.1:7569'],
      'sre_servers'                 => ['127.0.0.1:5730'],
      'tts_servers'                 => ['127.0.0.1:7579'],
      'default_tts_language'        => 'default',
      'default_tts_gender'          => 'default',
      'default_tts_voice'           => 'default',
      'log_tts_events'              => 'default',
      'delayed_license_acquisition' => 'default',
      'license_type'                => 'default',
    },
    'sre' => {
      'version'           => latest,
      'logging_verbosity' => 1,
      'language_packs'    => {},
    },
    'tts' => {
      'version' => latest,
      'voices'  => {},
      'num_synthesis_threads' => 'default',
    },
    'license_server' => {
      'version' => latest,
    },
    'media_server' => {
      'version'            => latest,
      'mrcp_server_ip'     => 'default',
      'sre_ip'             => 'default',
      'sip_port'           => 'default',
      'enable_sre_logging' => '0',
    }
  }
}
