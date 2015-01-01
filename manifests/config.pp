# == Class: sickbeard::config
class sickbeard::config {
  case $::osfamily {
    'Debian': { $config_file = '/etc/default/sickbeard' }
    'RedHat': { $config_file = '/etc/sysconfig/sickbeard' }
    default: { fail("Unsupported OS: ${::osfamily}") }
  }

  file { $config_file:
    ensure  => present,
    content => template('sickbeard/config.erb'),
    mode    => '0644',
  }
}
