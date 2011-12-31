class foreman_proxy::xinetd {
  include foreman_proxy::xinetd::install
  include foreman_proxy::xinetd::service
}
