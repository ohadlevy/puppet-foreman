class apache::config {

  group { $apache::params::group:
    ensure  => present,
    require => Class['apache::install']
  }
  user  { $apache::params::user:
    ensure     => present,
    home       => $apache::params::home,
    managehome => false,
    membership => 'minimum',
    groups     => [],
    shell      => '/sbin/nologin',
    require    => Group[$apache::params::group],
  }

  file{ "${apache::params::configdir}/${apache::params::conffile}":
    mode    => '0644',
    notify  => Exec['reload-apache'],
    require => Class['apache::install'],
  }
  file { $apache::params::configdir:
    ensure  => directory,
    mode    => '0644',
    notify  => Exec['reload-apache'],
    require => Class['apache::install'],
  }

}
