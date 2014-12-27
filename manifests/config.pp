# == Class: sickbeard::config
class sickbeard::config {
  case $::osfamily {
    'Debian': {
      file { '/etc/default/sickbeard':
        ensure  => present,
        content => template('sickbeard/debian.default.erb'),
        mode    => '0644',
      }
    }
    default: {
    }
  }
}
