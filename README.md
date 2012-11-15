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

### Size does matter!
Having an environment you can send and have others boot up is really neat, but not very portable if your file is a 5 GB download. Even 1 GB is pushing the limits. You should aim for a final Box size of no more than 500 MB. In order to achieve that size, there is a few things you can do.

Install the operating system without a GUI. That is, when prompted, deselect the option to install a desktop environment. On a Debian Lenny install, the final size difference between an OS with and without a desktop environment was a whole 1 GB.

Clear the system cache before you export at the end. You don't need tmp files, or cached system packages. In the case of Debian or Ubuntu based operating systems, you can clean the cache with 

	apt-get clean
	
Either keep RubyGems from installing documentation, using --no-rdoc --no-ri or consider removing all documentation afterwards using 

	rm -r "$(gem env gemdir)"/doc/*


### Export a box

Run vagrant command for create a vagrant box. 
First stop running VM if you havent already stopped it

	vagrant halt
	
and pack new box

	vagrant package --base virtualdev-box-dev-catalog --output virtualdev-box-dev-catalog.box
	
## Distribute a box

Now you would upload box file into publicly available repository.
In case of NoStress it's http://file.nostresscommerce.com/vagrant/virtualdev-box-dev-catalog.box

## Dependencies

 * Vagrant (http://vagrantup.com)
 * Ant (http://ant.apache.org) 	