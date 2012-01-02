class smart_modules::puppet::config {
  file {
    $smart_modules::puppet::params::dir: ensure => directory;
    "${smart_modules::puppet::params::dir}/puppet.conf": content => template("smart_modules/puppet.conf.erb");
  }
  
}
