# == Class: sickbeard::service
class sickbeard::service {
  service { 'sickbeard':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
