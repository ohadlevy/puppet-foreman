class foreman_proxy::xinetd::service {
  service {"xinetd":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    require => Class["foreman_proxy::xinetd::install"]
  }
}
