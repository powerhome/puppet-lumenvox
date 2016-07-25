require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.relative = true
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"

exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]

PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :validate,
  :lint,
  :spec,
  :metadata_lint,
]
