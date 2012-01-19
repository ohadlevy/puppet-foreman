class passenger::install::debian {

  package{'passenger':
    ensure  => installed,
    name    => 'libapache2-mod-passenger',
    require => Class['apache::install'],
    before  => Class['apache::service'],
  }

}
