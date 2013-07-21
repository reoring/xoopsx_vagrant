Vagrant.configure("2") do |config|
  config.vm.hostname = "vagrant"
  config.vm.box = "wheezy"

  config.vm.network :private_network, ip: "33.33.33.33"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120
  config.ssh.forward_agent = true

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password   => 'root',
        :server_debian_password => 'root',
        :server_repl_password   => 'root',
        :bind_address => '0.0.0.0'
      }
    }

    chef.run_list = [
        "recipe[handson::default]"
    ]
  end
end
