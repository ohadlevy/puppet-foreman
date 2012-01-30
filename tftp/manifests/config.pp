class tftp::config {
  file {'/etc/xinetd.d/tftp':
    content => template('tftp/xinetd-tftp'),
    mode    => '0644',
    require => [Class['tftp::install'], Class['xinetd::install']],
    notify  => Class['xinetd::service']
  }
 
  file { $tftp::params::map:
    content => template('tftp/tftpd.map'),
    mode    => '0644',
    require => [Class['tftp::install'], Class['xinetd::install']],
    notify  => Class['xinetd::service']
  }


  file { $tftp::params::root:
    ensure => directory,
    notify => Class['xinetd::service'],
  }
}
