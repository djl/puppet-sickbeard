# == Class: sickbeard
#
# Install Sick Beard
#
# === Parameters
#
# [*install_dir*]
#   Where Sick Beard should be installed
#
# [*data_dir*]
#   The directory containing data created by Sick Beard
#
# [*user*]
#   The user Sick Beard should run as
#
# [*user_shell*]
#   The Sick Beard user's shell
#
# [*manage_user*]
#   Whether Puppet should manage this user
#
# [*address*]
#   The address Sick Beard should listening on
#
# [*port*]
#   The port number Sick Beard should be running on
#
# [*pidfile*]
#   The pidfile for the Sick Beard process
#
# [*repo*]
#   The upstream git repo from which Sick Beard will be installed
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
  $user_shell  = $sickbeard::params::user_shell,
  $manage_user = $sickbeard::params::manage_user,
  $address     = $sickbeard::params::address,
  $port        = $sickbeard::params::port,
  $pidfile     = $sickbeard::params::pidfile,
  $repo        = $sickbeard::params::repo,
) inherits sickbeard::params {

  validate_bool($manage_user)

  class { 'sickbeard::install': } ->
  class { 'sickbeard::config': } ~>
  class { 'sickbeard::service': } ->
  Class['sickbeard']
}
