class smart_modules::passenger::install {
  case $operatingsystem {
    redhat,centos,fedora,Scientific: { include smart_modules::passenger::install::redhat }
    Debian,Ubuntu: { include smart_modules::passenger::install::debian }
    default: { fail("${hostname}: This module does not support operatingsystem $operatingsystem") }
  }
}
