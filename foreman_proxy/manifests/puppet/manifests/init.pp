class foreman_proxy::puppet {
  include foreman_proxy::puppet::params
  include foreman_proxy::puppet::install
  include foreman_proxy::puppet::config
}
