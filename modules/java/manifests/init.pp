class java {
	# This class install Oracle java 8
	# Accept the contract agreement with Oracle
	exec { 'accept_oracle_java_license':
		command => 'add-apt-repository ppa:webupd8team/java -y && apt-get update && echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && apt-get install -y oracle-java8-installer && touch /root/java8-installed',
		creates => "/root/java8",
		path => "/usr/bin/:/bin/",
		logoutput => true,
	}

	# Install the package
	package {['oracle-java8-installer',]:
		ensure=> installed,
		require => [
			Package ['software-properties-common'],
			Exec['accept_oracle_java_license'],
		]
	}
}
