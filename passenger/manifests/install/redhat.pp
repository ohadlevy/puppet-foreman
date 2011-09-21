class passenger::install::redhat {
  $os_type = $operatingsystem ? {
    "Fedora" => "fedora/${operatingsystemrelease}",
    default  => inline_template("rhel/<%= operatingsystemrelease.split('.')[0] %>")
  }

  package{"passenger-release":
    ensure   => installed,
    provider => rpm,
    source   => "http://passenger.stealthymonkeys.com/$os_type/passenger-release.noarch.rpm",
    before   => Package["passenger"],
  }

  package{"passenger":
    name    => "mod_passenger",
    ensure  => installed,
    require => Class["apache::install"],
    before  => Class["apache::service"],
  }
 
}
