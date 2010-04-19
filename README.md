# Puppet module for managing Foreman

Installs Foreman as a standalone application or using apache passenger.

download the source code from <http://github.com/ohadlevy/puppet-foreman/tarball/master>

# Requirements

if you are using RHE5, EPEL repo must be enabled <http://fedoraproject.org/wiki/EPEL>


# Setup

If you are using puppet store configs please set $using_store_configs to true in foreman/manifests/init.pp.
If you want this module to configure passenger as well, set $using_passenger to true in foreman/manifests/init.pp

usage:
	echo include foreman | puppet  --verbose --modulepath /path_to/tarball


See http://theforeman.org or at #theforeman irc channel

Copyright (c) 2010 Ohad Levy

This program and entire repository is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

