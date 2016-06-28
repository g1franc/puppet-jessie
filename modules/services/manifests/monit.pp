class services::monit {
	service { 'monit':
		ensure => running,
		enable => true,
		require => [ Package['monit'] ],
		subscribe => [ File ['/usr/bin/monit'], File ['/etc/monit/conf.d/monit-setting.conf'] ],
		hasrestart => true,
	}
}
