class foreman_proxy::passenger {
  include foreman_proxy::apache
  include foreman_proxy::passenger::install
  
}
