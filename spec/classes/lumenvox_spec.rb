require 'spec_helper'

describe 'lumenvox' do
  it { should contain_class 'lumenvox::core' }
  it { should contain_class 'lumenvox::client' }
  it { should contain_class 'lumenvox::sre' }
  it { should contain_class 'lumenvox::media_server' }
  it { should contain_class 'lumenvox::tts' }
  it { should contain_class 'lumenvox::manager' }

  it { should_not contain_class 'lumenvox::license_server' }
end
