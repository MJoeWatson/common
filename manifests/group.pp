# == Class: common::group
#
# Manages groups.
#
# === Parameters
#
define common::group (
  $ensure = undef,
  $gid    = undef,
  $system = undef,
){

  group { $name:
    ensure => $ensure,
    gid    => $gid,
    system => $system,
    noop   => $audit_only,
  }
}
