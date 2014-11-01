package "httpd" do
  action :install
end

service "httpd" do
  action [ :enable, :start ]
end

template "httpd.conf" do
  path "/etc/httpd/httpd.conf"
  owner "root"
  group "root"
  mode 0644

  notifies :reload, "service[httpd]"
end
