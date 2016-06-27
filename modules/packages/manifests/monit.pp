class packages::monit {
	package { 'monit':
		ensure => present,
		require => [ Exec['apt-update'] ],		
	}
}					
