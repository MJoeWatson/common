# == Class: common::host
#
# Manages hosts.
#
# === Parameters
#
define common::host(
  $host         = undef,
  $host_aliases = undef,
  $ensure       = present
){

  host { $host:
    ensure       => $ensure,
    ip           => hiera($host, '127.0.0.1'),
    host_aliases => $host_aliases,
  }
}
