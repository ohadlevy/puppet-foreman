class foreman_proxy::apache::service {
  $http_service = $operatingsystem ? {
    /(Debian|Ubuntu)/ => "apache2",
    default           => "httpd",
  }

  service { "$http_service":
    ensure    => running, enable => true, hasstatus => true, hasrestart => true,
    alias     => "httpd",
    subscribe => Package["httpd"]
   }

  exec { "reload-apache":
    command     => "/etc/init.d/$http_service reload",
    onlyif      => "/usr/sbin/apachectl -t",
    require     => Service["httpd"],
    refreshonly => true,
  }

}
