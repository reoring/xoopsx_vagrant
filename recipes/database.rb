include_recipe "mysql::server"
include_recipe "database::mysql"

mysql_database "handson" do
  connection(
    :host => "localhost",
    :username => "root",
    :password =>  node[:mysql][:server_root_password]
  )
  action :create
end

mysql_database "xoops" do
  connection(
    :host => "localhost",
    :username => "root",
    :password =>  node[:mysql][:server_root_password]
  )
  action :create
end

mysql_database_user "handson" do
  connection(
    :host => "localhost",
    :username => "root",
    :password => node[:mysql][:server_root_password]
  )
  password "handson"
  database_name "handson"
  host "localhost"
  action [:create, :grant]
end
