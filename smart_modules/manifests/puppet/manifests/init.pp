class smart_modules::puppet {
  include smart_modules::puppet::params
  include smart_modules::puppet::install
  include smart_modules::puppet::config
}
