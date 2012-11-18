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
     	
	include phpmyadmin_zendserver
		
	Class['apt'] -> Class['pear']
	Class['zendserverce::install'] -> Class['pear']
	Class['apt'] -> Class['phpqatools']
	Class['zendserverce::install'] -> Class['phpqatools']
	Class['pear'] -> Class['phpqatools']
	
	include pear
	include phpqatools
	
	file { '/usr/bin/phpunit':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpunit',
	}
	
	file { '/usr/bin/phpcpd':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpcpd',
	}
	
	file { '/usr/bin/phpcs':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpcs',
	}

	file { '/usr/bin/pdepend':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/pdepend',
	}
	
	file { '/usr/bin/phpdoc':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpdoc',
	}
	
	file { '/usr/bin/phpcb':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpcb',
	}
		s
	
	file { '/usr/bin/phpdcd':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpdcd',
	}
	
	file { '/usr/bin/phpdox':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpdox',
	}
	
	file { '/usr/bin/phpize':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpize',
	}
	
	file { '/usr/bin/phploc':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phploc',
	}
	
	file { '/usr/bin/phpmd':
		require => Class["phpqatools"],
	   ensure => 'link',
	   target => '/usr/local/zend/bin/phpmd',
	}

}