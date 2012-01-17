class smart_modules::apache::ssl {
  include smart_modules::apache

  case $operatingsystem {
    Debian,Ubuntu:  {
      exec { "enable-ssl":
        command => "/usr/sbin/a2enmod ssl",
        creates => "/etc/apache2/mods-enabled/ssl.load",
        notify  => Service["httpd"],
        require => Class["smart_modules::apache::install"],
      }
    }
    default: {
      package { "mod_ssl":
        ensure => present, require => Package["httpd"],
        notify => Class["smart_modules::apache::service"],
      }
      file {
        "$smart_modules::apache::params::configdir/ssl.conf":
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
