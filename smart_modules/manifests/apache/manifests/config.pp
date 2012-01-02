class smart_modules::apache::config {

  group { $smart_modules::apache::params::group: ensure => present, require => Class["smart_modules::apache::install"] }
  user  { $smart_modules::apache::params::user:
    ensure     => present,
    home       => $smart_modules::apache::params::home,
    managehome => false,
    membership => minimum,
    groups     => [],
    shell      => "/sbin/nologin",
    require    => Group[$smart_modules::apache::params::group],
  }

  file{
    "$smart_modules::apache::params::configdir/$smart_modules::apache::params::conffile":
      mode    => 0644,
      notify  => Exec["reload-apache"],
      require => Class["smart_modules::apache::install"];
    "$smart_modules::apache::params::configdir/":
      ensure  => directory,
      mode    => 0644,
      notify  => Exec["reload-apache"],
      require => Class["smart_modules::apache::install"],
  }

}
