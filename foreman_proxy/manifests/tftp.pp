class foreman_proxy::tftp {
  include smart_modules::tftp

  file{ $foreman_proxy::params::tftp_dir:
    ensure  => directory,
    owner   => $foreman_proxy::params::user,
    mode    => '0644',
    require => Class["foreman_proxy::install"],
    recurse => true;
  }

  sync_file{$foreman_proxy::params::syslinux_files:
    source_path => $foreman_proxy::params::syslinux_root,
    target_path => $foreman_proxy::params::tftproot,
    require     => Class["smart_modules::tftp::install"];
  }
}
define sync_file($source_path, $target_path) {
  file{"$target_path/$name":
    ensure => present,
    source => "$source_path/$name"
  }
}
