class foreman_proxy::install {
  require 'foreman::params'
  include foreman::install::repos
  package {'foreman-proxy':
    ensure  => latest,
    require => Class['foreman::install::repos'],
  }
}
