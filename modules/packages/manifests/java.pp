class packages::java {
	exec { 'etc_apt_sources.list.d_jessie-backport.list':
		command => 'echo "deb http://ftp.de.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backport.list && apt-get update',
		creates => '/etc/apt/sources.list.d/jessie-backport.list',
		path => "/usr/bin/:/bin/",
		logoutput => true,		
		before => File ['/etc/apt/sources.list.d/jessie-backport.list'],
	}

	file { '/etc/apt/sources.list.d/jessie-backport.list':
		ensure => present,
		content => 'deb http://ftp.de.debian.org/debian jessie-backports main',
		mode => '600',
	}
	
	package { 'openjdk-8-jdk':
		ensure => present,
		require => [ File ['/etc/apt/sources.list.d/jessie-backport.list'], Exec['apt-update'] ],	
	}
}
