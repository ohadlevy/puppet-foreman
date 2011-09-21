class apache::service {
  service { "httpd":
    ensure    => running, enable => true, hasstatus => true, hasrestart => true,
    subscribe => Package["httpd"]
   }

  exec { "reload-apache":
    command     => "/etc/init.d/httpd reload",
    onlyif      => "/usr/sbin/apachectl -t",
    require     => Service["httpd"],
    refreshonly => true,
  }

}
