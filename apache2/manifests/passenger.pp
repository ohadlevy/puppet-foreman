class apache2::passenger {
  # just in case apache is not included.
  include apache2::common

  # Package is avail be only for Red Hat CentOS 5 
  package{"rubygem-passenger": 
    ensure => "2.2.2-1",
    require => [Package["httpd"],Yumrepo["foreman"]],
    before => Service["httpd"],
  }
  file{"/etc/httpd/conf.d/passenger.conf":
    source => "puppet:///apache2/etc/httpd/conf.d/passenger.conf",
    mode => 644, owner=> root, group => root,
    notify => Exec["reload-apache2"],
  }
}
