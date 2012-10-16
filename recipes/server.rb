include_recipe 'apt'

include_recipe "apache2"
  apache_module "headers" do
end

include_recipe 'graphite_handler'
include_recipe 'graphite'
include_recipe 'logstash::agent'
include_recipe 'logstash::server'
include_recipe 'logstash::kibana'
include_recipe 'logstash_handler'
include_recipe 'snmp'
include_recipe 'collectd::server'
include_recipe 'statsd'
include_recipe 'jmxtrans'
include_recipe 'tasseo'
include_recipe 'tasseo::web'
include_recipe 'nagios::server'
#include_recipe 'nagios::pagerduty'
include_recipe 'nagios::client'
include_recipe 'collectd-carbon'
include_recipe 'postfix'
include_recipe 'nagios-check-graphite'
include_recipe "collectd::server"
include_recipe "collectd::collectd_web"
include_recipe 'collectd-elasticsearch'
include_recipe 'ntp'
include_recipe 'rabbitmq'
include_recipe 'rabbitmq::mgmt_console'
include_recipe 'redis'
include_recipe 'sensu::rabbitmq'
include_recipe 'sensu::client'
include_recipe 'sensu::api'
include_recipe 'sensu::dashboard'
include_recipe 'sensu::server'
include_recipe 'sensu-community-plugins'
include_recipe "monigusto::server_collectd"
