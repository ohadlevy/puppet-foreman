class foreman_proxy::tftp {
  include foreman_proxy::xinetd
  include foreman_proxy::tftp::params
  include foreman_proxy::tftp::install
  include foreman_proxy::tftp::config
}
