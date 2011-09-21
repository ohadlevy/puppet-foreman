class tftp {
  include xinetd
  include tftp::params
  include tftp::install
  include tftp::config
}
