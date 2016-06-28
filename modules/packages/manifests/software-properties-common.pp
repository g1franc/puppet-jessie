class packages::software-properties-common {
	package { 'software-properties-common':
		ensure => present,
		require => [ Exec['apt-update'] ],
	}
}
