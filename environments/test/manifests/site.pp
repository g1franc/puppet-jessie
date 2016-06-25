file {'/tmp/puppet-test-environment': # resource type file and filename
	ensure => present, # make sure it exists
	mode => 0644,
	content => "Only TEST servers get this file.\n",  
}
