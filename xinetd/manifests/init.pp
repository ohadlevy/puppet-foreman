class xinetd {
  package {"xinetd": ensure => installed}

  service {"xinetd":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    require => Package["xinetd"]
  }
}
