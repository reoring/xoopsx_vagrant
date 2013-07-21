case node["platform"]
when "debian", "ubuntu"
    %w[php5-mysql php5-curl].each do |pkg|
        package pkg do
            action :install
            notifies :restart, "service[apache2]"
        end
    end
when "redhat", "centos"
	package "php-mysql php-curl" do
		action :install
		notifies :restart, "service[apache2]"
	end
end

git "checkout xoops" do
  repository "https://github.com/XoopsX/legacy.git"
  reference "stable"
  action :sync
  destination node[:xoops][:app]
end

template "#{node[:xoops][:document_root]}/mainfile.php" do
    source "xoops.mainfile.php.erb"
    owner "www-data"
    group "www-data"
    mode 00766
end

directory "#{node[:xoops][:document_root]}/uploads" do
    owner "www-data"
    group "www-data"
    action :create
    mode 00777
end

bash "change permission install dir" do
    user "root"
    cwd  "#{node[:xoops][:document_root]}"
    code <<-EOH
    chown -R www-data.www-data install
    chmod -R 777 install
    EOH
end

%w[cache templates_c uploads uploads/xupdate modules modules/protector modules/protector/configs].each do |directory|
    p "#{node[:xoops][:trust_path]}/#{directory}"

    directory "#{node[:xoops][:trust_path]}/#{directory}" do
        owner "www-data"
        group "www-data"
        action :create
        mode 00777
    end
end

