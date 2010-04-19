class apache2::php {
  include apache2::common
  package{"php": ensure => installed}
  file {"/etc/httpd/conf.d/php.conf":
    source => "puppet:///apache2/etc/httpd/conf.d/php.conf",
    mode => 440, owner => root, group => apache,
    notify => Service["httpd"],
  }
}
