# == Class: sickbeard::config
class sickbeard::config {
  # TODO make this work on non-Debian platforms
  if $::osfamily == 'Debian' {
    file { '/etc/default/sickbeard':
      ensure  => present,
      content => template('sickbeard/debian.default.erb'),
      mode    => '0644',
    }
  }
}
