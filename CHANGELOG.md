##2016-10-06 - Pete Brown <pete@abstractit.com.au> 0.1.0
###Summary

First Puppet Forge Release
Add support for Puppet 4 and PE 2015
Fix restart loop issue.

####Bugfixes
Fix issue #1
Put the installed version in the config file so Lumenvox does not rewrite the
config files on every run and restart the services.
The service then updates the config files and puppet overwrites them.

##2014-06-15 - Justin Aiken <60tonangel@gmail.com> 0.0.1
###Summary

Initial release
