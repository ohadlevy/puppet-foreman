define foreman_proxy::tftp::sync_file(
  $source_path,
  $target_path
) {
  file {"${target_path}/${name}":
    ensure => 'present',
    source => "${source_path}/${name}",
  }

}
