%w[php5-dev php-pear].each do |pkg|
    package pkg do
        action :install
    end
end
