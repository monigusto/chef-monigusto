sensu_handler "default" do
  type "set"
  handlers [ "pagerduty" ]
end

sensu_handler "pagerduty" do
  type "pipe"
  command "pagerduty.rb"
  severities ["ok", "critical"]
end

sensu_client node.name do
  address node.ipaddress
  subscriptions ["all", "redis"]
  #subscriptions node.roles + ["all"]
  #additional(:cluster => node.cluster)
end

sensu_check "redis_process" do
  command "check-procs.rb -p redis-server -C 1"
  handlers ["default"]
  subscribers ["redis"]
  interval 30
  additional(:notification => "Redis is not running")
end
