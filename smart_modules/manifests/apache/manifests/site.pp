define smart_modules::apache::site( $admin = "webmaster", $aliases = '', $docroot, $ensure = 'present', $rails = false) {
  if $rails { include smart_modules::passenger }

  file { "$smart_modules::apache::params::configdir/$name.conf":
    mode => "644",
    ensure => $ensure,
    require => Package["httpd"],
    notify => Exec["reload-apache"],
    content => template("smart_modules/vhost.conf"),
  } 
}

