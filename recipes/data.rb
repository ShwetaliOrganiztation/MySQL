#
# Cookbook:: mysql-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/etc/my.cnf' do
  source 'data_my.cnf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    mgm_node_ip: node['mysql-cluster']['mgm_node_ip']
  )
end

directory '/var/lib/mysql-cluster' do
  owner 'root'
  group 'root'
  mode '0750'
  recursive true
  action :create
end

execute 'start data node' do
  command 'ndbd'
end