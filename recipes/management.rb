#
# Cookbook:: mysql-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory '/var/lib/mysql-cluster' do
  owner 'root'
  group 'root'
  mode '0750'
  recursive true
  action :create
end

template "/var/lib/mysql-cluster/config.ini" do
  source 'config.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    mgm_datadir: '/var/lib/mysql-cluster',
	mgm_node_ip: node['mysql-cluster']['mgm_node_ip'],
	no_of_replicas: (node['mysql-cluster']['data_nodes']).length,
	data_storage: node['mysql-cluster']['data_storage'],
	index_storage: node['mysql-cluster']['index_storage'],
	data_datadir: '/var/lib/mysql-cluster',
	data_nodes: node['mysql-cluster']['data_nodes'],
	sql_nodes: node['mysql-cluster']['sql_nodes']
  )
end

execute 'start management node' do
  command 'ndb_mgmd --config-file=/var/lib/mysql-cluster/config.ini'
  only_if { File.exist?('/var/lib/mysql-cluster/config.ini')}
end