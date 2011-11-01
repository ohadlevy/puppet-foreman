class apache::params {
  $user      = "apache"                # Change to www-data for Debian
  $group     = "apache"                # Change to www-data for Debian
  $home      = "/var/www"
  $configdir = "/etc/httpd/conf.d"          # Change to /etc/apache2/conf.d for Debian
  $conffile  = "/etc/httpd/conf/httpd.conf" # Change to apache2.conf for Debian
}
