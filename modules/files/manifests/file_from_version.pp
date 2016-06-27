define files::file_from_version (
	$target,
	$version,
	$filename,
	$owner = '0',
	$group = '0',
	$mode = '644',
) {
	file { "$target":
		ensure => 'present',
		source => "puppet:///modules/files/$filename/$filename-$version",
		owner => "$owner",
		group => "$group",
		mode => "$mode",
	}
}
