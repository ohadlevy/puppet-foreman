define apache::site(
  $docroot,
  $ensure = 'present',
  $admin = 'webmaster',
  $aliases = '',
  $rails = false
) {
  if $rails { include passenger }

  file { "${apache::params::configdir}/${name}.conf":
    ensure  => $ensure,
    mode    => '0644',
    require => Package['httpd'],
    notify  => Exec['reload-apache'],
    content => template('apache/vhost.conf'),
  }
}

