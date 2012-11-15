# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  config.vm.boot_mode = :gui
  
  config.vm.network :hostonly, "10.10.10.101", :netmask => "255.255.0.0"
  config.vm.forward_port 80, 8080
  config.vm.forward_port 22, 2222
  #config.vm.forward_port 3306, 33060
  #config.vm.forward_port 3306, 33060
  #config.vm.forward_port 10081, 10081
  #config.vm.forward_port 10082, 10082
  
  
  #elasticsearch portforwarding
  config.vm.forward_port 9200, 9200
  config.vm.forward_port 9201, 9201
  config.vm.forward_port 9202, 9202
  config.vm.forward_port 9203, 9203
  config.vm.forward_port 9300, 9300
  
  
  
 	# Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "v-data", "/vagrant", "data"

  config.vm.customize ["modifyvm", :id, "--memory", 2024]
	  
  config.vm.provision :puppet do |puppet|

  	  puppet.options = "--verbose --debug"

     puppet.pp_path = "/tmp/vagrant-puppet"
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path    = "puppet/modules"
  end
  
end
