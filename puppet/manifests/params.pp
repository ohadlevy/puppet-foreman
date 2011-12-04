class puppet::params {
  
  include foreman::params
  $user                = "puppet"
  $dir                 = "/etc/puppet"
  $envs_dir            = "$dir/environments"
  $ca                  = true
  $passenger           = true
  $apache_conf_dir     = $foreman::params::apache_conf_dir
  $app_root            = "$dir/rack"
  $ssl_dir             = "/var/lib/puppet/ssl"
  
}
