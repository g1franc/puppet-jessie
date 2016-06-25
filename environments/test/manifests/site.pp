file {'/tmp/puppet-test-environment': # resource type file and filename
	ensure => present, # make sure it exists
	mode => 0644,
	content => "Only TEST servers get this file.\n",
}

# Applies ONLY to nodes that are using certname "raspberry" with one or more digit.
node /^raspberry\d+$/ {
	file {'/tmp/puppet-test-raspberry-node': # resource type file and filename
		ensure => present, # make sure it exists
		mode => 0644,
		content => "Only TEST raspberry servers get this file.\n",
	}

	# Include class delcared through hiera
	hiera_include('classes')
}


# Applies ONLY to (i.e. not all) nodes that aren't explicitly defined in TEST environment.
node default {
}
