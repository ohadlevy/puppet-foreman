class passenger::install::debian {

  package{"passenger":
    name    => "libapache2-mod-passenger",
    ensure  => installed,
    require => Class["apache::install"],
    before  => Class["apache::service"],
  }

}
