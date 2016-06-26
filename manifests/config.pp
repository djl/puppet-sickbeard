# == Class: sickbeard::config
class sickbeard::config {
  file { '/lib/systemd/system/sickbeard.service':
    ensure  => present,
    content => template('sickbeard/sickbeard.service.erb'),
    mode    => '0644',
  }
}
