define files::file_from_template (
	$target,
	$template,
	$subname = 'generic',
	$owner = '0',
	$group = '0',
	$mode = '644',
) {
	file{ "$target":
		content => template("files/$template/$subname.erb"),
		ensure => 'file',
		owner => "$owner",
		group => "$group",
		mode => "$mode",
	}
}

