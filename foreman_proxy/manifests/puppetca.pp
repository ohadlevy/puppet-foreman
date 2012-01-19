class foreman_proxy::puppetca {

  file { $foreman_proxy::params::autosign_location:
    ensure  => present,
    owner   => $foreman_proxy::params::user,
    group   => $foreman_proxy::params::puppet_group,
    mode    => '0644',
    require => Class['foreman_proxy::install'],
  }

}
