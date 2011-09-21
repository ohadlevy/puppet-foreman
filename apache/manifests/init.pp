class apache {
  include apache::params
  include apache::install
  include apache::config
  include apache::service
}
