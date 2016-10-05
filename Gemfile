source 'https://rubygems.org'

group :test do
  gem "rspec-core",                                       :require => false
  gem "rspec-puppet",                                     :require => false
  gem 'puppetlabs_spec_helper',                           :require => false
  gem 'rspec-puppet-facts',                               :require => false
  gem "puppet-syntax",                                    :require => false
  gem 'metadata-json-lint',                               :require => false
  gem 'simplecov',                                        :require => false
  gem 'json',                     '1.8.3',                :require => false
  gem "puppet-blacksmith",                                :require => false
  gem 'puppet-lint',                                      :require => false
  gem 'puppet-lint-unquoted_string-check',                :require => false
  gem 'puppet-lint-empty_string-check',                   :require => false
  gem 'puppet-lint-leading_zero-check',                   :require => false
  gem 'puppet-lint-variable_contains_upcase',             :require => false
  gem 'puppet-lint-spaceship_operator_without_tag-check', :require => false
  gem 'puppet-lint-absolute_classname-check',             :require => false
  gem 'puppet-lint-undef_in_function-check',              :require => false
  gem 'puppet-lint-roles_and_profiles-check',             :require => false
  gem 'puppet-lint-trailing_newline-check',               :require => false
  gem 'puppet-lint-strict_indent-check',                  :require => false
  gem 'puppet-lint-numericvariable',                      :require => false
end

group :development do
  gem 'travis'
  gem 'travis-lint'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if hieraversion = ENV['HIERA_GEM_VERSION']
  gem 'hiera', hieraversion, :require => false
else
  gem 'hiera', :require => false
end
