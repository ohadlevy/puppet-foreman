class smart_modules::puppet::server::passenger {
  include smart_modules::apache::ssl
  include smart_modules::passenger

  file {"puppet_vhost":
    path    => "${smart_modules::puppet::params::apache_conf_dir}/puppet.conf",
    content => template("smart_modules/server/puppet-vhost.conf.erb"),
    mode    => 644,
    notify  => Exec["reload-apache"],
  }

  exec {"restart_puppet":
    command     => "/bin/touch ${smart_modules::puppet::params::app_root}/tmp/restart.txt",
    refreshonly => true,
    cwd         => $smart_modules::puppet::params::app_root,
    path        => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    require     => Class["smart_modules::puppet::server::install"]
  }

  file {
    [$smart_modules::puppet::params::app_root, "${smart_modules::puppet::params::app_root}/public", "${smart_modules::puppet::params::app_root}/tmp"]:
      ensure => directory,
      owner  => $smart_modules::puppet::params::user;
    "${smart_modules::puppet::params::app_root}/config.ru":
      owner  => $smart_modules::puppet::params::user,
      source => "puppet:///modules/smart_modules/puppet/config.ru",
      notify => Exec["restart_puppet"];
  }

}
