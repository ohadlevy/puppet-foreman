class foreman_proxy::config {
  user { $foreman_proxy::params::user:
    shell   => "/sbin/nologin",
    comment => "Foreman Proxy account",
    ensure  => "present",
    groups  => $foreman_proxy::params::puppet_group,
    home    => $foreman_proxy::params::dir,
    require => Class["foreman_proxy::install"],
    notify  => Class["foreman_proxy::service"],
  }

  file{"/etc/foreman-proxy/settings.yml":
    content => template("foreman_proxy/settings.yml.erb"),
    owner   => $foreman_proxy::params::user,
    group   => $foreman_proxy::params::user,
    mode    => 644,
    require => Class["foreman_proxy::install"],
    notify  => Class["foreman_proxy::service"],
  }

   augeas { "sudo-foreman-proxy":
     context => "/files/etc/sudoers",
     changes => [
       "set spec[user = '${foreman_proxy::params::user}']/user ${foreman_proxy::params::user}",
       "set spec[user = '${foreman_proxy::params::user}']/host_group/host ALL",
       "set spec[user = '${foreman_proxy::params::user}']/host_group/command[1] ${foreman_proxy::params::puppetca_cmd}",
       "set spec[user = '${foreman_proxy::params::user}']/host_group/command[2] ${foreman_proxy::params::puppetrun_cmd}",
       "set spec[user = '${foreman_proxy::params::user}']/host_group/command[1]/tag NOPASSWD",
       "set Defaults[type = ':${foreman_proxy::params::user}']/type :${foreman_proxy::params::user}",
       "set Defaults[type = ':${foreman_proxy::params::user}']/requiretty/negate ''",
     ],
   }

  if $foreman_proxy::params::puppetca  { include foreman_proxy::puppetca }
  if $foreman_proxy::params::tftp      { include foreman_proxy::tftp }
  #if $foreman_proxy::params::dhcp      { include foreman_proxy::dhcp }
  #if $foreman_proxy::params::dns       { include foreman_proxy::dns }

}
