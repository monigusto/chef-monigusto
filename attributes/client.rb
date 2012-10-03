# Monigusto settings
default['monigusto']['server_ip'] = "192.168.33.11"
default['monigusto']['server_role'] = "monigusto_server"

override['collectd']['server_ip'] = node['monigusto']['server_ip']
