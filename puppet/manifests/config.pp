class puppet::config {
  file {
    $puppet::params::dir: 
      owner   => $puppet::params::user,
      ensure  => directory;
    "${puppet::params::dir}/puppet.conf":
      content => template("puppet/puppet.conf.erb");
  }
}
