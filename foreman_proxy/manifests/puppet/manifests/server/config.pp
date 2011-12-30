class foreman_proxy::puppet::server::config inherits foreman_proxy::puppet::config {
  if $foreman_proxy::puppet::params::passenger  { include foreman_proxy::puppet::server::passenger }

  File ["${foreman_proxy::puppet::params::dir}/puppet.conf"] { content => template("foreman_proxy/puppet.conf.erb", "foreman_proxy/server/puppet-server.conf.erb") }

  file { [$foreman_proxy::puppet::params::modules_path, $foreman_proxy::puppet::params::common_modules_path]:
    ensure => directory,
  }

  exec {"generate_ca_cert":
    creates => "${foreman_proxy::puppet::params::ssl_dir}/certs/${fqdn}.pem",
    command => "puppetca --generate ${fqdn}",
    path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  }

  # setup empty directories for our environments
  env{$foreman_proxy::puppet::params::environments:}

  define env() {
    file{"$foreman_proxy::puppet::params::modules_path/$name": ensure => directory}  
  }
}
