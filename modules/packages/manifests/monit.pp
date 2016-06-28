class packages::monit {
	package { 'monit':
		ensure => present,
		require => [ Exec['apt-update'] ],		
	}

	file { '/var/lib/monit/scripts':
		ensure => directory,
		mode => '700',
		owner => '0',
		group => '0';
	}

	file { '/var/lib/monit/scripts/tmp':
		ensure => directory,
		mode => '700',
		owner => '0',
		group => '0';
	}
}					
