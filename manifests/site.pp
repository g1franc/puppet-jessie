file {'/tmp/example-ip': # resource type file and filename
	ensure=> present, # make sure it exists
	mode=> 0644,# file permissions
	content => "Here is my Public IP Address: ${ipaddress_eth0}.\n",# note the ipaddress_eth0 fact
}

file {'/tmp/puppet-test-environment': # resource type file and filename
	ensure => absent, # make sure it doesn't exists
}

file {'/tmp/puppet-production-environment':# resource type file and filename
	ensure => absent, # make sure it doesn't exists
}

node default {} # applies to nodes that aren't explicitly defined
