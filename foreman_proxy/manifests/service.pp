class foreman_proxy::service {
  service {"foreman-proxy":
    ensure  => running,
    require => Class["foreman_proxy::config"]
  }
}
