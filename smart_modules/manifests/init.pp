# Class: smart_modules
#
# This module manages smart_modules
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
import "apache/manifests/*.pp"
import "passenger/manifests/*.pp"
import "passenger/manifests/install/*.pp"
import "puppet/manifests/*.pp"
import "puppet/manifests/server/*.pp"
import "xinetd/manifests/*.pp"
import "tftp/manifests/*.pp"

class smart_modules {

  include smart_modules::tftp::params 
}
