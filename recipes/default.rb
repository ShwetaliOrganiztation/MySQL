#
# Cookbook:: mysql-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
yum_package 'wget' do
  action :install
end

yum_package 'perl-Data-Dumper' do
  action :install
end

yum_package 'mariadb-libs' do
  action :remove
end

execute 'download client for mysql cluster' do
  command 'wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.4/MySQL-Cluster-client-gpl-7.4.10-1.el7.x86_64.rpm'
  only_if { !File.exist?('/MySQL-Cluster-client-gpl-7.4.10-1.el7.x86_64.rpm')}
end

yum_package 'MySQL-Cluster-client-gpl' do
  source '/MySQL-Cluster-client-gpl-7.4.10-1.el7.x86_64.rpm'
  only_if { File.exist?('/MySQL-Cluster-client-gpl-7.4.10-1.el7.x86_64.rpm')}
end

execute 'download server for mysql cluster' do
  command 'wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.4/MySQL-Cluster-server-gpl-7.4.10-1.el7.x86_64.rpm'
  only_if { !File.exist?('/MySQL-Cluster-server-gpl-7.4.10-1.el7.x86_64.rpm')}
end

yum_package 'MySQL-Cluster-server-gpl' do
  source '/MySQL-Cluster-server-gpl-7.4.10-1.el7.x86_64.rpm'
  only_if { File.exist?('/MySQL-Cluster-server-gpl-7.4.10-1.el7.x86_64.rpm')}
end

execute 'download shared libraries for mysql cluster' do
  command 'wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.4/MySQL-Cluster-shared-gpl-7.4.10-1.el7.x86_64.rpm'
  only_if { !File.exist?('/MySQL-Cluster-shared-gpl-7.4.10-1.el7.x86_64.rpm')}
end

yum_package 'MySQL-Cluster-shared-gpl' do
  source '/MySQL-Cluster-shared-gpl-7.4.10-1.el7.x86_64.rpm'
  only_if { File.exist?('/MySQL-Cluster-shared-gpl-7.4.10-1.el7.x86_64.rpm')}
end