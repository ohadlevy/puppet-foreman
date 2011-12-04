define git::repo($target, $bare = false, $source = false, $user = "root") {

  if $source {
    $cmd = "${git::params::bin} clone $source $target"
  } else {
    if $bare {
      $cmd = "${git::params::bin} init --bare $target"
    } else {
      $cmd = "${git::params::bin} init $target"
    }
  }

  exec{"git_repo_for_$name":
    command => $cmd,
    creates => $bare ? {
      true  => "${target}/objects",
      false => $target,
    },
    require => Class["git::install"],
    user    => $user
  }
}
