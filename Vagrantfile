VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "web", primary: true do |web|
    
    web.vm.box = "precise64"
    web.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
    
    web.berkshelf.enabled = true

    web.vm.network "forwarded_port", guest: 3000, host: 3000

    web.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["cookbooks"]
      chef.roles_path = "roles"
      chef.add_role "web"
    end

  end

  config.vm.define "db" do |db|
    
    db.vm.box = "precise64"
    db.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"

    db.berkshelf.enabled = true

    db.vm.network "private_network", ip: "192.168.50.4"

    db.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["cookbooks"]
      chef.roles_path = "roles"
      chef.add_role "database"
    end
  
  end

end
