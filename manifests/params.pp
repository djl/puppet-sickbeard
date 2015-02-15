# == Class: sickbeard::params
class sickbeard::params {
  $install_dir = '/usr/share/sickbeard'
  $data_dir    = '/var/lib/sickbeard'
  $shows_dir   = '/var/lib/sickbeard/shows'
  $user        = 'sickbeard'
  $user_shell  = '/bin/false'
  $manage_user = true
  $address     = '0.0.0.0'
  $port        = '8081'
  $pidfile     = '/var/run/sickbeard/sickbeard.pid'
  $repo        = 'https://github.com/midgetspy/Sick-Beard'
}
