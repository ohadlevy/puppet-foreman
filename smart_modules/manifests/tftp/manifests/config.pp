class smart_modules::tftp::config {
  file {"/etc/xinetd.d/tftp":
    content  => template("smart_modules/xinetd-tftp"),
    mode => 644,
    require => [Class["smart_modules::tftp::install"], Class["smart_modules::xinetd::install"]],
    notify  => Class["smart_modules::xinetd::service"]
  }

  file { $smart_modules::tftp::params::root:
    ensure => directory,
    notify  => Class["smart_modules::xinetd::service"],
  }
}
