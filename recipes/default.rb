#
# Cookbook Name:: cassandra
# Recipe:: default
#
# Copyright 2011, DataStax
#
# Apache License
#

###################################################
# 
# Public Variable Declarations
# 
###################################################

# Only for debug purposes
OPTIONAL_INSTALL = false 

include_recipe "java" 

include_recipe "cassandra::setup_repos"
include_recipe "cassandra::optional_packages" if OPTIONAL_INSTALL
include_recipe "cassandra::additional_settings"
include_recipe "cassandra::install"
#include_recipe "cassandra::raid"
#include_recipe "cassandra::token_generation"
#include_recipe "cassandra::create_seed_list"
#include_recipe "cassandra::restart_service"
