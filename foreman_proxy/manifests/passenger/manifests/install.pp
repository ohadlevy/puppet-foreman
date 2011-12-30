class foreman_proxy::passenger::install {
  case $operatingsystem {
    redhat,centos,fedora,Scientific: { include foreman_proxy::passenger::install::redhat }
    Debian,Ubuntu: { include foreman_proxy::passenger::install::debian }
    default: { fail("${hostname}: This module does not support operatingsystem $operatingsystem") }
  }
}
