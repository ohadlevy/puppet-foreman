class foreman_proxy::puppet::server::passenger {
  include foreman_proxy::apache::ssl
  include foreman_proxy::passenger

  file {"puppet_vhost":
    path    => "${foreman_proxy::puppet::params::apache_conf_dir}/puppet.conf",
    content => template("foreman_proxy/server/puppet-vhost.conf.erb"),
    mode    => 644,
    notify  => Exec["reload-apache"],
  }

  exec {"restart_puppet":
    command     => "/bin/touch ${foreman_proxy::puppet::params::app_root}/tmp/restart.txt",
    refreshonly => true,
    cwd         => $foreman_proxy::puppet::params::app_root,
    path        => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    require     => Class["foreman_proxy::puppet::server::install"]
  }

  file {
    [$foreman_proxy::puppet::params::app_root, "${foreman_proxy::puppet::params::app_root}/public", "${foreman_proxy::puppet::params::app_root}/tmp"]:
      ensure => directory,
      owner  => $foreman_proxy::puppet::params::user;
    "${foreman_proxy::puppet::params::app_root}/config.ru":
      owner  => $foreman_proxy::puppet::params::user,
      source => "puppet:///modules/foreman_proxy/puppet/config.ru",
      notify => Exec["restart_puppet"];
  }

}
