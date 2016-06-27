class packages::htop {
	package { 'htop':
		ensure => present,
		require => [ Exec['apt-update'] ],		
	}
}
