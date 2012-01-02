class smart_modules::tftp {
  include smart_modules::xinetd
  include smart_modules::tftp::params
  include smart_modules::tftp::install
  include smart_modules::tftp::config
}
