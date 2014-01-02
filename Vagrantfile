VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "web", primary: true do |web|
    
    web.vm.box = "precise64"
    web.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    web.vm.network "forwarded_port", guest: 3000, host: 3000

    config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "apt"
      chef.add_recipe "build-essential"
      chef.add_recipe "openssl"
      chef.add_recipe "main"
      chef.add_recipe "git"
      chef.add_recipe "imagemagick"
      chef.add_recipe "postgresql-client"
      chef.add_recipe "ruby"
      chef.add_recipe "ruby::pg"
      chef.json = {
        :postgresql => {
          :version => "9.1"
        }
      }
    end

  end

  config.vm.define "db" do |db|
    
    db.vm.box = "precise64"
    db.vm.box_url = "http://files.vagrantup.com/precise64.box"
    db.vm.network "private_network", ip: "192.168.50.4"

    config.vm.provision "chef_solo" do |chef|
      chef.roles_path = "roles"
      chef.add_role "configuration"
    end
  
  end

end
