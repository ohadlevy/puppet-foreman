class passenger::install::redhat {
  $os_type = $::operatingsystem ? {
    'Fedora' => "fedora/${::operatingsystemrelease}",
    default  => inline_template('rhel/<%= operatingsystemrelease.split(".")[0] %>')
  }

  package{'passenger-release':
    ensure   => installed,
    provider => 'rpm',
    source   => "http://passenger.stealthymonkeys.com/${os_type}/passenger-release.noarch.rpm",
    before   => Package['passenger'],
  }

  package{'passenger':
    ensure  => installed,
    name    => 'mod_passenger',
    require => Class['apache::install'],
    before  => Class['apache::service'],
  }

}
