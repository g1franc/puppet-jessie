file {'/tmp/puppet-production-environment': # resource type file and filename
	ensure => present, # make sure it exists
	mode => 0644,
	content => "Only PRODUCTION servers get this file.\n",  
}

node /^raspberry\d+$/ {
	file {'/tmp/puppet-production-raspberry-node': # resource type file and filename
		ensure => present, # make sure it exists
		mode => 0644,
		content => "Only PRODUCTION raspberry servers get this file.\n",  
	}

	# Include class declared through hiera
	hiera_include('classes')
}


# Applies ONLY to (i.e. not all) nodes that aren't explicitly defined.
# !!! Warning puppet default ENV is PRODUCTION. !!!
node default {
}

