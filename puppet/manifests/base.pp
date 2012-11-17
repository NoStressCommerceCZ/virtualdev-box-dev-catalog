/**
 * Example of simple node
 */
  
node default {

	include apt	
	include stdlib

	Class['apt'] -> Class['mysql::server']
	class { 'mysql::server': 
	  config_hash => { 'root_password' => 'root' }
	}
	
	Class['apt'] -> Class['elasticsearch']
	class { 'elasticsearch':
	  version      => '0.19.11',
	  java_package => 'openjdk-6-jre-headless',
	  dbdir        => '/var/lib/elasticsearch',
	  logdir       => '/var/log/elasticsearch',
	}
	
	Class['apt'] -> Package['curl']
	package { "curl":
    ensure => "installed"
	}
	
	Class['apt'] -> Package['mc']
	package { "mc":
    ensure => "installed"
	}
	
	Class['apt'] -> Class['zendserverce::install']
	class { 'zendserverce::install':
	  php_version      => '5.3',
	}
	include zendserverce::service
	
	zendserverce::vhost { 'example-site.com':
		server_name	=> 'example-site.com',
		serveraliases => [
			'www.example-site.com',
			'asset1.example-site.com',
			'asset2.example-site.com',
			'asset3.example-site.com',
			'asset4.example-site.com',
		],
	}                    	
	
	$index_php_content = "
	<?php
	    echo '<h1>Hi!</h1>';
	    echo 'Today is ' . date('Y-M-d') ;	    
	"
 	
	file { "/var/www/example-site.com/index.php":
      content => "${index_php_content}", 
   }
     	
	include phpmyadmin_zendserver
	
	Class['apt'] -> Package ['php5-cli']
	package { "php5-cli":
   	ensure => "latest"
	}
	
	Package ['php5-cli'] -> Class['pear']
	
	Class['apt'] -> Class['pear']
	Class['zendserverce::install'] -> Class['pear']
	Class['apt'] -> Class['phpqatools']
	Class['zendserverce::install'] -> Class['phpqatools']
	Class['pear'] -> Class['phpqatools']
	
	
	
	include pear
	include phpqatools
	
	
	
}