class smart_modules::passenger::install::debian {

  package{"passenger":
    name    => "libapache2-mod-passenger",
    ensure  => installed,
    require => Class["smart_modules::apache::install"],
    before  => Class["smart_modules::apache::service"],
  }

}
