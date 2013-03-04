#
# Cookbook Name:: cassandra
# Recipe:: install
#
# Copyright 2011, DataStax
#
# Apache License
#

###################################################
# 
# Install Cassandra
# 
###################################################
#
#


# Used to clear any system information that may have
# been created when the service autostarts
execute "clear-data" do
  command "rm -rf /var/lib/cassandra/data/system"
  action :nothing
end

# Installs Cassandra
if node[:cassandra][:setup][:deployment] =~ /\d{2}x/
  version = node[:cassandra][:setup][:deployment].to_i
  case node[:platform]
    when "ubuntu", "debian"
      package "cassandra" do
        #notifies :stop, resources(:service => "cassandra"), :immediately
        notifies :run, resources(:execute => "clear-data"), :immediately
      end

    when "centos", "redhat", "fedora"
      package "cassandra#{version}" do
        #notifies :stop, resources(:service => "cassandra#{version}"), :immediately
        notifies :run, resources(:execute => "clear-data"), :immediately
      end
  end
end

service "cassandra" do 
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

# Drop the config.
template "/etc/cassandra/cassandra-env.sh" do
  owner node['cassandra']['user']
  group node['cassandra']['user']
  mode "0755"
  source "cassandra-env.sh.erb"
  notifies :restart , resources(:service => "cassandra")
end

template "/etc/cassandra/cassandra.yaml" do
  owner node['cassandra']['user']
  group node['cassandra']['user']
  mode "0644"
  source "cassandra.yaml.erb"
  notifies :restart , resources(:service => "cassandra")
end

template "/etc/cassandra/cassandra-topology.properties" do
  owner node['cassandra']['user']
  group node['cassandra']['user']
	mode "0644"
	source "cassandra-topology.properties.erb"
	# Pass the topology array as 't' to the template.
	#variables(
	#	:t => t
	#)
  notifies :restart , resources(:service => "cassandra")
end
