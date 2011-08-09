class tftp {
  include xinetd
  include tftp::install
  include tftp::config
}
