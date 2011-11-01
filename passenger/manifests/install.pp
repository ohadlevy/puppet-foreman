class passenger::install {
  case $operatingsystem {
    redhat,centos,fedora,Scientific: { include passenger::install::redhat }
    Debian: { include passenger::install::debian }
    default: { fail("${hostname}: This module does not support operatingsystem $operatingsystem") }
  }
}
