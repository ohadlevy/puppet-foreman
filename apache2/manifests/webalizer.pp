class apache2::webalizer {
  package { "webalizer": ensure => installed }
  file {"/etc/httpd/conf.d/webalizer.conf":
    source => "puppet:///apache2/etc/httpd/conf.d/webalizer.conf",
    require => Package["httpd"],
    notify  => Service["httpd"],
    mode => 644
  }
}
