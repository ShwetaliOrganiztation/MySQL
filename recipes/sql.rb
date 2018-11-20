#
# Cookbook:: mysql-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/etc/my.cnf' do
  source 'sql_my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    mgm_node_ip: node['mysql-cluster']['mgm_node_ip'],
	storage_engine: node['mysql-cluster']['storage_engine']
  )
end

service 'mysql' do
  action :start
end