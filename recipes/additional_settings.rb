#
# Cookbook Name:: cassandra
# Recipe:: additional_settings
#
# Copyright 2011, DataStax
#
# Apache License
#

###################################################
# 
# Additional Settings
# 
###################################################


# User limits
template "/etc/security/limits.d/#{node['cassandra']['user']}.conf" do
  source "cassandra-limits.conf.erb"
  owner node['cassandra']['user']
  mode  0644
end

ruby_block "make sure pam_limits.so is required" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/pam.d/su")
    fe.search_file_replace_line(/# session    required   pam_limits.so/, "session    required   pam_limits.so")
    fe.write_file
  end
end

# Flush file system buffers and free up memory
execute 'sync'
execute 'echo 3 > /proc/sys/vm/drop_caches'
