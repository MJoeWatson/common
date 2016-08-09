# == Class: common::user
#
# Manages users.
#
# === Parameters
#
define common::user (
  $ensure           = present,
	$comment          = undef,
  $homedir          = undef,
  $manage_home      = true,
  $uid              = undef,
  $gid              = undef,
  $groups           = undef,
  $shell            = '/bin/bash',
  $password         = undef,
  $password_min_age = undef,
  $password_max_age = undef,
  $ssh_keys         = undef,
){
  
  user { $name:
    ensure           => $ensure,
    comment          => $comment,
    home             => $homedir,
    managehome       => $manage_home,
    uid              => $uid,
    gid              => $gid,
    groups           => $groups,
    shell            => $shell,
    password         => $password,
    password_min_age => $password_min_age,
    password_max_age => $password_max_age,
  }

  if $ssh_keys != undef {
    file { "/home/$name/.ssh/":
      ensure => directory,
      owner  => $name,
    }
    file { "/home/$name/.ssh/authorized_keys":
      ensure  => present,
      content => $ssh_keys,
      owner   => $name,
      mode    => '0644',
    }
  }
}
