include_recipe 'rabbitmq'
include_recipe 'rabbitmq::mgmt_console'
include_recipe 'redis'
include_recipe 'sensu::rabbitmq'
include_recipe 'sensu::client'
include_recipe 'sensu::api'
include_recipe 'sensu::dashboard'
include_recipe 'sensu::server'
include_recipe 'sensu-community-plugins'
