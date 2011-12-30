class foreman_proxy::puppet::config {
  file {
    $foreman_proxy::puppet::params::dir: ensure => directory;
    "${foreman_proxy::puppet::params::dir}/puppet.conf": content => template("foreman_proxy/puppet.conf.erb");
  }
  
}
