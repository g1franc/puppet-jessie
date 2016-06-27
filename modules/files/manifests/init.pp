class files {
	$files_file_from_templates = hiera('files::file_from_templates', {})
	create_resources('files::file_from_template', $files_file_from_templates)
	$files_file_from_versions = hiera('files::file_from_versions', {})
	create_resources('files::file_from_version', $files_file_from_versions)

	# Don't allow modifying sudoers main file, use /etc/sudoers.d instead
	file { '/etc/sudoers':
		ensure => 'present',
		source => 'puppet:///modules/files/etc_sudoers',
		owner => '0',
		group => '0',
		mode => '440',
	}
}
