class tftp {
  include xinetd

  package {["tftp-server","syslinux"]:ensure => installed}

  file {"/etc/xinetd.d/tftp":
    content  => template("tftp/xinetd-tftp"),
    mode => 644,
    require => [Package["tftp-server"], Package["xinetd"]],
    notify  => Service["xinetd"]
  }

}
