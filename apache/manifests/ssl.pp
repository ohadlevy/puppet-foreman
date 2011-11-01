class apache::ssl {
  include apache

  case $operatingsystem {
    Debian:  {
      exec { "enable-ssl":
        command => "/usr/sbin/a2enmod ssl",
        unless  => "/bin/ls /etc/apache2/mods-enabled/ssl.load",
        notify  => Service["httpd"],
        require => Class["apache::install"],
      }
    }
    default: {
      package { "mod_ssl":
        ensure => present, require => Package["httpd"],
        notify => Class["apache::service"],
      }
      file {
        "/etc/httpd/conf.d/ssl.conf":
          mode => 0644, owner => root, group => root,
          notify => Exec["reload-apache"];
        ["/var/cache/mod_ssl", "/var/cache/mod_ssl/scache"]:
          ensure => directory,
          owner => apache, group => root, mode => 0700,
          notify => Exec["reload-apache"];
      }
    }
  }
}
