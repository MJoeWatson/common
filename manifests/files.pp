# == Class: common::files
#
# Manages files.
#
# === Parameters
#
class common::files(
	$config = undef,
){

  $defaults = {
		ensure => 'present',
  }

  if $config {
    create_resources(file, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('common::files', undef)

    if $hiera_config {
      create_resources(file, $hiera_config, $defaults)
    }
  }
}
