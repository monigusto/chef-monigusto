# Monigusto settings
default['monigusto']['server_ip'] = "192.168.33.11"
default['monigusto']['port']['nagios'] = 8080
default['monigusto']['port']['graphite_web'] = 8081
default['monigusto']['port']['collectd_web'] = 8082
default['monigusto']['port']['kibana'] = 8083
default['monigusto']['port']['tasseo'] = 8084
default['monigusto']['server_role'] = "monigusto_server"

# Nginx
override['nginx']['default_site_enabled'] = false

# SMNP
override['snmp']['full_system_view'] = false

# NTP
override['ntp']['servers'] = ['0.pool.ntp.org', '1.pool.ntp.org' ]
override['ntp']['is_server'] = true

# Chef graphite handler
override['chef_client']['handler']['graphite']['host'] = "localhost"
override['chef_client']['handler']['graphite']['port'] = 2003

# Tasseo
override['tasseo']['graphite_url'] = "127.0.0.1"
override['tasseo']['graphite_auth'] = "root:change_me"
override['tasseo']['graphite_web_protocol'] = "http"
override['tasseo']['home_dir'] = "/opt/tasseo"
override['tasseo']['url'] = "localhost"
override['tasseo']['nginx']['port'] = node['monigusto']['port']['tasseo']

# JMXtrans

override['jmxtrans']['servers'] = [ { 'name' => "localhost" , "port" => 1105, "type" => "jvm" } ]
override['jmxtrans']['graphite']['host'] = "localhost"

# Graphite
override['graphite']['graphite_web']['http_port'] = node['monigusto']['port']['graphite_web']
override['graphite']['graphite_web']['additional_vhost_config'] = "Header set Access-Control-Allow-Origin '*' \n\t\tHeader set Access-Control-Allow-Methods 'GET, OPTIONS' \n\t\tHeader set Access-Control-Allow-Headers 'origin, authorization, accept'"

# Apache
override['apache']['listen_ports'] = [ 80, 443,
            node['monigusto']['port']['nagios'],
            node['monigusto']['port']['graphite_web'],
            node['monigusto']['port']['collectd_web'],
            node['monigusto']['port']['kibana']
]

# Statsd
override['statsd']['graphite_port'] = 2003
override['statsd']['graphite_host'] = 'localhost'

# Collectd
override['collectd']['server_ip'] = "127.0.0.1"
override['collectd']['server_role'] = node['monigusto']['server_role']
override['collectd']['collectd_web']['path'] = "/opt/collectd_web"
override['collectd']['collectd_web']['http_port'] = node['monigusto']['port']['collectd_web']
override['collectd']['enable_rrdtool_plugin'] = true

# Nagios
override['nagios']['server_auth_method'] = "htauth"
override['nagios']['http_port'] = node['monigusto']['port']['nagios']
override['nagios']['server_role'] = node['monigusto']['server_role']
override['nagios']['notifications_enabled'] = 1
