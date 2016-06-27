# Common class requirements
class packages ($update_interval='1440') {
	notify {"apt-update interval is |${update_interval}|": }
	exec { "apt-update":
		command => "/usr/bin/apt-get update",
		onlyif => "/usr/bin/test `/usr/bin/find /var/cache/apt/pkgcache.bin -mmin +${update_interval}`",
	}
}
