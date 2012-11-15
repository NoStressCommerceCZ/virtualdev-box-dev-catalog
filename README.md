virtualdev-box-dev-catalog
==========================

Repository for building VirtualDev box for ordinary development.

The following packages are installed into final box
 
 * Zend Server CE 5.3
 * MySql Server 5.5 
 * ElasticSearch 0.19.11
 * PHPMyAdmin for Zend Server CE (not sure what version)

## User & Passwords

 * SSH: vagrant / vagrant
 * MySQL: root / root 

## How to build a box

### Clone the repository
You can clone the repository with command

	git://github.com/NoStressCommerceCZ/virtualdev-box-dev-catalog.git
	
and don't forget to switch inside

	cd virtualdev-box-dev-catalog


### Download all dependenciences

You need to download all puppet modules and 3rd party archives

	ant -f build.xml build-puppet-modules   
	

### Start a VM

Run vagrant command

	vagrant up
	
That will create new VM and run puppet provisioner. It can take a while.

### Check a VM

You should check that everything is corretly installed.

### Export a box

Run vagrant command for create a vagrant box. 
First stop running VM if you havent already stopped it

	vagrant halt
	
and pack new box

	vagrant package --base virtualdev-box-dev-catalog --output virtualdev-box-dev-catalog.box
	
Probably your VM will be called virtualdev-box-dev-catalog-{longnumber}, so you need to update value of --base parameter.
	
## Distribute a box

Now you would upload box file into publicly available repository.
In case of NoStress it's http://file.nostresscommerce.com/vagrant/virtualdev-box-dev-catalog.box

## Dependencies

 * Vagrant (http://vagrantup.com)
 * Ant (http://ant.apache.org) 	