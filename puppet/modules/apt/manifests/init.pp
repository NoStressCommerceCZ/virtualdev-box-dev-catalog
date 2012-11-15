class apt {

	exec { "apt_update":
		command => "/usr/bin/apt-get update",
	}
	
	exec { "aptitude_safe_upgrade":
		command => "/usr/bin/aptitude -y safe-upgrade",
		refreshonly => true,
	}
	
}
