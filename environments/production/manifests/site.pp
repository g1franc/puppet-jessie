file {'/tmp/puppet-production-environment': # resource type file and filename
	ensure => present, # make sure it exists
	mode => 0644,
	content => "Only PRODUCTION servers get this file.\n",  
}
