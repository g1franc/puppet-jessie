class navision ($version)
{

#	exec { 'etc_init.d_navision':
#		command => 'ln -s /opt/navision.jar /etc/init.d/navision.jar',
#		creates => '/etc/init.d/navision.jar',
#		path => "/usr/bin/:/bin/",
#		logoutput => true,
#		before => File ['/etc/apt/sources.list.d/jessie-backport.list'],
#	}

	file { '/etc/init.d/navision':
		ensure => link,
		target => '/opt/navision.jar',
		mode=> '755',	
	}
	
	exec { 'etc_rc2.d_navision':
		command => 'update-rc.d navision defaults 50',
		creates => '/etc/rc2.d/S50-navision',
		path => "/usr/sbin/:/usr/bin/:/bin/",
		logoutput => true,
		require => File ['/etc/init.d/navision'],
	}

	
	file { '/opt/navision.jar':
		ensure => 'present',
		source => "puppet:///modules/navision/navision-launcher-real-${version}.jar",
		owner => '0',
		group => '0',
		mode => '755',
	}

	service { 'navision':
		subscribe => File ['/opt/navision.jar'],
	}

	file { '/etc/monit/conf.d/navision.conf':
		ensure => 'present',
		source => 'puppet:///modules/navision/monit-navision.conf',
		owner => '0',
		group => '0',
		mode => '600',
		require => [ Package ['monit'], File ['/etc/init.d/navision'] ],
		notify => Service ['monit'],
	}
}
