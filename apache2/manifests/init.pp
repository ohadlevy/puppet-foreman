# This class installs the apache2 service
# Ensure that there is no network user called apache before installing
# this is a CentOS 5 compatable (e.g. apache 2.2) manifest.
class apache2::common {
  group {"apache": ensure => present, require => Package["httpd"]}
  user  {"apache": ensure => present, home => "/var/www",
    managehome => false, membership => minimum, groups => [],
    shell => "/sbin/nologin", require => Package["httpd"], 
  }
  package { "httpd":  ensure => installed }

  service { "httpd" :
    subscribe  => Package["httpd"],
    enable     => true,
    ensure     => running,
    hasrestart => true,
    hasstatus  => true 
  }

  exec { "reload-apache2":
    command => "/etc/init.d/httpd reload",
    onlyif => "/usr/sbin/apachectl -t",
    require => Service["httpd"],
    refreshonly => true,
  }

  file{
    "/etc/httpd/conf/httpd.conf":
      source  => "puppet:///apache2/etc/httpd/conf/httpd.conf",
      mode    => 0644, owner => root, group => root,
      notify  => Exec["reload-apache2"],
      require => Package["httpd"];
  #ensure that only managed apache file are present - commented out by default
    "/etc/httpd/conf.d":
      #source  => "puppet:///apache2/empty",
      ensure  => directory, checksum => mtime,
      #recurse => true, purge => true, force => true,
      mode    => 0644, owner => root, group => root,
      notify  => Exec["reload-apache2"],
      ignore  => [".svn",".ignore"],
      require => Package["httpd"]
  }
}

define apache2::site( $admin = "webmaster", $aliases = '', $docroot, $ensure = 'present', $rails = false) {
  file { "/etc/httpd/conf.d/$name.conf":
    mode => "644",
    ensure => $ensure,
    require => Package["httpd"],
    notify => Exec["reload-apache2"],
    content => template("apache2/vhost.conf"),
  } 
}
