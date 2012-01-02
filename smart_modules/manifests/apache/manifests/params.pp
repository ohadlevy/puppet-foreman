class smart_modules::apache::params {
  case $operatingsystem {
    Debian,Ubuntu: {
      $user      = "www-data"
      $group     = "www-data"
      $configdir = "/etc/apache2/conf.d"
      $conffile  = "apache2.conf"
    }
    default: {
      $user      = "apache"
      $group     = "apache"
      $configdir = "/etc/httpd/conf.d"
      $conffile  = "httpd.conf"
    }
  }

  $home      = "/var/www"

}
