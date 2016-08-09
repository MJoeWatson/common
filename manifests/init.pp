# == Class: common::host
#
# Entry point of the common module. Creates groups, users and host entries.
#
# === Parameters
#
class common {

  $groups = hiera_hash("common::groups", {})
  $users = hiera_hash("common::users", {})
  $hosts = hiera_hash("common::hosts", {})

  if $groups != undef {
    validate_hash($groups)
    create_resources(common::group,$groups)
  } else {
      notify {'No common::group in hiera':}
  }

  if $users != undef {
    validate_hash($users)
    create_resources(common::user,$users)
  } else {
      notify {'No common::user in hiera':}
  }

  if $hosts != undef {
    validate_hash($hosts)
    create_resources(common::host,$hosts)
  } else {
      notify {'No common::host in hiera':}
  }

}
