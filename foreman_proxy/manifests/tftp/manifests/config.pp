class foreman_proxy::tftp::config {
  file {"/etc/xinetd.d/tftp":
    content  => template("foreman_proxy/xinetd-tftp"),
    mode => 644,
    require => [Class["foreman_proxy::tftp::install"], Class["foreman_proxy::xinetd::install"]],
    notify  => Class["foreman_proxy::xinetd::service"]
  }

  file { $foreman_proxy::tftp::params::root:
    ensure => directory,
    notify  => Class["foreman_proxy::xinetd::service"],
  }
}
