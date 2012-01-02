class smart_modules::puppet::server::config inherits smart_modules::puppet::config {
  if $smart_modules::puppet::params::passenger  { include smart_modules::puppet::server::passenger }

  File ["${smart_modules::puppet::params::dir}/puppet.conf"] { content => template("smart_modules/puppet.conf.erb", "smart_modules/server/puppet-server.conf.erb") }

  file { [$smart_modules::puppet::params::modules_path, $smart_modules::puppet::params::common_modules_path]:
    ensure => directory,
  }

  exec {"generate_ca_cert":
    creates => "${smart_modules::puppet::params::ssl_dir}/certs/${fqdn}.pem",
    command => "puppetca --generate ${fqdn}",
    path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  }

  # setup empty directories for our environments
  env{$smart_modules::puppet::params::environments:}

  define env() {
    file{"$smart_modules::puppet::params::modules_path/$name": ensure => directory}  
  }
}
