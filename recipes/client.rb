include_recipe 'apt'

include_recipe 'nagios::client'
include_recipe 'collectd::client'
include_recipe 'sensu::client'
