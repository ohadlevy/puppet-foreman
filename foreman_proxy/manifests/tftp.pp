class foreman_proxy::tftp2 {
  include smart_modules::tftp

  file{ $foreman_proxy::params::tftp_dir:
    owner   => $foreman_proxy::params::user,
    mode    => 644,
    require => Class["foreman_proxy::install"],
    ensure  => directory,
    recurse => true;
  }

  link_file{$foreman_proxy::params::syslinux_files:
    source_path => $foreman_proxy::params::syslinux_root,
    target_path => $foreman_proxy::params::tftproot,
    require     => Class["tftp::install"];
  }
}
define link_file($source_path, $target_path) {
  file{"$target_path/$name":
    ensure => link,
    target => "$source_path/$name"
  }
}
