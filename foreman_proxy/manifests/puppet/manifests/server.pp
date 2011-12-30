class foreman_proxy::puppet::server {
  include foreman_proxy::puppet::server::install
  include foreman_proxy::puppet::server::config
}
