class smart_modules::xinetd::service {
  service {"xinetd":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    require => Class["smart_modules::xinetd::install"]
  }
}
