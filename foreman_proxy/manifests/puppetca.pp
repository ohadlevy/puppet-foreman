class foreman_proxy::puppetca {

  file { $foreman_proxy::params::autosign_location:
    owner   => $foreman_proxy::params::user,
    group   => $foreman_proxy::params::puppet_group,
    mode    => 644,
    ensure  => present,
    require => Class["foreman_proxy::install"],
  }

}
