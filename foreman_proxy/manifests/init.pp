import "apache/manifests/*.pp"
import "passenger/manifests/*.pp"
import "passenger/manifests/install/*.pp"
import "puppet/manifests/*.pp"
import "puppet/manifests/server/*.pp"

class foreman_proxy {

  include foreman_proxy::params
  include foreman_proxy::install
  include foreman_proxy::config
  include foreman_proxy::service
}
