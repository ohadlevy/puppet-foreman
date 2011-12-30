define foreman_proxy::apache::site( $admin = "webmaster", $aliases = '', $docroot, $ensure = 'present', $rails = false) {
  if $rails { include foreman_proxy::passenger }

  file { "$foreman_proxy::apache::params::configdir/$name.conf":
    mode => "644",
    ensure => $ensure,
    require => Package["httpd"],
    notify => Exec["reload-apache"],
    content => template("foreman_proxy/vhost.conf"),
  } 
}

