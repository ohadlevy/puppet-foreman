class smart_modules::apache {
  include smart_modules::apache::params
  include smart_modules::apache::install
  include smart_modules::apache::config
  include smart_modules::apache::service
}
