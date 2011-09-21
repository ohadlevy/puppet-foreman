define apache::site( $admin = "webmaster", $aliases = '', $docroot, $ensure = 'present', $rails = false) {
  if $rails { include passenger }

  file { "/etc/httpd/conf.d/$name.conf":
    mode => "644",
    ensure => $ensure,
    require => Package["httpd"],
    notify => Exec["reload-apache"],
    content => template("apache/vhost.conf"),
  } 
}

