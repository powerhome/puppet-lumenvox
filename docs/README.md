[![Build Status](https://travis-ci.org/powerhome/puppet-lumenvox.svg?style=plastic)](https://travis-ci.org/powerhome/puppet-lumenvox)
[![Puppet Forge](https://img.shields.io/puppetforge/v/powerhome/lumenvox.svg?style=plastic)](https://forge.puppetlabs.com/powerhome/lumenvox)
[![Puppet Forge Downloads](https://img.shields.io/puppetforge/dt/powerhome/lumenvox.svg?style=plastic)](https://forge.puppetlabs.com/powerhome/lumenvox)

# Description

Puppet module for for Lumenvox media engine.  Heavily based on Mojo Lingo's [Chef Cookbook](https://github.com/mojolingo/lumenvox-chef) to do the same.

## Platform:

* Redhat (>= 6.0)
* Centos (>= 6.0) (Tested on)

## Modules:

* yum

## Usage:

For most uses cases, just include the `lumenvox` class to install the common components.  You can also include the `lumenvox-licenser` class if you want to set up a on-site authentication server.

### Classes

- `lumenvox`: Installs all Lumenvox components (except the licenser.)
  - `lumenvox::core`: Installs core files shared across all packages. This is required.
  - `lumenvox::client`: Installs the Lumenvox speech client.
  - `lumenvox::sre`: Installs the Lumenvox speech server.
  - `lumenvox::media_server`: Installs the Lumenvox media server which contains both the MRCPv1 and MRCPv2 Server.
  - `lumenvox::tts`: Installs the text-to-speech server, required for a TTS installation.
  - `lumenvox::manager`: Starts the web dashboard running.

- `lumenvox::licenser` - Installs the licensing server

#### Example:

```ruby
# Setup lumenvox with some specific options:
class { 'lumenvox':
  username => 'YOUR_USENAME',
  password => 'YOUR_PASSWORD',

  override_options => {
    'core' => {
      'version' => '11.3.100-2.el6'
    },
    'client' => {
      'version' => '11.3.100-2.el6',
      'license_servers'      => 'some ip',
      'log_tts_events'       => true,
    },
    'tts' => {
      voices => {
        'Chloe'  => {voice => "Chloe",  version => "11.3.100-1", },
      },
    },
  }
}
```

#### Iptables

For development/testing, you can just disable IP tables:
```ruby
service { 'iptables':
  enable => false,
  ensure => stopped,
}
```

For a more secure solution, please make sure all the ports you're using on lumenvox are open.

#### Parameters:

- `username`: Authorization username
- `password`: Authorization password

#### Override Options:

Besides the parameters, there is also a hash called `override_options` that will be merged with the default values.  See the example above for an example of how to specify the options.  Below is a list of the possible values for each service, and their default.

- `core`
  - `version`: Version for core lumenvox services. Default: `'latest'`
- `client`
  - `client` `version`: Version for lumenvox client. Default: `'latest'`
  - `client` `license_servers`: Which servers to check for licensing.  Default: `['127.0.0.1:7569']`
  - `client` `sre_servers`: Servers for sre.  Default: `['127.0.0.1:5730']`
  - `client` `tts_servers`: Servers for tts.  Default: `['127.0.0.1:7579']`
  - `client` `default_tts_language`: Default: `'default'`
  - `client` `default_tts_gender`: Default: `'default'`
  - `client` `default_tts_voice`: Default: `'default'`
  - `client` `log_tts_events`: Whether to log TTS events.  Default: `'default'`
  - `client` `license_type`: What type of license to use.  Default: `'auto'`
  - `client` `delayed_license_acquisition`: Whether to delay acquiring license.  Default: `'default'`
- `sre`
  - `sre` `version`: Version for SRE client. Default: `'latest'`
  - `sre` `logging_verbosity`: Log level. Default: `1`
  - `sre` `language_packs`: Language packs to install. Default: `{}`
- `tts`
  - `tts` `version`: Version for TTS client. Default: `'latest'`
  - `tts` `voices`: Voice packs to install. Default: `{}`
  - `tts` `num_synthesis_threads`: Default: `'default'`
- `license_server`
  - `license_server` `version`: Version for license server. Default: `'latest'`
- `media_server`
  - `media_server` `version`: Version for media server. Default: `'latest'`
  - `media_server` `mrcp_server_ip`: IP address for MRCP server. Default: `'default'`
  - `media_server` `sre_ip`: IP address for SRE server. Default: `'default'`
  - `media_server` `sip_port`:  Default: `'default'`
  - `media_server` `enable_sre_logging`: Whether to log SRE events. Default: `'0'`

## License and Maintainer

Maintainer:: Mojo Lingo LLC (<jaiken@mojolingo.com>)
License:: MIT
