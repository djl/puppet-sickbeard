# == Class: sickbeard
#
# Install sickbeard
#
# === Parameters
#
# [*install_dir*]
#   Where sickbeard should be installed
#
# [*data_dir*]
#   The directory containing data created by sickbeard
#
# [*user*]
#   The user sickbeard should run as
#
# [*address*]
#   The address sickbeard should listening on
#
# [*port*]
#   The port number sickbeard should be running on
#
# [*pidfile*]
#   The pidfile for the sickbeard process
#
# [*repo*]
#   The upstream git repo from which sickbeard will be installed
#
# === Examples
#
#  class { 'sickbeard':
#    user => 'jim',
#  }
#
#  # use a custom repo
#  class { 'sickbeard':
#    repo => 'https://github.com/someone/sickbeard-forked',
#  }
#
class sickbeard (
  $install_dir = $sickbeard::params::install_dir,
  $data_dir    = $sickbeard::params::data_dir,
  $user        = $sickbeard::params::user,
  $address     = $sickbeard::params::address,
  $port        = $sickbeard::params::port,
  $pidfile     = $sickbeard::params::pidfile,
  $repo        = $sickbeard::params::repo,
) inherits sickbeard::params {

  class { 'sickbeard::install': } ->
  class { 'sickbeard::config': } ~>
  class { 'sickbeard::service': } ->
  Class['sickbeard']
}
