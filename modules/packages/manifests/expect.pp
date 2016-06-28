class packages::expect {
	package { 'expect':
		ensure => present,
		require => [ Exec['apt-update'] ],		
	}
}					
