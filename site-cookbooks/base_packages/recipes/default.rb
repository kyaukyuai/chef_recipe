#
# Cookbook Name:: base_packages
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{gcc make git readline readline-devel}.each do |pkg|
  package pkg do
    action :install
  end
end
