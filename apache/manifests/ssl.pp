class apache::ssl {
  include apache
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
