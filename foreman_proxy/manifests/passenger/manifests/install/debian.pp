class foreman_proxy::passenger::install::debian {

  package{"passenger":
    name    => "libapache2-mod-passenger",
    ensure  => installed,
    require => Class["foreman_proxy::apache::install"],
    before  => Class["foreman_proxy::apache::service"],
  }

}
