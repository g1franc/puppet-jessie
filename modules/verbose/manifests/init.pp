 class verbose {
	notify { "trusted clientcert $trusted['clientcert']": }
	notify { "trusted authenticated message => $trusted['authenticated']": }
	notify { "clientcert message => $::clientcert": }
	notify { "environment message => $::environment": }
	notify { "hostname message => $::hostname": }
	notify { "fqdn message => $::fqdn": }
}
