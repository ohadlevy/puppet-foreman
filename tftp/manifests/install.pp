class tftp::install {
  package {["tftp-server","syslinux"]:ensure => installed}
}
