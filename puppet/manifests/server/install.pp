class puppet::server::install {

  $packages = $operatingsystem ? {
    /(Debian|Ubuntu)/ => ["puppetmaster"],
    default           => ["puppet-server"],
  }

  package { $packages: ensure => installed }

}
