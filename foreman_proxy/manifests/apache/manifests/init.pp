class foreman_proxy::apache {
  include foreman_proxy::apache::params
  include foreman_proxy::apache::install
  include foreman_proxy::apache::config
  include foreman_proxy::apache::service
}
