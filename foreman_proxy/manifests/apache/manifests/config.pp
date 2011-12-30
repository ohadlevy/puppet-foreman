class foreman_proxy::apache::config {

  group { $foreman_proxy::apache::params::group: ensure => present, require => Class["foreman_proxy::apache::install"] }
  user  { $foreman_proxy::apache::params::user:
    ensure     => present,
    home       => $foreman_proxy::apache::params::home,
    managehome => false,
    membership => minimum,
    groups     => [],
    shell      => "/sbin/nologin",
    require    => Group[$foreman_proxy::apache::params::group],
  }

  file{
    "$foreman_proxy::apache::params::configdir/$foreman_proxy::apache::params::conffile":
      mode    => 0644,
      notify  => Exec["reload-apache"],
      require => Class["foreman_proxy::apache::install"];
    "$foreman_proxy::apache::params::configdir/":
      ensure  => directory,
      mode    => 0644,
      notify  => Exec["reload-apache"],
      require => Class["foreman_proxy::apache::install"],
  }

}
