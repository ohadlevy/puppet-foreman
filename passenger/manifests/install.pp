class passenger::install {
  case $operatingsystem {
    redhat,centos,fedora,Scientific: { include passenger::install::redhat }
    default: { fail("${hostname}: This module does not support operatingsystem $operatingsystem") }
  }
}
